<?php

/**
 * Count similarity between candidate and all company.
 *
 * @param  $candidate
 * @param  $company
 * @return array companyResult
 */
function matchFinderCandidate($candidate, $companies)
{
	$ca = [
		'division' => count(empty($candidate['work_experience']) ? [] : setDivision($candidate['work_experience'])),
		'skill' => count(setCandidateSkill(array_merge($candidate['candidate_skill'], $candidate['candidate_interest']))),
		'degree' => 1,
		'major' => 1,
	];

	$co = array();
	foreach ($companies as $company) {
		array_push($co, [
			'division' => count(array_intersect(
				empty($candidate['work_experience']) ? [] : setDivision($candidate['work_experience']),
				setDivision($company['job_list_division']),
			)),
			'skill' => count(array_intersect(
				setCandidateSkill(
					array_merge($candidate['candidate_skill'], $candidate['candidate_interest'])
				),
				setCompanySkill($company['company_match_finder']['company_match_finder_skill_interest'])
			)),
			'degree' => count(array_intersect(
				[end($candidate['education'])['degree']['id']],
				$company['company_match_finder']['degree'] ? [$company['company_match_finder']['degree']['id']] : [],
			)),
			'major' => count(array_intersect(
				[end($candidate['education'])['major']['id']],
				$company['company_match_finder']['major'] ? [$company['company_match_finder']['major']['id']] : [],
			)),
		]);
	}

	// Counting Distance
	for ($i = 0; $i < count($co); $i++) {

		// Division
		$var_division = pow(($ca['division'] - $co[$i]['division']), 2);

		// Degree
		$var_degree = pow(($ca['degree'] - $co[$i]['degree']), 2);

		// Major
		$var_major = pow(($ca['major'] - $co[$i]['major']), 2);

		// Skill
		$var_skill = pow(($ca['skill'] - $co[$i]['skill']), 2);

		// Count and Set Similarity
		$companies[$i]['similarity'] = 1 / (1 + ($var_division + $var_degree + $var_major + $var_skill));
	}

	usort($companies, function ($item1, $item2) {
		return $item2['similarity'] <=> $item1['similarity'];
	});

	return $companies;
}

/**
 * Count similarity between company and all candidate.
 *
 * @param  $company
 * @param  $candidate
 * @return array candidateResult
 */
function matchFinderCompany($company, $candidates)
{
	$co = [
		'division' => setCompanyDivision($company),
		'skill' => setCompanySkill($company),
		'degree' => setCompanyDegree($company),
		'major' => setCompanyMajor($company),
	];

	$ca = array();
	foreach ($candidates as $candidate) {
		array_push($ca, [
			'division' => array_intersect(
				$co['division'],
				empty($candidate['work_experience']) ? [] : setDivision($candidate['work_experience']),
			),
			'skill' => array_intersect(
				$co['skill'],
				setCandidateSkill(array_merge($candidate['candidate_skill'], $candidate['candidate_interest']))
			),
			'degree' => array_intersect(
				$co['degree'],
				[end($candidate['education'])['degree']['id']??'']
			),
			'major' => array_intersect(
				$co['major'],
				[end($candidate['education'])['major']['id']??'']
			),
		]);
	}

	// Counting Distance
	for ($i = 0; $i < count($ca); $i++) {

		// Division
		$var_division = pow((count($co['division']) - count($ca[$i]['division'])), 2);

		// Degree
		$var_degree = pow((count($co['degree']) - count($ca[$i]['degree'])), 2);

		// Major
		$var_major = pow((count($co['major']) - count($ca[$i]['major'])), 2);

		// Skill
		$var_skill = pow((count($co['skill']) - count($ca[$i]['skill'])), 2);

		$candidates[$i]['similarity'] = 1 / (1 + ($var_division + $var_degree + $var_major + $var_skill));
	}

	usort($candidates, function ($item1, $item2) {
		return $item2['similarity'] <=> $item1['similarity'];
	});

	// dd($candidates);
	return $candidates;
}

function setDivision($company)
{
	return array_map(function ($value) {
		return $value['division']['id'];
	}, $company);
}

function setCandidateSkill($candidate)
{
	return array_map(function ($value) {
		return $value['id'];
	}, $candidate);
}

function setCompanySkill($company)
{
	$res = [];
	foreach ($company as $co) {
		$arr = array_map(function ($value) {
			return $value['field_id'];
		}, $co['company_match_finder']['company_match_finder_skill_interest']);

		$res = array_merge($res, $arr);
	}

	return array_unique($res);
}

function setCompanyDivision($company)
{
	$res = [];
	foreach ($company as $co) {
		$arr = array_map(function ($value) {
			return $value['division']['id'];
		}, $co['job_list_division']);

		$res = array_merge($res, $arr);
	}

	return array_unique($res);
}

function setCompanyDegree($company)
{
	$res = [];
	foreach ($company as $co) {
		if ($co['company_match_finder']['degree_id']) {
			$arr = $co['company_match_finder']['degree_id'];
			array_push($res, $arr);
		} else {
			continue;
		}
	}

	return array_unique($res);
}

function setCompanyMajor($company)
{
	$res = [];
	foreach ($company as $co) {
		if ($co['company_match_finder']['major_id']) {
			$arr = $co['company_match_finder']['major_id'];
			array_push($res, $arr);
		} else {
			continue;
		}
	}

	return array_unique($res);
}
