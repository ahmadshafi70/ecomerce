@extends('backend.layouts.master')

@section('title','Order Detail')

@section('main-content')
<div class="row">
         <div class="col-md-12">
            @include('backend.layouts.notification')
         </div>
     </div>
<div class="card">
  <h5 class="card-header">Order       
    <a href="{{route('order.pdf',$order->id)}}" class=" btn btn-sm btn-primary shadow-sm float-right"><i class="fas fa-download fa-sm text-white-50"></i>Generate PDF</a>
  </h5>
  <style type="text/css">
   input, optgroup, select, textarea {
    border: none;
    color: #858796;
    margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
  }

  select {
     padding: 5px;
    -webkit-appearance: none;
  }
</style>
  <div class="card-body">
        <center center="order-filter">
              <span ><a class="btn btn-primary active" href="{{route('order.index')}}"><i class="fas fa-plus-square"></i> All</a></span>
            <span ><a class="btn btn-primary active" href="{{route('order.search','new')}}"><i class="fas fa-plus-square"></i> New</a></span>
            <span ><a class="btn btn-primary" href="{{route('order.search','recall')}}"><i class="fas fa-retweet"></i> Recall</a></span>
           
            <span ><a class="btn btn-primary" href="{{route('order.search','confirmed')}}"><i class="fas fa-check-square"></i>  Confirmed</a></span>
            <span ><a class="btn btn-primary" href="{{route('order.search','delivered')}}"><i class="fas fa-truck"></i> Delivered</a></span>
            <span ><a class="btn btn-primary" href="{{route('order.search','returned')}}"><i class="fas fa-history"></i> Rerturned</a></span>
             <span ><a class="btn btn-primary" href="{{route('order.search','cancel')}}"><i class="fas fa-window-close"></i> Canceled</a></span>
        </center>
    @if($order)
    <table class="table table-striped table-hover">
      @php
          $shipping_charge=DB::table('shippings')->where('id',$order->shipping_id)->pluck('price');
      @endphp 
      
      <thead>
        <tr>
            <th>S.N.</th>
            <th>Order No.</th>
            <th>Name</th>
            <th>Comments</th>
            <!-- <th>Email</th> -->
            <th>Phone No.</th>
            <th>Quantity</th>
            <!-- <th>Charge</th> -->
            <th>Price</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td>{{$order->id}}</td>
            <td>{{$order->order_number}}</td>
            <td>{{$order->first_name}} {{$order->last_name}}</td>
            <!-- <td>{{$order->email}}</td> -->
            <td>{{Str::limit($order->comments,70)}}</td>
            <td>{{$order->phone}}</td>
            <td>{{$order->quantity}}</td>
            <!-- <td>@foreach($shipping_charge as $data) PKR {{number_format($data,2)}} @endforeach</td> -->
            <td>PKR{{number_format($order->total_amount,2)}}</td>
            <td>
                @if($order->status=='new')
                          <span class="badge badge-primary">{{$order->status}}</span>
                        @elseif($order->status=='recall')
                          <span class="badge badge-secondary">{{$order->status}}</span>
                        
                        @elseif($order->status=='cancel')
                          <span class="badge badge-danger">{{$order->status}}</span>
                        
                        @elseif($order->status=='confirmed')
                          <span class="badge badge-info">{{$order->status}}</span>
                        
                        @elseif($order->status=='delivered')
                          <span class="badge badge-success">{{$order->status}}</span>
                        
                        @elseif($order->status=='returned')
                          <span class="badge badge-dark">{{$order->status}}</span>
                        @else
                          <span class="badge badge-danger">{{$order->status}}</span>
                        @endif
            </td>
            <td>
               <!--  <a href="{{route('order.edit',$order->id)}}" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="edit" data-placement="bottom"><i class="fas fa-edit"></i></a>
                <form method="POST" action="{{route('order.destroy',[$order->id])}}"> -->
                  @csrf 
                  @method('delete')
                      <button class="btn btn-danger btn-sm dltBtn" data-id={{$order->id}} style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>
                </form>
            </td>
          
        </tr>
      </tbody>
    </table>
      
    <section class="confirmation_part section_padding">
      <div class="order_boxes">
        <form action="{{route('order.save',$order->id)}}" method="POST">
          @csrf
          <div class="row">

          <div class="col-lg-6 col-lx-4">
            <div class="order-info">
              <h4 class="text-center pb-4">ORDER INFORMATION</h4>
              <table class="table">
                    <tr class="">
                        <td>Order Number :</td>
                        <td><input type="text" name="order_number" value="{{$order->order_number}}">  </td>
                    </tr>
                    <tr>
                        <td>Order Date</td>
                        <td> : {{$order->created_at->format('D d M, Y')}} at {{$order->created_at->format('g : i a')}} </td>
                    </tr>
                    <tr>
                        <td>Quantity:</td>
                        <td>  :<input type="text" name="quantity" value="{{$order->quantity}}"></td>
                    </tr>
                    <tr>
                        <td>Order Status</td>
                        <td>  :<select name="status" id="" >
              <option value="">--Select Status--</option>
              <option value="new" {{(($order->status=='new')? 'selected' : '')}}>New</option>
              <option value="recall" {{(($order->status=='recall')? 'selected' : '')}}>Recall</option>
             
              <option value="cancel" {{(($order->status=='cancel')? 'selected' : '')}}>Cancel</option>
              <option value="confirmed" {{(($order->status=='confirmed')? 'selected' : '')}}>Confirmed</option>
              <option value="delivered" {{(($order->status=='delivered')? 'selected' : '')}}>Delivered</option>
              <option value="returned" {{(($order->status=='returned')? 'selected' : '')}}>Returned</option>

            </select>: </td>
                    </tr>
                    <tr>
                      @php
                          $shipping_charge=DB::table('shippings')->where('id',$order->shipping_id)->pluck('price');
                      @endphp
                          @php
                           $all_shipping=DB::table('shippings')->get();
                          @endphp 
                          
                        <td>Shipping Charge</td>
                        <td> :<select name="shipping_id">
                              @foreach($all_shipping as $shipping)
                            
                              <option value="{{$shipping->id}}" {{(($order->shipping_id==$shipping->id)?'selected' : '')}}>{{$shipping->price}}
                                  </option>
                              @endforeach 
                            </select>
                         </td>
                    </tr>
                   
                    <tr>
                        <td>Price</td>
                        <td> :<input type="text" name="sub_total" value="{{$order->sub_total}}"></td>
                    </tr>
                    <tr>
                        <td>Payment Method</td>
                        <td> : @if($order->payment_method=='cod') Cash on Delivery @else Paypal @endif</td>
                    </tr>
                    <tr>
                        <td>Payment Status</td>
                        <td> : 
                            <select name="payment_status" >
                              <option value="paid" {{(($order->payment_status=='paid')? 'selected':'')}} >Paid</option>
                              <option value="unpaid" {{(($order->payment_status=='unpaid')? 'selected':'')}}>Unpaid</option>
                            </select>
                        </td>
                    </tr>
              </table>
            </div>
          </div>

          <div class="col-lg-6 col-lx-4">
            <div class="shipping-info">
              <h4 class="text-center pb-4">SHIPPING INFORMATION</h4>
              <table class="table">
                    <tr class="">
                        <td>Full Name</td>
                        <td> : <input type="text" name="first_name" value="{{$order->first_name}}" style="width: 70px;"> <input type="text" name="last_name" value="{{$order->last_name}}" style="width: 70px;"></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td> : <input type="text" name="email" value="{{$order->email}}" ></td>
                    </tr>
                    <tr>
                        <td>Phone No.</td>
                        <td> : <input type="text" name="phone"  value="{{$order->phone}}" ></td>
                    </tr>
                    <tr>
                        <td>Address2</td>
                        <td> : <textarea name="address1">{{$order->address1}}</textarea>, </td>
                    </tr>
                    <tr>
                        <td>Comments</td>
                        <td> : <textarea name="comments">{{$order->comments}}</textarea>, </td>
                    </tr>
                    <tr>
                        <td>Address2</td>
                        <td> : <textarea name="address2">{{$order->address2}}</textarea>, </td>
                    </tr>
                    <tr>
                        <td>Region</td>
                        <td> : <input type="text" name="region" value="{{$order->region}}"></td>
                    </tr>
                    <tr>
                        <td>Lahore</td>
                        <td> : <input type="text" name="city" value="{{$order->city}}"></td>
                    </tr>
                    <tr>
                        <td>Post Code</td>
                        <td> : <input type="text" name="post_code" value="{{$order->post_code}}" ></td>
                    </tr>
              </table>
            </div>
          </div>
          </div>
          <button type="submit" class="btn btn-primary" style="margin-left:25px;">Save</button> 
           <button class="btn btn-danger  dltBtn" data-id={{$order->id}}  data-toggle="tooltip" data-placement="bottom" title="Delete">Delete</button>
        </form>
       

        
      </div>
    </section>
    <div class="row">
      <div class="offset-md-8 col-md-3 float-left">
        <div class="card " style="float:right;">
        <h5 class="card-header">Order stutus Edit</h5>
        <div class="card-body">
        <form action="{{route('order.update',$order->id)}}" method="POST">
          @csrf
          @method('PATCH')
          <div class="form-group">
            <label for="status">Status :</label>
            <select name="status" id=""  style="border:1px solid #858796;">
              <option value="">--Select Status--</option>
              <option value="new" {{(($order->status=='new')? 'selected' : '')}}>New</option>
              <option value="recall" {{(($order->status=='recall')? 'selected' : '')}}>Recall</option>
             
              <option value="cancel" {{(($order->status=='cancel')? 'selected' : '')}}>Cancel</option>
              <option value="confirmed" {{(($order->status=='confirmed')? 'selected' : '')}}>Confirmed</option>
              <option value="delivered" {{(($order->status=='delivered')? 'selected' : '')}}>Delivered</option>
              <option value="returned" {{(($order->status=='returned')? 'selected' : '')}}>Returned</option>

            </select>
          </div>
          <button type="submit" class="btn btn-primary">Update</button>
           
        </div>
      </div>
      </div>
      
    </div>
    <!-- <section class="confirmation_part section_padding">
      <div class="order_boxes">
        <div class="row">
          <div class="col-lg-6 col-lx-4">
            <div class="order-info">
              <h4 class="text-center pb-4">ORDER INFORMATION</h4>
              <table class="table">
                    <tr class="">
                        <td>Order Number</td>
                        <td> : {{$order->order_number}}</td>
                    </tr>
                    <tr>
                        <td>Order Date</td>
                        <td> : {{$order->created_at->format('D d M, Y')}} at {{$order->created_at->format('g : i a')}} </td>
                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td> : {{$order->quantity}}</td>
                    </tr>
                    <tr>
                        <td>Order Status</td>
                        <td> : {{$order->status}}</td>
                    </tr>
                    <tr>
                      @php
                          $shipping_charge=DB::table('shippings')->where('id',$order->shipping_id)->pluck('price');
                      @endphp
                        <td>Shipping Charge</td>
                        <td> : PKR {{number_format($shipping_charge[0],2)}}</td>
                    </tr>
                    <tr>
                      <td>Coupon</td>
                      <td> : PKR {{number_format($order->coupon,2)}}</td>
                    </tr>
                    <tr>
                        <td>Total Amount</td>
                        <td> : PKR {{number_format($order->total_amount,2)}}</td>
                    </tr>
                    <tr>
                        <td>Payment Method</td>
                        <td> : @if($order->payment_method=='cod') Cash on Delivery @else Paypal @endif</td>
                    </tr>
                    <tr>
                        <td>Payment Status</td>
                        <td> : {{$order->payment_status}}</td>
                    </tr>
              </table>
            </div>
          </div>

          <div class="col-lg-6 col-lx-4">
            <div class="shipping-info">
              <h4 class="text-center pb-4">SHIPPING INFORMATION</h4>
              <table class="table">
                    <tr class="">
                        <td>Full Name</td>
                        <td> : {{$order->first_name}} {{$order->last_name}}</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td> : {{$order->email}}</td>
                    </tr>
                    <tr>
                        <td>Phone No.</td>
                        <td> : {{$order->phone}}</td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td> : {{$order->address1}}, {{$order->address2}}</td>
                    </tr>
                    <tr>
                        <td>Country</td>
                        <td> : {{$order->country}}</td>
                    </tr>
                    <tr>
                        <td>Post Code</td>
                        <td> : {{$order->post_code}}</td>
                    </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section> -->
    @endif

  </div>
</div>
@endsection

@push('styles')
<style>
    .order-info,.shipping-info{
        background:#ECECEC;
        padding:20px;
    }
    .order-info h4,.shipping-info h4{
        text-decoration: underline;
    }

</style>


@endpush
@push('scripts')

  <!-- Page level plugins -->
  <script src="{{asset('backend/vendor/datatables/jquery.dataTables.min.js')}}"></script>
  <script src="{{asset('backend/vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="{{asset('backend/js/demo/datatables-demo.js')}}"></script>

  <script>
      $(document).ready(function(){

        $.ajaxSetup({

            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
          $('.dltBtn').click(function(e){
            var form=$(this).closest('form');
              var dataID=$(this).data('id');
              // alert(dataID);
              e.preventDefault();
              swal({
                    title: "Are you sure?",
                    text: "Once deleted, you will not be able to recover this data!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willDelete) => {
                    if (willDelete) {
                       form.submit();
                    } else {
                        swal("Your data is safe!");
                    }
                });
          })
      })
  </script>
@endpush