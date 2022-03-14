<?php

namespace App\Exports;

use App\Models\CompanyProfile;
use Illuminate\Database\Eloquent\Builder;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\FromArray;


use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class CompanyExport implements FromArray, WithHeadings, WithStyles, ShouldAutoSize, WithMapping
{
	protected $company;

	public function __construct($start, $end)
	{
		$this->company = CompanyProfile::with([
			'user',
			'participationType',
		])->withCount([
			'logCompanyProfile',
			'logCompanyProfile as total_view' => function (Builder $query) use ($start, $end) {
				$query->where('log_action', 'view');
				$query->whereBetween('date', [$start, $end]);
			},
		])
			->withCount([
				'logCompanyProfile',
				'logCompanyProfile as total_chosen' => function (Builder $query) use ($start, $end) {
					$query->where('log_action', 'chosen');
					$query->whereBetween('date', [$start, $end]);
				},
			])
			->whereHas('user', function ($query) {
				$query->where('is_full_filled', 1);
			})
			->orderBy('total_view', 'DESC')
			->orderBy('total_chosen', 'DESC')
			->get()->toArray();
	}

	public function array(): array
	{
		return $this->company;
	}

	public function map($company): array
	{
		return [
			$company['company_name'],
			$company['participation_type']['name'],
			$company['user']['email'],
			$company['contact_person'],
			strval($company['total_view']),
			strval($company['total_chosen']),
		];
	}

	public function headings(): array
	{
		return [
			[
				'Company',
				'Participation Type',
				'PIC Email',
				'PIC Phone Number',
				'Total View',
				'Total Chosen',
			],
			[
				'Berisi nama perusahaan',
				'Berisi jenis tipe partisipasi',
				'Berisi Email PIC',
				'Berisi Nomor Handphone PIC',
				'Berisi jumlah view perusahaan

				(diambil dari berapa kandidat yang melihat profile perusahaan tersebut)',
				'Berisi jumlah banyak perusahaan dipilih karyawan 

				(diambil dari total applied Vacancy)',
			]
		];
	}

	public function styles(Worksheet $sheet)
	{
		$sheet->getStyle('A1:F1')->getFont()->setBold(true);
		$sheet->getStyle('A1:F1')->getFill()
			->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
			->getStartColor()->setARGB('FFFFFF00');
		$sheet->getStyle('A2:F2')->getFill()
			->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
			->getStartColor()->setARGB('FFFFFF00');
		$sheet->getStyle('A1:F1')->applyFromArray([
			'borders' => [
				'allBorders' => [
					'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
					'color' => ['argb' => '000000'],
				],
			]
		]);
		$sheet->getStyle('A2:F2')->applyFromArray([
			'borders' => [
				'allBorders' => [
					'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
					'color' => ['argb' => '000000'],
				],
			]
		]);
	}
}
