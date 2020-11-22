<template>
    <div class="card" style="width: 18rem;">
        <img
            :src="thumbnail"
            class="card-img-top" alt="">
        <div class="card-body">
            <h5 class="card-title"> {{ name }} </h5>
            <p class="card-text"> {{ description }} </p>
            <div class="action">
                <router-link :to="setRoute" class="btn btn-primary"> Xem sản phẩm </router-link>
                <button class="btn btn-danger">Xóa</button>
            </div>

        </div>
    </div>
</template>


<script>
    export default{
        inject: ['baseURL'],
        props:{
            id: Number,
            thumbnail: String,
            name: String,
            description: String,
        },
        created() {
            console.log(this.link)
        },
        computed:{
            setRoute()
            {
                return '/product/edit/'+this.id;
            }
        }
    }
</script>


<style scoped>
    .card{
        height: 400px;
    }
    .card img{
        width: 100%;
        height: 60%;
    }
    .action{
        display: flex;
        justify-content: space-between;
    }
</style>
