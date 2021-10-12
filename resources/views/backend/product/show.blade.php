@extends('backend.layouts.master')

@section('title','Order Detail')

@section('main-content')

<div class="row">
         <div class="col-md-12">
            @include('backend.layouts.notification')
         </div>
     </div>
<div class="card">
 
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
     
    
    <table class="table table-striped table-hover" id="order-dataTable" width="100%" cellspacing="0">
 
      
      <thead>
        <tr>
           <th>S.N.</th>
              <th>Title</th>
              <th>Category</th>
              <th>Is Featured</th>
              <th>Price</th>
              <th>Discount</th>
              <th>Size</th>
              <th>Condition</th>
              <th>Brand</th>
              <th>Stock</th>
              <th>Photo</th>
              <th>Facebook</th>
              <th>Status</th>
              <th>Action</th>
        </tr>
      </thead>
      <tbody>
             
            @php 
              $sub_cat_info=DB::table('categories')->select('title')->where('id',$product->child_cat_id)->get();
              // dd($sub_cat_info);
              $brands=DB::table('brands')->select('title')->where('id',$product->brand_id)->get();
              @endphp
                <tr>
                    <td>{{$product->id}}</td>
                    <td>{{$product->title}}</td>
                    <td>{{$product->cat_info['title']}}
                      <sub>
                        @foreach($sub_cat_info as $data)
                          {{$data->title}}
                        @endforeach
                      </sub>
                    </td>
                    <td>{{(($product->is_featured==1)? 'Yes': 'No')}}</td>
                    <td>Rs.{{$product->price}} /-</td>
                    <td>{{$product->discount}}% OFF</td>
                    <td>{{$product->size}}</td>
                    <td>{{$product->condition}}</td>
                    <td>@foreach($brands as $brand) {{$brand->title}} @endforeach</td>
                    <td>
                      @if($product->stock>0)
                      <span class="badge badge-primary">{{$product->stock}}</span>
                      @else 
                      <span class="badge badge-danger">{{$product->stock}}</span>
                      @endif
                    </td>
                    <td>
                        @if($product->photo)
                            @php 
                              $photo=explode(',',$product->photo);
                              // dd($photo);
                            @endphp
                            <img src="{{asset('')}}/{{$product->photo}}" class="img-fluid zoom" style="max-width:80px" alt="{{$product->photo}}">
                        @else
                            <img src="{{asset('')}}/{{$product->photo}}" class="img-fluid" style="max-width:80px" alt="avatar.png">
                        @endif
                    </td>
                    <td><a href="javascript:void(0);" onclick="fb_share('{{route('product-detail',$product->slug)}}')" class="fbBtn" >facebook </a></td>
                    <td>
                        @if($product->status=='active')
                            <span class="badge badge-success">{{$product->status}}</span>
                        @else
                            <span class="badge badge-warning">{{$product->status}}</span>
                        @endif
                    </td>
                    <td>
                        <a href="{{route('product.edit',$product->id)}}" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="edit" data-placement="bottom"><i class="fas fa-eye"></i></a>
                        <a href="{{route('product.show',$product->id)}}" class="btn btn-info btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="edit" data-placement="bottom"><i class="fas fa-edit"></i></a>
                      <form method="POST" action="{{route('product.destroy',[$product->id])}}">
                          @csrf 
                      @method('delete')
                          <button class="btn btn-danger btn-sm dltBtn" data-id={{$product->id}} style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>
                      </form>
                    </td>
                    {{-- Delete Modal --}}
                    {{-- <div class="modal fade" id="delModal{{$user->id}}" tabindex="-1" role="dialog" aria-labelledby="#delModal{{$user->id}}Label" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="#delModal{{$user->id}}Label">Delete user</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <form method="post" action="{{ route('categorys.destroy',$user->id) }}">
                                @csrf 
                                @method('delete')
                                <button type="submit" class="btn btn-danger" style="margin:auto; text-align:center">Parmanent delete user</button>
                              </form>
                            </div>
                          </div>
                        </div>
                    </div> --}}
                </tr>  
              

          </tbody>
    </table>
     <h6 class="m-0 font-weight-bold text-primary float-left">Order Lists</h6>
     <br>
     <br>
    <table class="table table-bordered" id="order-dataTable1" width="100%" cellspacing="0">
         
          
          <thead>
            <tr>
              <th>S.N.</th>
              <th>Order No.</th>
              <th>Name</th>
              <th>Comments</th>
              <th>Phone No.</th>
              <th>Quantity</th>
              <!-- <th>Charge</th> -->
              <th>Price</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <th>S.N.</th>
              <th>Order No.</th>
              <th>Name</th>
              <th>Comment</th>
              <!-- <th>Email</th> -->
              <th>Phone No.</th>
              <th>Quantity</th>
              <!-- <th>Charge</th> -->
              <th>Price</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </tfoot>
          <tbody>
            @php
            $i=0;
            @endphp
            
            @foreach($orders as $value=>$key)
            
            @php 
              $order=App\Models\Order::where('id',$key->order_id)->get()->first();
            
            @endphp
              


            @if(!empty($order))
            

            @else
              $shipping_charge=0.00;
            @endif
          
                <tr class="myTableId">
                     
                    <td>{{$i++}}</td>
                    <td><a href="{{route('order.show',$order->id)}}">{{$order->order_number}}</a></td>
                    <td>{{$order->first_name}} {{$order->last_name}}</td>
                    <td>{{Str::limit($order->comments,70)}} </td>
                    <!-- <td>{{$order->email}}</td> -->
                    <td>{{$order->phone}}</td>
                    <td>{{$order->quantity}}</td>
                    
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
                        <a href="{{route('order.show',$order->id)}}" class="btn btn-warning btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="view" data-placement="bottom"><i class="fas fa-eye"></i>
                        </a>
                        <!-- <a href="{{route('order.edit',$order->id)}}" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="edit" data-placement="bottom"><i class="fas fa-edit"></i></a> -->
                        <!-- <form method="POST" action="{{route('order.destroy',[$order->id])}}">
                          @csrf 
                          @method('delete')
                              <button class="btn btn-danger btn-sm dltBtn" data-id="{{$order->id}}" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>
                        </form> -->
                    </td>

                </tr> 
             
               
            @endforeach
          </tbody>
    </table>
    
    


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
@push('styles')
  <link href="{{asset('backend/vendor/datatables/dataTables.bootstrap4.min.css')}}" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
  <style>
      div.dataTables_wrapper div.dataTables_paginate{
          display: none;
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
      
      $('#order-dataTable').DataTable( {
            "columnDefs":[
                {
                    "orderable":false,
                    "targets":[8]
                }
            ]
        } );

        // Sweet alert

        function deleteData(id){
            
        }
        $('#order-dataTable1').DataTable( {
            "columnDefs":[
                {
                    "orderable":false,
                    "targets":[8]
                }
            ]
        } );

        // Sweet alert

        function deleteData(id){
            
        }
  </script>
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
    <script>
(function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id))
            return;
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.3&appId=219567500152751";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

function fb_share(dynamic_link,dynamic_title) {
    console.log(dynamic_link,dynamic_title);

    var app_id = '219567500152751';
    var pageURL="https://www.facebook.com/dialog/feed?app_id=" + app_id + "&link=" + dynamic_link;
    var w = 600;
    var h = 400;
    var left = (screen.width / 2) - (w / 2);
    var top = (screen.height / 2) - (h / 2);
    window.open(pageURL, dynamic_title, 'toolbar=no, location=no, directories=no, status=no, menubar=yes, scrollbars=no, resizable=no, copyhistory=no, width=' + 800 + ', height=' + 650 + ', top=' + top + ', left=' + left)
    return false;
}
</script>
@endpush