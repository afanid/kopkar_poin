<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithMapping;

use App\Models\CandidateProfile;
use App\Models\JobList;
use Illuminate\Database\Eloquent\Builder;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;


class VacancyExport implements FromArray, WithHeadings, WithStyles, ShouldAutoSize, WithMapping
{
	protected $job;

	public function __construct($start, $end)
	{
		$this->job = JobList::with([
			'company.participationType',
			'jobListDivision.division',
		])->withCount([
			'logJobList',
			'logJobList as total_view' => function (Builder $query) use ($start, $end) {
				$query->where('log_action', 'view');
				$query->whereBetween('date', [$start, $end]);
			},
		])
			->withCount([
				'logJobList',
				'logJobList as total_chosen' => function (Builder $query) use ($start, $end) {
					$query->where('log_action', 'chosen');
					$query->whereBetween('date', [$start, $end]);
				},
			])
			->orderBy('total_view', 'DESC')
			->orderBy('total_chosen', 'DESC')
			->get()->toArray();
	}

	public function array(): array
	{
		return $this->job;
	}

	public function map($job): array
	{
		return [
			$job['job_name'],
			$job['position'],
			implode(", ", array_map(function ($val) {
				return $val['division']['name'];
			}, $job['job_list_division'])),
			$job['quota'],
			$job['company']['company_name'],
			$job['company']['participation_type']['name'],
			strval($job['total_view']),
			strval($job['total_chosen']),
		];
	}

	public function headings(): array
	{
		return [
			[
				'Job Vacancy',
				'Position',
				'Division',
				'Quota',
				'Company',
				'Participation Type',
				'Total View',
				'Total Chosen',
			],
			[
				'Berisi Nama Lowongan Kerja',
				'Berisi nama posisi lowongan kerja
				(Optional)',
				'Berisi Nama Divisi
				(Optional)',
				'Berisi kuota lowongan kerja
				(Optional)',
				'Berisi Nama Perusahaan',
				'Berisi jenis tipe partisipasi',
				'Berisi jumlah view lowongan

				(diambil dari berapa kandidat yang melihat detail lowongan tersebut)',
				'Berisi jumlah banyak lowongan dipilih kandidat 

				(diambil dari lowongan kerja yang dilamar oleh kandidat )',
			]
		];
	}

	public function styles(Worksheet $sheet)
	{
		$sheet->getStyle('A1:H1')->getFont()->setBold(true);
		$sheet->getStyle('A1:H1')->getFill()
			->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
			->getStartColor()->setARGB('FFFFFF00');
		$sheet->getStyle('B1:D1')->getFill()
			->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
			->getStartColor()->setARGB('FFFF0000');
		$sheet->getStyle('A2:H2')->getFill()
			->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
			->getStartColor()->setARGB('FFFFFF00');
		$sheet->getStyle('A1:H1')->applyFromArray([
			'borders' => [
				'allBorders' => [
					'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
					'color' => ['argb' => '000000'],
				],
			]
		]);
		$sheet->getStyle('A2:H2')->applyFromArray([
			'borders' => [
				'allBorders' => [
					'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
					'color' => ['argb' => '000000'],
				],
			]
		]);
	}
}
