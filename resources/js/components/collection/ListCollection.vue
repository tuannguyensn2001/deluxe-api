<template>
    <div>

        <table class="table">
            <thead>
            <tr>
                <th scope="col">Tên</th>
                <th scope="col">Ngày tạo</th>
                <th scope="col"></th>
                <th scope="col">
                    <router-link
                        to="/collection/add"
                        class="btn btn-primary"
                    >Thêm nhóm sản phẩm</router-link>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr
            v-for="collection in listCollection"
            >
                <th scope="row"> {{ collection.name }} </th>
                <td> {{ collection.created_at }} </td>
                <td>
                    <router-link
                        :to="setRoute(collection.id)"
                    >
                        Xem chi tiết
                    </router-link>
                </td>
                <td>
                    <a
                        href=""
                        data-toggle="modal"
                        data-target="#deleteWarning"
                        class="delete"
                        @click.prevent="deleteCollection(collection.id)"
                    >Xóa</a>
                </td>

            </tr>


            </tbody>
        </table>


                <delete-warning
                title="Xóa nhóm sản phẩm"
                content="Bạn có chắc chắn muốn xóa nhóm sản phẩm này chứ ?"
                action="Xóa"
                @confirm="confirmDelete"
                >

                </delete-warning>



    </div>
</template>


<script>
import axios from 'axios';
import DeleteWarning from "../modal/DeleteWarning";
    export default{
        components: {
            DeleteWarning
        },
        data(){
            return {
                listCollection:[],
                collectionPickedDelete: -1,
            }
        },
        created(){
            axios.get('api/collection')
            .then(response=>{
                console.log(response);
                this.listCollection = response.data;
            })
            .catch(error=>console.log(error));

        },
        methods:{
           deleteCollection(id)
           {
               this.collectionPickedDelete = id;
           },
            setRoute(id){
               return `/collection/edit/${id}`;
            },
            confirmDelete(){
               let id = this.collectionPickedDelete;
               axios.delete('/api/collection/delete',{
                    data:{
                        id,
                    },
               })
                .then(response=>{
                   this.listCollection=this.listCollection.filter(item=>item.id !== id);
                })
            }
        }
    }
</script>


<style scoped>
    a{
        text-decoration: none;
    }
    .delete{
        color: red;
    }
</style>
