<template>
    <div
        :class="{global:true, dataLoaded: isLoaded}"
    >
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
            <label for="thumbnail">Chọn ảnh
                <a :href="product.thumbnail"
                   target="_blank"
                >Xem ảnh</a>
            </label>
            <input
                type="file"
                class="form-control"
                id="thumbnail"
                @change="uploadFile"
            >
        </div>

        <div class="form-group">
            <label>Chọn nhóm sản phẩm</label>
            <select
                class="form-select"
                aria-label="Default select example"
                v-model="product.collection_id"
            >
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
                 v-for="item in product.attributes"
            >
                <template
                    v-for="(value,key) in item"
                >
                    <label> {{ convertCodeToName(key) }} </label>
                    <input
                        type="text"
                        class="form-control"
                        v-model="item[key]"
                    >
                </template>


            </div>
        </div>

        <div class="form-group ">
            <button
                class="btn btn-primary"
                @click="editProduct"
            >
                Edit
            </button>
        </div>

    </div>
    </div>
</template>

<script>
import axios from 'axios';
import firebase from 'firebase';

export default {
    inject: ['baseURL'],
    props: ['id'],
    data() {
        return {
            listCollection: [],
            product: {
                collection_id: -1,
            },
            collection: {},
            attributes: [],
            ref: firebase.storage().ref('product'),
            isLoaded: false,
        }
    },
    created() {
        this.getData()
            .then(data => {
                this.isLoaded = true;
            });


    },
    methods: {
        async getData() {
            const responseCollection = await axios.get(this.baseURL + '/api/collection/details');
            const responseProduct = await axios.get(this.baseURL + '/api/product/show/' + this.id)

            this.listCollection = responseCollection.data;
            this.product = responseProduct.data;

            const collection_id = this.product.collection_id;
            const responseCollectionDetails = await axios.get(this.baseURL + '/api/collection/show/' + collection_id);

            this.collection = responseCollectionDetails.data.attributes;

        },
        async uploadFile() {
            const thumbnail = document.querySelector('#thumbnail');
            const file = thumbnail.files[0];
            if (file === undefined) return null;
            const name = file.name;
            const metadata = {
                contentType: file.type,
            }
            const task = this.ref.child(name).put(file, metadata);
            const snapshot = await task;
            this.product.thumbnail =  await snapshot.ref.getDownloadURL();
        },
        convertCodeToName(code) {
            let result = '';
            for (let index in this.collection) {
                if (this.collection[index].code === code) {
                    result = this.collection[index].name;
                    break;
                }
            }
            return result;
        },
        async editProduct() {

            const response = await axios.put(this.baseURL+'/api/product/edit',{
                product: this.product
            });

           if (response.status === 200){
                this.$router.push('/product');
           }
        },

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
.dataLoaded{
    display: block !important;
}
.global{
    display: none;
}
</style>
