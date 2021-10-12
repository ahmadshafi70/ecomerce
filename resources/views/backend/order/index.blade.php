@extends('backend.layouts.master')

@section('main-content')
 <!-- DataTales Example -->
 <div class="card shadow mb-4">
     <div class="row">
         <div class="col-md-12">
            @include('backend.layouts.notification')
          </div>
          
     </div>
    
    <div class="card-header py-3">
         <a href="{{route('order.create')}}" class="btn btn-primary" style="float:right;">Add Order</a>
      <h6 class="m-0 font-weight-bold text-primary float-left">Order Lists</h6>
    </div>
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
          
      <div class="table-responsive">
        @if(count($orders)>0)
        <table class="table table-bordered" id="order-dataTable" width="100%" cellspacing="0">
         
          
          <thead>
            <tr>
              <th>S.N.</th>
              <th>Order No.</th>
              <th>Name</th>
              <th>Product</th>
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
              <th>Product</th>
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
            @foreach($orders as $order)

            @php
                $shipping_charge=DB::table('shippings')->where('id',$order->shipping_id)->pluck('price');
            @endphp 
              <a href="#">
                 <tr class="myTableId">
                     
                    <td>{{$i++}}</td>
                    <td><a href="{{route('order.show',$order->id)}}">{{$order->order_number}}</a></td>
                    <td>{{$order->first_name}} {{$order->last_name}}</td>   
                    <td>
                      @php
                      $i=0;
                      @endphp
                      @foreach($order->products as $product)
                         {{Str::limit($product->title)}}
                         @php
                          if($i==0) break;
                      @endphp
                      @endforeach
                    </td>
                    <td>{{Str::limit($order->comments,70)}}.. </td>
                    <!-- <td>{{$order->email}}</td> -->
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
                        <a href="{{route('order.show',$order->id)}}" class="btn btn-warning btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="view" data-placement="bottom"><i class="fas fa-eye"></i></a>
                        <!-- <a href="{{route('order.edit',$order->id)}}" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="edit" data-placement="bottom"><i class="fas fa-edit"></i></a> -->
                        <!-- <form method="POST" action="{{route('order.destroy',[$order->id])}}">
                          @csrf 
                          @method('delete')
                              <button class="btn btn-danger btn-sm dltBtn" data-id="{{$order->id}}" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash-alt"></i></button>
                        </form> -->
                    </td>

                </tr> 
              </a>
               
                
                
            @endforeach
          </tbody>
        </table>
        <span style="float:right">{{$orders->links()}}</span>
        @else
          <h6 class="text-center">No orders found!!! Please order some products</h6>
        @endif
      </div>
    </div>
</div>
@endsection

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
 
@endpush