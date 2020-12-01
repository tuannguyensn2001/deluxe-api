<template>
    <div class="container">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">Số serial</th>
                <th scope="col">Số tiền</th>
                <th scope="col">Trạng thái</th>
            </tr>
            </thead>
            <tbody>
            <tr
            v-for="(card,index) in listCard"
            >
                <th scope="row"> {{ index + 1}} </th>
                <td> {{ card.serial }} </td>
                <td> {{ card.value }} </td>
                <td>
                    <template
                    v-if="card.is_active"
                    >
                        <span class="badge bg-success"> Đã kích hoạt </span>
                    </template>
                    <template
                    v-else
                    >
                        <span class="badge bg-warning"> Chưa  kích hoạt </span>
                    </template>
                </td>
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
            listCard: [],
            ref: {},
        }
    },
    created()
    {
        this.ref = firebase.database().ref('card');
        this.ref.on('value',this.init);
    },
    methods:{
        init(snapshot)
        {
            const data = snapshot.val();
            for(let key in data)
            {
                const card = data[key];
                card.id = key;
                this.listCard.push(card);
            }

            console.log(this.listCard);
        }
    }
}
</script>
