<template>
    <div class="container">
        <p :class="{dataIsLoaded: isLoaded, waiting: true,}">
            Dữ liệu đang load, vui lòng chờ
        </p>
        <table class="table">
            <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col">Tên</th>
                <th scope="col">Số tiền</th>
                <th scope="col">Chi tiết</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="order in listOrder">
                <th scope="row">
                    <img :src="order.avatar" alt="">
                </th>
                <td> {{ order.username }} </td>
                <td>{{ order.money }} </td>
                <td>
                    <a href=""
                       @click="pickOrder(order.id)"
                       data-toggle="modal" data-target="#detailOrder"
                    >Xem chi tiết</a>
                </td>
            </tr>
            </tbody>
        </table>


        <!-- Modal -->
        <div class="modal fade " id="detailOrder" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Danh sách sản phẩm</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <template v-if="pickedOrder">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Ảnh</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Đơn giá</th>
                                <th scope="col">Tổng tiền</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="item in pickedOrder.products">
                                <th scope="row">
                                    <img :src="item.product.thumbnail" alt="">
                                </th>
                                <td> {{ item.product.name}} </td>
                                <td> {{ item.number}} </td>
                                <td> {{ item.product.price}} </td>
                                <td>{{ item.total }}</td>
                            </tr>


                            </tbody>
                        </table>
                        </template>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>


<script>
import axios from 'axios'
    export default{
        inject: ['baseURL'],
        data(){
            return {
                listOrder:[],
                isLoaded: true,
                pickedOrder: null,
            }
        },
        created()
        {
            axios.get(this.baseURL+'/api/orders')
            .then(response=>{
                this.listOrder = response.data;
                this.isLoaded = false;
            })
        },
        methods:{
            pickOrder(id)
            {
                console.log(id);
                this.pickedOrder = this.listOrder.find(item=>item.id === id);
            }
        }
    }
</script>

<style scoped>
img{
    height: 50px;
    width: 50px;
    border-radius: 50%;
}
a{
    text-decoration: none;
}
.dataIsLoaded{
    display: block !important;
}
.waiting{
    display: none;
}

</style>
