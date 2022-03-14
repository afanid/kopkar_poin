<?php

use Illuminate\Support\Facades\Auth;

function filterMenu()
{


	$listMenu = [
		(object) [
			"menu_id" => 'candidate-profile',
			"title" => "Profile",
			"path" => "/candidate/profile",
			"roles" => "candidate",
		],
		(object) [
			"menu_id" => 'candidate-company-list',
			"title" => "Company List",
			"path" => "/candidate/company-list",
			"roles" => "candidate",
		],
		(object) [
			"menu_id" => 'candidate-interview-list',
			"title" => "Interview Schedule",
			"path" => "/candidate/interview-list",
			"roles" => "candidate",
		],
		(object) [
			"menu_id" => 'company-profile',
			'title' => 'Profile',
			'path' => '/company/profile',
			'roles' => 'company'
		],
		(object) [
			"menu_id" => 'job-list',
			'title' => 'Job List',
			'path' => '/company/job-list',
			'roles' => 'company'
		],
		(object) [
			"menu_id" => 'interviewer-list',
			'title' => 'Interviewer List',
			'path' => '/company/interviewer-list',
			'roles' => 'company'
		],
		(object) [
			"menu_id" => 'candidate-list',
			'title' => 'Candidate List',
			'path' => '/company/candidate-list',
			'roles' => 'company'
		],
		(object) [
			"menu_id" => 'company-interview-list',
			"title" => "Interview Schedule",
			"path" => "/company/interview-list",
			"roles" => "company",
		],
		(object) [
			"menu_id" => 'dashboard',
			'title' => 'Dashboard',
			'path' => '/admin/dashboard',
			'roles' => 'admin'
		],
		(object) [
			"menu_id" => 'master-data',
			'title' => 'Master Data',
			'path' => '/admin/meta',
			'roles' => 'admin'
		],
		(object) [
			"menu_id" => 'website-management',
			'title' => 'Website Management',
			'path' => '/admin/cms',
			'roles' => 'admin'
		],
		(object) [
			"menu_id" => 'user-management',
			"title" => "User Management",
			"path" => "/",
			"roles" => "admin",
			"child" => [
				(object) [
					"menu_id" => 'company',
					"title" => "Company",
					"path" => "/admin/user-management/company",
					"roles" => "admin"
				],
				(object) [
					"menu_id" => 'candidate',
					"title" => "Candidate",
					"path" => "/admin/user-management/candidate",
					"roles" => "admin"
				]
			]
		],
		(object) [
			"menu_id" => 'liaison-officer',
			'title' => 'Liaison Officer List',
			'path' => '/admin/liaison-officer',
			'roles' => 'admin'
		],
		(object) [
			"menu_id" => 'interview-monitor',
			"title" => "Interview Monitor",
			"path" => "/admin/interview-monitor",
			"roles" => "admin",
		],
		(object) [
			"menu_id" => 'conversion-report',
			"title" => "Conversion Report",
			"path" => "/admin/conversion-report",
			"roles" => "admin",
		],
	];

	// don't edit code after this line !!!
	$resultMenu = [];
	try {
		$userRole = auth()->user()->roles->name;
		// dd($userRole);
	} catch (Exception $e) {
		return [];
	}

	foreach ($listMenu as $menu) {

		if (property_exists($menu, 'child')) {

			$submenu = [];
			foreach ($menu->child as $child) {

				if (isAuthorized($child->roles, $userRole)) {
					array_push($submenu, $child);
				}
			}

			if (count($submenu) > 0) {
				array_push($resultMenu, (object) [
					'menu_id' => $menu->menu_id,
					'title' => $menu->title,
					'path' => $menu->path,
					'child' => $submenu,
				]);
			}

			$submenu = [];
		} else {

			// if (isAuthorized($menu->roles, $userRole->name)) {
			if (isAuthorized($menu->roles, $userRole)) {
				array_push($resultMenu, $menu);
			}
		}
	}

	return $resultMenu;
}


function isAuthorized($rolestr, $userRole)
{
	$roles = explode("|", $rolestr);

	foreach ($roles as $role) {
		if ($role == $userRole) {
			return true;
		}
	}

	return false;
}
