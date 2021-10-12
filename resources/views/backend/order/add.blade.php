@extends('backend.layouts.master')

@section('main-content')

<div class="card">
    <h5 class="card-header">Add Order</h5>
    <div class="col-md-12">
       @include('backend.layouts.notification')
    </div>
    <div class="card-body">
      <form method="post" action="{{route('order.add')}}">
        {{csrf_field()}}
        
        <div class="form-group ">
          
          <label for="inputTitle" class="col-form-label">User 
            
            <span class="text-danger">*</span></label>
            
            <select name="user_id" class="form-control">
              <option value="">--Select any user--</option>
              @foreach($user as $users)
                <option value="{{$users->id}}">{{$users->email}}</option>
              @endforeach
            </select>
        
          @error('user_id')
              <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-row">
          <div class="form-group col-md-3">
        
          <label for="inputTitle" class="col-form-label">Phone<span class="text-danger">*</span></label>
          
          <input id="inputTitle" type="text" name="phone" placeholder="Phone No" class="form-control">

          @error('phone')
            
            <span class="text-danger">{{$message}}</span>
          
          @enderror
        
        </div>
        <div class="form-group col-md-3">
        
          <label for="inputTitle" class="col-form-label">Region<span class="text-danger">*</span></label>
          
          <input id="inputTitle" type="text" name="region" placeholder="Enter Region" class="form-control">

          @error('region')
            
            <span class="text-danger">{{$message}}</span>
          
          @enderror
        
        </div>
        <div class="form-group col-md-3">
        
          <label for="inputTitle" class="col-form-label">City<span class="text-danger">*</span></label>
          
          <input id="inputTitle" type="text" name="city" placeholder="Enter City" class="form-control">

          @error('city')
            
            <span class="text-danger">{{$message}}</span>
          
          @enderror
        
        </div>
        <div class="form-group col-md-3">
        
          <label for="inputTitle" class="col-form-label">Post Code<span class="text-danger">*</span></label>
          
          <input id="inputTitle" type="text" name="post_code" placeholder="Post Code" class="form-control">

          @error('postcode')
            
            <span class="text-danger">{{$message}}</span>
          
          @enderror
        
        </div>
        </div>
        

        <div class="form-group">
          <label for="inputDesc" class="col-form-label">Address</label>
          <textarea class="form-control" id="address" name="address1"></textarea>
          @error('address1')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>

        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Payment Method<span class="text-danger">*</span></label>
          <select name="payment_method" class="form-control">
              <option value="">--Select any Payment Method--</option>
              <option value="cod">Cash on Delivery</option>
              
          </select>
        
          @error('payment_method')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
      
        <div class="form-group">
          <label for="status">Status:</label>
          <select name="status" id=""  class="form-control">
            <option value="">--Select Status--</option>
            <option value="new" >New</option>
            <option value="recall" >Recall</option>
            <option value="cancel" >Cancel</option>
            <option value="confirmed" >Confirmed</option>
            <option value="delivered" >Delivered</option>
            <option value="returned" >Returned</option>
          </select>
        </div>
        <!-- <div class="form-group">
          <label for="status">Categories:</label>
          <input id="#new_category" type="text" name="new_category" class="form-control" placeholder="Add Category" style="display:none;">
          <select name="product_id" id="add_new" class="form-control">
            <option value="">--Select Category--</option>
            <option value="" id="add_new">Add New</option>
            @php
            $categories=App\Models\Category::get();
            @endphp
            @foreach($categories as $category)
            
            <option value="{{$category->id}}" >{{$category->title}}</option>
            @endforeach
          </select>
        </div> -->
        @php 
        $products=App\Models\Product::get();
        @endphp
        <div class="group">
            <div class="form-row">
             <div class="form-group col-md-3">
                <label for="status">Products *:</label>
                  <select class="form-control " name="cart[0][id]"  id="">
                  @foreach($products as $product) 
                  <option value="{{$product->id}}" data-price={{$product->price}}>{{$product->title}}</option>
                  @endforeach
                </select>
              </div>
              <div class="form-group col-md-3">
                   <label for="status">Quantity:</label>
                    <input class="form-control cart-quantity" type="input" name="cart[0][quantity]" value="1" />
              </div> 
              <div class="form-group col-md-3">
                  <label for="status">Price:</label>
                  <input class="form-control cart-price" type="input" name="cart[0][price]" />
              </div>
              </div>
        </div>
        <div class="form-group">
           <div class="newgroup">
           </div>
        </div>
       
        <div class="form-group">
          <span><a class="btn btn-primary" href="" id="repeat"><i class="fa fa-plus"></i></a> <a class="btn btn-danger"href="" id="remove"><i class="fa fa-minus"></i></a></span>
        </div>
        
        <div class="form-group">
          <label for="inputTitle" class="col-form-label">Payment Status<span class="text-danger">*</span></label>
            <select name="payment_status" class="form-control">
              <option value="">--Please Select Payment Status--</option>
                <option value="paid">Paid</option>
                <option value="unpaid">Unpaid</option>

            </select>
        </div>
        <div class="form-group">

          <label for="inputTitle" class="col-form-label">Shipping Charge<span class="text-danger">*</span></label>
            <i class="fa fa-times float-right " id="new_shipping_hide" style="color:red;margin: 20px 10px 0px 0px; display: none;" ></i>
            <div id="new_shipping" style="display:none;">
               
              <input  type="text" name="new_shipping" class="form-control" >
              <label for="inputTitle" class="col-form-label" >Shipping City<span class="text-danger">*</span></label>
              <input  type="text" name="shipping_city" class="form-control" >
            </div>
            
            <select name="shipping_id" class="form-control" id="add_new_shipping">
              <!--<option value="">--Please Select Shipping--</option> -->
              <option value="1">Add New</option>
              @foreach($shipping as $shippings)
                <option value="{{$shippings->id}}" {{$shippings->id==1?'selected':''}}>{{$shippings->price}}</option>
              @endforeach
            </select>
             @error('comments')
          
          @enderror
        </div>
        <div class="form-group">
          <label for="inputDesc" class="col-form-label">Comment</label>
          <textarea class="form-control"  name="comments"></textarea>
          @error('comments')
          <span class="text-danger">{{$message}}</span>
          @enderror
        </div>
        <div class="form-group mb-3">
          <button type="reset" class="btn btn-warning">Reset</button>
          <button class="btn btn-success" type="submit">Submit</button>
        </div>
      </form>
    </div>
</div>
<form role="form">                    
<div class="form-group vehicle-type">
    <label for="Vehicle"> Vehicle Name:</label>
    <select class="form-control">
        <option data-price="345">Title 1</option>
        <option data-price="122">Title 2</option>
    </select>
</div>
<div class="form-group">
    <label for="price"> Price</label>
    <input type="text" class="form-control price-input" readonly>
</div>
<div class="form-group vehicle-type">
    <label for="Vehicle"> Vehicle Name:</label>
    <select class="form-control">
        <option data-price="345">Title 1</option>
        <option data-price="122">Title 2</option>
    </select>
    <input type="text" class="form-control price-input" readonly>
</div>
<div class="form-group">
    <label for="price"> Price</label>
    <!-- <input type="text" class="form-control price-input" readonly> -->
</div>
</form>
@endsection

@push('styles')
<link rel="stylesheet" href="{{asset('backend/summernote/summernote.min.css')}}">
@endpush
@push('scripts')
<script src="/vendor/laravel-filemanager/js/stand-alone-button.js"></script>
<script src="{{asset('backend/summernote/summernote.min.js')}}"></script>
<script>
    $('#lfm').filemanager('image');

    $(document).ready(function() {
    $('#description').summernote({
      placeholder: "Write short description.....",
        tabsize: 2,
        height: 150
    });
    });

</script>
<script type="text/javascript">
   // $(document).ready(function(){ 
    
   //  $('#cart_submit').on('click',function(){
   //    console.log('ok');
   //    $('#cart_form').submit();
   //  });
   // });
  $(document).ready(function(){
  

    $('#add_new_shipping').on('change',function(){
      if($('#add_new_shipping').val() == '1') {
            $('#add_new_shipping').hide().prop("disabled", true).focus();

            $('#new_shipping').show().focus();
            $('#new_shipping_hide').show();

        } else {
            $('#new_shipping').hide();
            $('#add_new_shipping').show(); 
        } 
    });
    $('#new_shipping_hide').on('click',function(){

            $(this).hide();
            $('#add_new_shipping').show();
            $('#add_new_shipping').show().prop("disabled", false).focus(); 
            $('#new_shipping').hide(); 
         
    });
  });

</script>
<script type="text/javascript">
  var length=$('.group').length;
  mylength(length);
  console.log(length);
    $('#repeat').click(function(e){

    e.preventDefault();
    var newgroup = $('.group:last').clone(true);

    newgroup.find('input,select').each(function(){
        this.name = this.name.replace(/\[(\d+)\]/,function(str,p1){return '[' + (parseInt(p1,10)+1) + ']'});
    }).end().appendTo('.newgroup');
    // newgroup.find('select').each(function(){
    //             $(this).on('change',function(){
    //             var option = $(this).find('option:selected');
    //             var price =option.data('price');
    //             var pro_price=$(this).find('.cart-price');

    //             console.log(price);
                
    //             }); 
                  
    // }).end();

    var length=$('.group').length;
        
          mylength(length);

   
      });
    $('#remove').on('click',function(e){

      e.preventDefault();
      // console.log('ok');
    var newgroup=$('.newgroup>.group:last').remove();    
    
    });

    function mylength(length) {
      var cart=$('select[name^="cart"]').each(function() {
                
                $(this).on('change',function(){
                  var option = $(this).find('option:selected');
                  price=option.data('price');
                    console.log($(this).data(price));    
                });
                
              });
        var i;
        // for(i = 0; i < length; i++){
          
        //   console.log(cart);
        //   $('select[name^="cart"]').change(function(){
            
        //        // var length=$('[name="cart[i][]').length;
        //        // var price= $(this).data('price');
           
        //         // var option = $(this).find('option:selected');
        //         // var price =option.data('price');
        //         // console.log(price);
        //         // $('[name="cart[i][price]"]').val(price);  
            
           
              
        //    // console.log(price);
        //   });
        // }
      }
  
</script>
<!-- <script type="text/javascript">
   $('.vehicle-type').on('change', function() {
   $('.price-input').closest('.price-input').val(
    $(this).find(':selected').data('price')
  );
});
           

</script> -->

<!-- <script type="text/javascript">
  var i = 0; // Start at 0
$(document).ready(function() {
  $(".addCF").click(function() {
    
    i++;

    var newRow = $("#template").clone().removeAttr("hidden").removeAttr("aria-hidden"); 
        console.log(newRow);
    // Clone template and make it visible
    $(newRow).html(newRow.html().replace(/%/g, i)); // Replace the % by the i number
    $("#paramsFields").append(newRow);
  });
  $("#paramsFields").on('click', '.remCF', function() {
    $(this).parent().parent().remove();
  });
});
</script> -->
<!-- <script type="text/javascript">
  $(document).ready(function(){

   

    $('#add_cart').on('click',function() {

      
        var source = $('.cart')
          clone = source.clone();
          console.log(clone);
          clone.find(':select,input[name=cart[]).attr(cart[], function(i, val) {
            return val + count;
        });
        
        clone.insertBefore(this);
        
        count++;
    });
  });
</script> -->
<!-- <script type="text/javascript">
  
  $(document).ready(function(){
    alert('ok');
     (function() {

    var count = 0;

    $('#add_cart').on('click',function() {

        console.log('ok');
        var source = $('.cart'),
            clone = source.clone();

        clone.find(':input[name='cart[]']').attr('cart[]', function(i, val) {
            return val + count;
        });
        
        clone.insertBefore(this);
        
        count++;
    });

})();
  });

</script> -->
@endpush