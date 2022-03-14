<?php

namespace App\Imports;

use Exception;
use App\Models\CompanyProfile;
use App\Models\InterviewerList;
use App\Models\MeetingGroup;
use App\Models\ParticipationType;
use App\Models\Roles;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Row;
use Maatwebsite\Excel\Concerns\OnEachRow;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class UsersCompanyImport implements WithMultipleSheets, OnEachRow, WithStartRow
{
	protected $role;
	protected $faker;

	public function __construct()
	{
		$this->role = Roles::select('id')->where('role_name', 'company')->first();
		$this->faker = \Faker\Factory::create('id_ID');
	}

	function setParticipationType($type)
	{
		// try {
		$type = ParticipationType::where('name', $type)->firstOrFail();
		return $type["id"];
		// } catch (Exception $e) {
		// return $this->participation_type[0]["id"];
		// }
	}

	function setMeetingGroup($name)
	{
		$group = MeetingGroup::where('group_name', $name)->firstOrFail();
		return $group["id"];
	}

	public function onRow(Row $row)
	{
		// $rowIndex = $row->getIndex();
		$row      = $row->toArray();

		if ($row[1]) { // is email
			$user = User::create([
				"email" => $row[1],
				"password" => Hash::make('CDCprasmul1234'),
				"role_id" => $this->role['id'],
				"is_full_filled" => false,
				"is_active" => $row[4] == "Yes" ? true : false,
			]);

			$company = CompanyProfile::create([
				"user_id" => $user['id'],
				"participation_type_id"	=> $this->setParticipationType($row[2]),
				"company_name"			=> $row[0],
				"contact_person"		=> '',
				"company_website"		=> '',
				"about_company"			=> '',
				"address"				=> '',
				"logo"					=> '',
				"meeting_group_id" => $this->setMeetingGroup($row[3]),
			]);

			$participation_type = ParticipationType::find($company['participation_type_id']);
			$max_interviewer = $participation_type['total_interviewer'];

			for ($i = 0; $i < $max_interviewer; $i++) {
				$interviewer = InterviewerList::create([
					"company_id" => $company["id"],
					"name" =>  "interviewer $i",
					"phone_number" => '',
					"email" =>  $user["email"],
					"is_active" => 1
				]);
			}
			// dd($row);
		}
	}

	public function startRow(): int
	{
		return 3;
	}

	// Reading the first sheet
	public function sheets(): array
    {
        return [
             0 => $this,
        ];
    }
}
