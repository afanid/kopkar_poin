<?php

namespace App\Traits;

trait UpdateOrCreateOnNull
{
	public static function updateOrCreateOnNull($id, $values = [])
	{
		if (is_null($id)) {
			$model = new self();
		} else {
			$model = self::find($id);
		}
		// dd($values);
		$model->fill($values);
		$model->save();
		return $model;
	}
}
