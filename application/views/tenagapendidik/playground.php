<?php
// echo "<pre>";
// $pengguna = $this->model->readS('pengguna')->result();
// foreach ($pengguna as $key => $value) {
// 	$nama = $value->nama;
// 	$explode = explode(" ", $nama);
// 	$alias 	= '';
// 	$temp_alias = '';
// 	foreach ($explode as $keyA => $valueA) {
// 		$temp_alias .= $valueA." ";
// 		if (strlen($temp_alias) <= 20) {
// 			$alias .= $valueA;
// 			if ($keyA !== (sizeof($explode)-1)) {
// 				$alias .=" ";
// 			}
// 		}
// 	}
// 	if (strlen($nama) !== strlen($alias) AND strlen($alias) < 20) {
// 		$alias .= substr($explode[$keyA], 0,1);
// 	}
// 	$this->model->update('pengguna',array('id'=>$value->id),array('alias'=>$alias));
// }
$record = $this->model->rawQuery("SELECT
	CONCAT(villages.name,', ',districts.name,', ',regencies.name,', ',provinces.name) AS record
	FROM
	provinces
	INNER JOIN regencies ON regencies.province_id = provinces.id
	INNER JOIN districts ON districts.regency_id = regencies.id
	INNER JOIN villages ON villages.district_id = districts.id

	")->result();

$string = "INSERT INTO lokasi VALUES ";

for ($i=68001; $i <= 80434; $i++) { 
	// per 5 ribu aja bisanya
	// 21696
	$record[$i]->record = strtolower($record[$i]->record);
	$string .= '(NULL,"'.ucwords($record[$i]->record).'"),';
}
$string = rtrim($string, ", ");

$this->db->close();

$conn = new mysqli("localhost", "root", "", "berguru");
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
} 

$conn->query($string);

// echo "INSERT INTO lokasi VALUES $string";

$conn->close();
?>

<!-- <!DOCTYPE html>
<html>
<head>
	<title></title>
	<link href="<?=base_url()?>assets/assets/libs/Select2-4.0.6-rc.1/css/select2.min.css" rel="stylesheet">
		<script src="<?=base_url()?>assets/assets/libs/jquery.3.3.1/jquery-3.3.1.js"></script>
	<script src="<?=base_url()?>assets/assets/libs/Select2-4.0.6-rc.1/js/select2.min.js" charset="utf-8"></script>
</head>
<body>

<script type="text/javascript">
$(document).ready(function() {	
	$(".penerima").Select2({
		ajax: {
			url: '<?=base_url()?>Admin/cariNama/',
			delay: 1000,
			data: function (term, page) {
				return {
					term: term, // search term
					page: 10
				};
			},
			processResults: function (data, page) {
				// console.log(data);
				return {
					results: data
				};
			},
			cache: true
		},
		escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
		minimumInputLength: 1
	});
    // $('#penerima').select2();
});
</script>

<select class="penerima" id="penerima" style="width: 300px">
	<option>asd</option>
	<option>asdpol</option>
	<option>asdpolk ihkj</option>
</select>

</body>
</html> -->