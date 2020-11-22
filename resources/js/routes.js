import {createRouter,createWebHistory} from "vue-router";
import Content from "./components/main/Content";
import Card from "./components/card/Card";
import ListCollection from "./components/collection/ListCollection";
import AddCollection from "./components/collection/AddCollection";
import EditCollection from "./components/collection/EditCollection";
import ListProduct from "./components/product/ListProduct";
import AddProduct from "./components/product/AddProduct";
import EditProduct from "./components/product/EditProduct";

const routes = createRouter({
    history: createWebHistory(),
    routes:[
        {
            path: '/',
            component: Content
        },
        {
            path: '/card',
            component: Card,
        },
        {
            name: 'collection',
            path: '/collection',
            component: ListCollection,
        },
        {
            path: '/collection/add',
            component: AddCollection,
        },
        {
            path: '/collection/edit/:id',
            component: EditCollection,
            props: true,
        },
        {
            path: '/product',
            component: ListProduct,
        },
        {
            path: '/product/add',
            component: AddProduct,
        },
        {
            path: '/product/edit/:id',
            component: EditProduct,
            props: true,
            meta:{
                title: 'Sửa sản phẩm',
            }
        }


    ]
})

routes.beforeEach((to,from,next)=>{
    document.title = to.meta.title;
    next();
})


export default  routes;
