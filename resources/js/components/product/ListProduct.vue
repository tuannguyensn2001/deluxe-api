<template>
    <router-link to="/product/add">Thêm mới sản phẩm</router-link>
    <div
        :class="{global:true, dataLoaded: isLoaded}"
    >
        <div :class="{container: true}">
            <product-card
                v-for="product in listProduct"
                class="product-card"
                :name="product.name"
                :description="product.description"
                :thumbnail="product.thumbnail"
                :id="product.id"
            ></product-card>
        </div>
    </div>
</template>


<script>
import ProductCard from "./ProductCard";
import axios from 'axios';

export default {
    inject: ['baseURL'],
    components: {
        ProductCard,
    },
    data() {
        return {
            listProduct: [],
            isLoaded: false,
        }
    },
    created() {
        axios.get(this.baseURL + '/api/product')
            .then(response => {
                this.listProduct = response.data;
                this.isLoaded = true;
            })
    },
    methods: {
        getLinkProduct(id) {
            return this.baseURL + '/product/edit/' + id;
        }
    }
}
</script>


<style scoped>
.container {
    display: flex;
    flex-wrap: wrap;
}

.product-card {
    margin-left: 20px;
    margin-top: 20px
}
.dataLoaded{
    display: block !important;
}
.global{
    display: none;
}

</style>
