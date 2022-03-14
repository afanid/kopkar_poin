<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\FromArray;

use App\Models\CandidateProfile;
use Illuminate\Database\Eloquent\Builder;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class CandidateExport implements FromArray, WithHeadings, WithStyles, ShouldAutoSize, WithMapping
{

	protected $candidate;

	public function __construct($start, $end)
	{
		$this->candidate = CandidateProfile::with([
			'user',
			'currentEducation.major',
			'currentEducation.degree',
			'currentEducation.faculty',
			'logCandidateProfile',
			'registrationDay'
		])
			->withCount([
				'logCandidateProfile',
				'logCandidateProfile as total_view' => function (Builder $query) use ($start, $end) {
					$query->where('log_action', 'view');
					$query->whereBetween('date', [$start, $end]);
				},
			])
			->withCount([
				'logCandidateProfile',
				'logCandidateProfile as total_chosen' => function (Builder $query) use ($start, $end) {
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
		return $this->candidate;
	}

	public function map($candidate): array
	{
		// dd($candidate);
		return [
			$candidate['current_education']['nim'],
			$candidate['name'],
			$candidate['current_education']['faculty']['name'],
			$candidate['current_education']['major']['name'],
			$candidate['current_education']['degree']['name'],
			$candidate['current_education']['enrollment_year'],
			$candidate['registration_day']['name'],
			strval($candidate['total_view']),
			strval($candidate['total_chosen']),
		];
	}

	public function headings(): array
	{
		return [
			[
				'Student ID',
				'Name',
				'Faculty',
				'Major',
				'Degree',
				'Entrollment Year',
				'Registered Day',
				'Total View',
				'Total Chosen',
			],
			[
				'Berisi Nomor induk Mahasiswa',
				'Berisi Nama Mahasiswa',
				'Berisi nama Fakultas Kandidat',
				'Berisi nama Jurusan Kandidat',
				'Berisi tingkat akademik kandidat',
				'Berisi Tahun pendaftaran Kandidat',
				'Berisi Hari terdaftar kandidat di VCF',
				'Berisi jumlah view Kandidat

				(diambil dari berapa perusahaan yang melihat profile kandidat tersebut)',
				'Berisi jumlah banyak kandidat dipilih perusahaan 

				(diambil dari total closed Interview)',
			]
		];
	}

	public function styles(Worksheet $sheet)
	{
		$sheet->getStyle('A1:I1')->getFont()->setBold(true);
		$sheet->getStyle('A1:I1')->getFill()
			->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
			->getStartColor()->setARGB('FFFFFF00');
		$sheet->getStyle('A2:I2')->getFill()
			->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
			->getStartColor()->setARGB('FFFFFF00');
		$sheet->getStyle('A1:I1')->applyFromArray([
			'borders' => [
				'allBorders' => [
					'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
					'color' => ['argb' => '000000'],
				],
			]
		]);
		$sheet->getStyle('A2:I2')->applyFromArray([
			'borders' => [
				'allBorders' => [
					'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
					'color' => ['argb' => '000000'],
				],
			]
		]);
	}
}
