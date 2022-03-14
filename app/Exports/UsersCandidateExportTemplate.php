<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class UsersCandidateExportTemplate implements WithHeadings, WithStyles, ShouldAutoSize
{
	public function headings(): array
	{
		return [
			[
				'Upload Format For User Candidate'
			], 
			[
				'Student ID',
				'Name',
				'Email',
				'Registration Day',
				'Is Active',
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
