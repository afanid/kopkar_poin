<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class UsersLoExportTemplate implements WithHeadings, WithStyles, ShouldAutoSize
{
	public function headings(): array
	{
		return [
			[
				'Upload Format For User Liaison Officer(LO)'
			],
			[
				'Name',
				'Lo Email',
				'Phone Number',
				'Company',
			]
		];
	}

	public function styles(Worksheet $sheet)
	{
		return [
			// Style the first row as bold text.
			1    => ['font' => ['bold' => true]],
		];
	}
}
