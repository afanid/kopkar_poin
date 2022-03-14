<?php

namespace App\Imports;

use Exception;
use App\Models\CandidateProfile;
use App\Models\EducationProfile;
use App\Models\RegistrationDay;
use App\Models\Roles;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Row;
use Maatwebsite\Excel\Concerns\OnEachRow;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class UsersCandidateImport implements  WithMultipleSheets, OnEachRow, WithStartRow
{
	protected $role;

	public function __construct()
	{
		$this->role = Roles::select('id')->where('role_name', 'candidate')->first();
	}

	function setRegistrationDay($day)
	{
		// try {
		$day = RegistrationDay::where('name', $day)->firstOrFail();
		return $day["id"];
		// } catch (Exception $e) {
		// 	// return $this->registration_day[0]["id"];
		// }
	}

	public function onRow(Row $row)
	{
		// $rowIndex = $row->getIndex();
		$row      = $row->toArray();

		if ($row[2]) { // is email
			$user = User::create([
				"email" => $row[2],
				"password" => Hash::make('CDCprasmul1234'),
				"role_id" => $this->role['id'],
				"is_full_filled" => false,
				"is_active" => $row[4] == "Yes" ? true : false,
			]);

			$candidate = CandidateProfile::create([
				"user_id" => $user['id'],
				"registration_day_id"	=> $this->setRegistrationDay($row[3]),
				"name"			=> $row[1],
				"phone_number"		=> '',
				"photo"		=> '',
			]);

			$education = EducationProfile::create([
				"candidate_id" => $candidate["id"],
				"nim" => $row[0],
			]);
		}
	}

	public function startRow(): int
	{
		return 3;
	}

	public function sheets(): array
    {
        return [
             0 => $this,
        ];
    }
}
