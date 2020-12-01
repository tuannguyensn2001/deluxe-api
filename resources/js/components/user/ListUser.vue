<template>
    <div class="container">
        <table class="table">
            <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col">Tên</th>
                <th scope="col">Email</th>
                <th scope="col">Ví</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="user in listUser">
                <th scope="row">
                    <img :src="user.avatar" alt="">
                </th>
                <td> {{ user.user }} </td>
                <td> {{ user.email }} </td>
                <td>{{ user.wallet }} </td>
            </tr>

            </tbody>
        </table>
    </div>
</template>

<script>
import firebase from 'firebase';

    export default{
        data(){
            return {
                ref : {},
                listUser: [],
            }
        },
        created()
        {
            this.ref = firebase.database().ref("user");
            this.ref.on('value',this.init);
        },
        methods:{
            init(snapshot)
            {
                const data = snapshot.val();
                for(let key in data)
                {
                    const user = data[key];
                    user.key = key;
                    firebase.database().ref('wallet').child(key).on('value',snapshot=>{
                        const wallet = snapshot.val();
                        user.wallet = wallet.amount;
                        this.listUser.push(user);
                    })

                }

            }
        }
    }
</script>


<style scoped>
img{
    height: 50px;
    width: 50px;
    border-radius: 50%;
}
</style>
