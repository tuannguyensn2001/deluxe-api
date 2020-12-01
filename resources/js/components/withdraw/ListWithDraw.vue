<template>
    <div class="container">
        <input
            type="text"
            class="form-control"
            placeholder="Tìm kiếm "
            v-model="emailSearched"
            @input="searchUser"
        >
        <table class="table">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Người rút</th>
                <th scope="col">Số tiền</th>
                <th scope="col">Thời gian</th>
                <th scope="col">Trạng thái</th>
                <th scope="col">Hành động</th>
            </tr>
            </thead>
            <tbody>
            <tr
                v-for="(withdraw,index) in listWithDraw"
            >
                <th scope="row"> {{ index + 1 }}</th>
                <td> {{ withdraw.email }}</td>
                <td>{{ withdraw.amount }}</td>
                <td>{{ withdraw.created_at }}</td>
                <td>
                    <span
                        class="badge bg-success"
                        v-if="withdraw.is_active"
                    >Đã rút
                    </span>
                    <span
                        class="badge bg-warning"
                        v-else
                    >Chưa rút
                    </span>
                </td>
                <td>
                    <button
                        class="btn btn-danger"
                        v-if="!withdraw.is_active"
                        data-toggle="modal"
                        data-target="#deleteWarning"
                        @click="pickWithdraw(withdraw.key)"
                    >
                        Rút tiền
                    </button>
                </td>
            </tr>


            </tbody>
        </table>

        <delete-warning
            title="Xác nhận rút tiền"
            content="Bạn có chắc chắn muốn xác nhận rút tiền?"
            action="Xác nhận"
            @confirm="confirm"
        >

        </delete-warning>
    </div>
</template>

<script>
import firebase from 'firebase';
import DeleteWarning from '../modal/DeleteWarning.vue';
import axios from 'axios';

export default {
    components: {
        DeleteWarning,
    },
    inject: ['baseURL'],
    data() {
        return {
            ref: {},
            listWithDraw: [],
            originWithDraw: [],
            picked: null,
            emailSearched: null,
        }
    },
    created() {
        this.ref = firebase.database().ref('withdraw');
        this.ref.on('value', this.init);
        this.originWithDraw = this.listWithDraw;
    },
    methods: {
        init(snapshot) {

            const data = snapshot.val();
            for (let key in data) {
                const withdraw = data[key];
                withdraw.key = key;
                this.listWithDraw.push(withdraw);
            }
            this.listWithDraw.reverse();

        },
        pickWithdraw(id) {
            this.picked = id;
        },
        async confirm() {
            const withdraw = this.listWithDraw.find(item => item.key === this.picked);
            const email = withdraw.email;
            const key = await this.findUser(email);
            withdraw.is_active = true;
            axios.put(this.baseURL+'/api/withdraw/edit',{
                withdraw,
                key,
            })
            .then(response=>console.log(response.data));

        },
        findUser(email)
        {
            return new Promise((resolve, reject) => {
                const userRef = firebase.database().ref('user');
                userRef.orderByChild('email').equalTo(email).on('value',snapshot=>{
                    let result = null;
                    const data = snapshot.val();
                    for(let key in data)
                    {
                        result = key;
                    }
                    resolve(result);
                })
            })
        },
        searchUser()
        {
           this.listWithDraw = this.originWithDraw.filter(item=>item.email.includes(this.emailSearched));
        }

    }
}
</script>

<style scoped>
    input{
        margin-top: 30px;
        margin-bottom: 30px;
    }
</style>
