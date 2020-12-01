import {createRouter, createWebHistory} from "vue-router";
import Content from "./components/main/Content";
import ListCard from "./components/card/ListCard";
import ListCollection from "./components/collection/ListCollection";
import AddCollection from "./components/collection/AddCollection";
import EditCollection from "./components/collection/EditCollection";
import ListProduct from "./components/product/ListProduct";
import AddProduct from "./components/product/AddProduct";
import EditProduct from "./components/product/EditProduct";
import ListDeposit from "./components/deposit/ListDeposit";
import ListTransfer from "./components/transfer/ListTransfer";
import ListWithDraw from "./components/withdraw/ListWithDraw";
import ListUser from "./components/user/ListUser";
import ListOrder from "./components/order/ListOrder";

const routes = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/',
            component: Content
        },
        {
            path: '/card',
            component: ListCard,
            meta: {
                title: "Danh sách thẻ nạp",
            }
        },
        {
            path: '/deposit',
            component: ListDeposit,
            meta: {
                title: "Danh sách nạp tiền",
            }
        },
        {
            path: '/transfer',
            component: ListTransfer,
            meta: {
                title: "Danh sách giao dịch",
            }
        },
        {
            path: '/withdraw',
            component: ListWithDraw,
            meta:{
                title: "Danh sách rút tiền",
            }
        },
        {
            path: '/user',
            component: ListUser,
            meta:{
                title: "Quản lý người dùng",
            }
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
            meta: {
                title: 'Sửa sản phẩm',
            }
        },
        {
            path: '/order',
            component: ListOrder,
            meta:{
                title: 'Danh sách đơn hàng',
            }
        }


    ]
})

routes.beforeEach((to, from, next) => {
    document.title = to.meta.title;
    next();
})


export default routes;
