<template>
    <div class="container container-edit">
        <div class="form-group">
            <label for="name_collection">Tên collection</label>
            <input
                v-model="collection.name"
                type="text"
                id="name_collection"
                class="form-control"
                >


        </div>

        <div class="form-group">
            <label for="name_table">Tên table</label>
            <input
                v-model="collection.attr_table"
                type="text"
                id="name_table"
                class="form-control"
                >


        </div>

        <div class="form-group">
            <table class="table">
                <thead>

                <tr>

                    <th scope="col">Tên</th>
                    <th scope="col">Mô tả</th>
                    <th scope="col">Kiểu dữ liệu</th>
                    <th scope="col">
                        <button
                            class="btn btn-success"
                            @click="addAttributes"
                        >Thêm mới
                        </button>
                    </th>
                </tr>

                </thead>
                <tbody>

                <tr v-for="(attributes,index) in attributes">
                    <th scope="row">
                        <input
                            type="text"
                            class="form-control"
                            v-model="attributes.code"
                        >
                    </th>
                    <td>
                        <input
                            type="text"
                            class="form-control"
                            v-model="attributes.name"
                        >
                    </td>
                    <td>
                        <select
                            class="form-select"
                            aria-label="Default select example"
                            v-model="attributes.data_type"
                        >
                            <option value="string">Chuỗi</option>
                            <option value="int">Số nguyên</option>
                            <option value="double">Số thực</option>
                        </select>
                    </td>
                    <td>
                        <button
                            class="btn btn-danger"
                            @click="deleteAttributes(index)"
                        > Xóa
                        </button>
                    </td>
                </tr>

                <button v-if="validEditSubmit"
                        class="btn btn-primary"
                        @click="handleEditAttributes"
                >
                    Sửa nhóm sản phẩm
                </button>

                </tbody>
            </table>
        </div>

    </div>

</template>


<script>
import axios from 'axios'
    export default{
        props:{
            id: Number,
        },
        data(){
            return{
                collection:{},
                attributes:{},

            }
        },
        computed:{
            validEditSubmit(){
                return this.attributes.length !== 0;
            }
        },
        created(){

            axios.get('/api/collection/show/'+this.id)
            .then(response=> {
                this.collection = response.data.collection;
                this.attributes = response.data.attributes;

            });
        },
        methods:{
            addAttributes(){
                this.attributes.push({
                    code: '',
                    name: '',
                    data_type: 'string',
                });
            },
            deleteAttributes(index){
                this.attributes.splice(index,1);
            },
            handleEditAttributes(){
                axios.put('/api/collection/edit',{
                    id: this.id,
                    collection: this.collection,
                    attributes: this.attributes,
                })
                .then(response=>{
                    this.$router.push({name: 'collection'});
                })
                .catch(error=>console.log(error));
            }
        },




    }
</script>
