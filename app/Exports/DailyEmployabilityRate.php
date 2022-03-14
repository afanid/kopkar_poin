<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithMapping;

use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class DailyEmployabilityRate implements FromArray, WithHeadings, WithStyles, ShouldAutoSize, WithMapping
{
	protected $employabilityrate;

	public function __construct($employabilityrate)
	{
		$this->employabilityrate = $employabilityrate;
	}

	public function array(): array
	{
		return $this->employabilityrate;
	}

	public function map($employabilityrate): array
	{
		return [
			$employabilityrate['day'],
			strval($employabilityrate['total']),
			strval($employabilityrate['passed']),
			strval($employabilityrate['avg'])."%"
		];
	}

	public function headings(): array
	{
		return [
			[
				'Day',
				'Total Applicants',
				'Passed Applicants',
				'Employability Rate',
			],
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
