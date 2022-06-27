<!DOCTYPE html>
<html lang="tr">
<head>
  <title>ICM Servis Kaydı</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
  
<style>
    .btn-primary {
    margin-top: 15px;
}
</style>
</head>
<body>

<div class="jumbotron text-center">
  <h1>Servis Kayıt</h1>
  <p>Aşağıda bulunan formu doldurarak servis kaydı oluşturabilirsiniz.</p> 
</div>
  
<div class="container">
  <div class="row">
      @csrf
    
  <div class="col-md-3 col-sm-12">

      <label for="car_brand">Araç Markası</label>
      <select name="car_brand" class="custom-select" id="car_brand" required>
        <option selected disabled value="">Marka Seçiniz.</option>
        @foreach($car_brands as $brand)
        <option value="{{$brand->brand_id}}" >{{$brand->brand_name}}</option>
        @endforeach
      </select>


    </div>

    <div  class="col-md-3 col-sm-12">
     <label for="car_model">Araç Model</label>
      <select name="car_model" class="custom-select" id="car_model" required>
        <option selected disabled value="">Model Seçiniz.</option>
      </select>
    </div>

  <div class="col-md-3 col-sm-12">
   <label for="customer_name">Müşteri Adı</label>
    <input type="text" required name="customer_name" class="form-control" placeholder="Müşteri Adı Giriniz." id="customer_name">
    </div>


    <div class="col-md-3 col-sm-12">
   <label for="date">Tamir Tarihi</label>
    <input name="date" type="text" required readonly class="form-control" id="date">
    </div>

   <div class="col-md-3 col-sm-12">
    <label for="repair_hour">Tamir Saati</label>
      <select name="repair_hour" class="custom-select" id="repair_hour" required>
        <option selected disabled value="">Tamir Saati Seçiniz.</option>
        @for($i=0;$i < 24 ;$i++)
        <option value='{{sprintf("%02d", $i)}}:00:00' >{{sprintf("%02d", $i)}} : 00</option>
        <option value='{{sprintf("%02d", $i)}}:30:00'>{{sprintf("%02d", $i)}} : 30</option>
        @endfor
      </select>
    </div>
        <div class="col-md-3 col-sm-12">
     <label for="repair_type">Tamir Türü</label>
      <select name="repair_type" class="custom-select" id="repair_type" required>
        <option selected disabled value="">Tamir Türü Seçiniz.</option>
        @foreach($service_repair_types as $type)
        <option value="{{$type->type_name}}" >{{$type->type_name}}</option>
        @endforeach

      </select>
    </div>

      <div class="col-md-3 col-sm-12">
    <label for="repair_place">Tamir Yeri</label>
      <select name="repair_place" class="custom-select" id="repair_place" required>
        <option selected disabled value="">Tamir Yeri Seçiniz.</option>
      </select>
    </div>

    <div class="col-12 text-center">
    <div class="formNote"></div>
       <button type="button" id="save" class="btn btn-primary" name="button">Kaydet</button>
    </div>
  </div>

</div>


</body>

<script>
$( function() {

$( "#date" ).datepicker({
 dateFormat: "dd.mm.yy",
 altFormat: "yy-mm-dd",
 altField:"#tarih-db",
 monthNames: [ "Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık" ],
 dayNamesMin: [ "Pa", "Pt", "Sl", "Ça", "Pe", "Cu", "Ct" ],
 firstDay:1
});
} );
</script>

<script>

  $.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
    });

  $('#car_brand').change(function() {

  var car_brand=$(this).val();
    $.ajax({
  type: 'POST',
  url: '/post/get_models',
  data: {
    car_brand: car_brand
  },
  success: function(data) {
    $('#car_model').html(data);
  },
  error: function(data) {
    alert('Bir Hata Oluştu.');
  },
});
    
});
  $('#repair_type').change(function() {

  var date=$('#date').val();
  var repair_hour=$('#repair_hour').val();

  var repair_type=$(this).val();
    $.ajax({
  type: 'POST',
  url: '/post/get_place',
  data: {
    repair_type: repair_type,
    date: date,
    repair_hour: repair_hour
  },
  success: function(data) {
    $('#repair_place').html(data);
  },
  error: function(data) {
    alert('Bir Hata Oluştu.');
  },
});
    
});

$( "#save" ).click(function() {
  var car_brand=$('#car_brand').val(); if(car_brand==null){ return alert('Lütfen Araç Markası Seçiniz'); }
  var car_model=$('#car_brand').val(); if(car_model==null){ return alert('Lütfen Araç Modeli Seçiniz'); }
  var customer_name=$('#customer_name').val(); if(customer_name==""){ return alert('Lütfen Müşteri Adı Giriniz.'); }
  var repair_type=$('#repair_type').val(); if(repair_type==null){ return alert('Lütfen Tamir Türü Seçiniz'); }
  var repair_place=$('#repair_place').val(); if(repair_place==null){ return alert('Lütfen Tamir Yeri Seçiniz'); }
  var date=$('#date').val(); if(date==""){ return alert('Lütfen Tamir Tarihi Seçiniz'); }
  var repair_hour=$('#repair_hour').val(); if(repair_hour==null){ return alert('Lütfen Tamir Saati Seçiniz'); }

    $.ajax({
  type: 'POST',
  url: '/post/save_service',
  data: {
    car_brand: car_brand,
    car_model: car_model,
    customer_name: customer_name,
    repair_type: repair_type,
    repair_place: repair_place,
    date: date,
    repair_hour: repair_hour
  },
  success: function(data) {
    if(data=="success"){
      alert('Kayıt başarıyla oluşturulmuştur.');
      location.reload();
    }else{
      alert(data);
    }
  },
  error: function(data) {
    console.log(data);
  },
});


});

</script>

</html>
