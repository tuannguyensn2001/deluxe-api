<template>
    <div class="container">
        <div class="form-group">
            <label for="name">Tên sản phẩm</label>
            <input
                type="text"
                id="name"
                class="form-control"
                placeholder="Nhập tên sản phẩm"
                v-model="product.name"
            >
        </div>

        <div class="form-group">
            <label for="unit">Đơn vị</label>
            <input
                type="text"
                class="form-control"
                id="unit"
                placeholder="Nhập đơn vị"
                v-model="product.unit"
            >
        </div>

        <div class="form-group">
            <label for="thumbnail">Chọn ảnh</label>
            <input
                type="file"
                class="form-control"
                id="thumbnail"
            >
        </div>

        <div class="form-group">
            <label>Chọn nhóm sản phẩm</label>
            <select
                class="form-select"
                aria-label="Default select example"
                @change="changeCollection"
                v-model="product.collection_id"
            >
                <option value="-1">Chọn</option>
                <template v-for="collection in listCollection">

                    <option :value="collection.collection.id">
                        {{ collection.collection.name }}
                    </option>

                </template>
            </select>
        </div>

        <div class="form-group">
            <label for="price">Giá sản phẩm</label>
            <input
                type="text"
                class="form-control"
                id="price"
                placeholder="Giá sản phẩm"
                v-model="product.price"
            >
        </div>

        <div class="form-group">
            <label for="promotion">Giảm giá</label>
            <input
                type="text"
                class="form-control"
                id="promotion"
                placeholder="Nhập giá sản phẩm"
                v-model="product.promotion"
            >

        </div>

        <div class="form-group form-group-description">
            <label for="description">Mô tả sản phẩm</label>
            <textarea
                name=""
                id="description"
                cols="30"
                rows="5"
                class="form-control"
                v-model="product.description"
            >
                </textarea>
        </div>


        <div class="form-group form-group-attributes">
            <div class="form-group"
                 v-for="attributes in pickCollection"
            >
                <label> {{ attributes.name }} </label>
                <input
                    type="text"
                    class="form-control"
                    v-model="product.attributes[attributes.code]"

                >
            </div>
        </div>

        <div class="form-group ">
            <button
                class="btn btn-primary"
                @click="addProduct"
            >
                Thêm mới
            </button>
        </div>

    </div>
</template>


<script>
import axios from 'axios';
import firebase from 'firebase';

export default {
    inject: ['baseURL'],
    data() {
        return {
            listCollection: [],
            product: {
                collection_id: -1,
                name: '',
                unit: '',
                price: '',
                promotion: '',
                description: '',
                attributes: {},
                thumbnail: '',
            },
            pickCollection: [],
            ref: firebase.storage().ref('product'),
        }
    },
    created() {
        axios.get(this.baseURL + '/api/collection/details')
            .then(response => {
                this.listCollection = response.data;
            })
            .catch(error => console.log(error));
    },
    methods: {
        addProduct() {
            this.uploadFile()
            .then(url=>{
                this.product.thumbnail = url;
                axios.post(this.baseURL+'/api/product/create',{
                    product: this.product,
                })
                    .then(response=>{
                        if (response.status === 200){
                            this.$router.push('/product');
                        }
                    });
            });


        },
        changeCollection() {
            const value = this.product.collection_id;
            this.pickCollection = this.listCollection.find(item => item.collection.id === value);
            this.pickCollection = this.pickCollection.attributes;
        },
        async uploadFile() {
            const thumbnail = document.querySelector('#thumbnail');
            const file = thumbnail.files[0];
            const name = file.name;
            const metadata = {
                contentType: file.type,
            }
            const task = this.ref.child(name).put(file, metadata);
            const snapshot = await task;
            return await snapshot.ref.getDownloadURL();

        }
    }
}
</script>


<style scoped>
.container {
    display: flex;
    flex-wrap: wrap;
    flex-direction: row;
}

.container > .form-group {
    width: 45%;
}

.container > .form-group {
    margin-left: 20px;
    margin-top: 20px;
}

.form-group-description {
    width: 92% !important;
}

.form-group-attributes {
    width: 92% !important;
}
</style>

