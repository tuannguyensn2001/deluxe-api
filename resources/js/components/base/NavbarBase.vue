<template>
    <aside class="mdc-drawer mdc-drawer--dismissible app-drawer">
        <nav class="mdc-drawer__drawer">
            <nav class="mdc-drawer__content">
                <div id="icon-with-text-demo" class="mdc-list">

                    <navbar-item-base
                        v-for="nav in listNav"
                        :key=nav.name
                        :name=nav.name
                        :icon=nav.icon
                        :link=nav.link
                    ></navbar-item-base>

                </div>
            </nav>
        </nav>
    </aside>
</template>


<script>
import NavbarItemBase from "./NavbarItemBase";

export default {
    components: {
        NavbarItemBase,
    },
    data() {
        return {
            listNav: [],
        }
    },
    created() {
        this.listNav = [
            {
                name: "Quản lý thẻ",
                icon: "sim_card",
                link: "/card",
            },
            {
                name: "Quản lý nạp tiền",
                icon: "receipt",
                link: "/deposit",
            },
            {
                name: 'Quản lý giao dịch',
                icon: "receipt",
                link: '/transfer',
            },
            {
                name: 'Quản lý rút tiền',
                icon: 'receipt',
                link: '/withdraw',
            },
            {
                name: 'Quản lý người dùng',
                icon: 'account_circle',
                link: '/user',
            },
            {
                name: "Quản lý nhóm sản phẩm",
                icon: "receipt",
                link: "/collection",
            },
            {
                name: "Quản lý sản phẩm",
                icon: 'receipt',
                link: '/product',
            },
            {
                name: 'Quản lý đơn hàng',
                icon: 'receipt',
                link: '/order',
            }

        ]
    }

}
</script>

<style scoped>
    aside{
        z-index: 0;
    }
</style>
