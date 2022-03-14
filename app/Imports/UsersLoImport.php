<?php

namespace App\Imports;

use App\Models\CompanyProfile;
use App\Models\LoManagement;
use Exception;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Row;
use Maatwebsite\Excel\Concerns\OnEachRow;

class UsersLoImport implements OnEachRow, WithStartRow
{
	function setCompany($company)
	{
		// try {
		$company = CompanyProfile::where('company_name', $company)->firstOrFail();
		return $company["id"];
		// } catch (Exception $e) {
		// return $this->company_profile[0]["id"];
		// }
	}

	public function onRow(Row $row)
	{
		// $rowIndex = $row->getIndex();
		$row      = $row->toArray();

		if ($row[1]) { // is email
			$lo = LoManagement::create([
				"name" => $row[0],
				"email" => $row[1],
				"phone_number" => $row[2],
				"company_id" => $this->setCompany($row[3]),
			]);
		}
	}

	public function startRow(): int
	{
		return 3;
	}
}
