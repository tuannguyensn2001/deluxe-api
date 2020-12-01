<template>
    <div class="container">
        <div class="form-group">
            <label for="name_collection">Tên collection</label>
            <input
                type="text"
                id="name_collection"
                class="form-control"
                v-model="nameCollection"
            >
        </div>

        <div class="form-group">
            <label for="name_table">Tên table</label>
            <input
                type="text"
                id="name_table"
                class="form-control"
                v-model="nameTable"
            >
        </div>

        <div class="form-group">
            <table class="table">
                <thead>

                <tr>

                    <th scope="col">Tên</th>
                    <th scope="col">Mô tả</th>
                    <th scope="col">Kiểu dữ liệu</th>
                    <th scope="col">
                        <button
                            class="btn btn-success"
                            @click="addAttributes"
                        >Thêm mới
                        </button>
                    </th>
                </tr>

                </thead>
                <tbody>

                <tr v-for="(attributes,index) in listAttributes">
                    <th scope="row">
                        <input
                            type="text"
                            class="form-control"
                            v-model="attributes.name"
                        >
                    </th>
                    <td>
                        <input
                            type="text"
                            class="form-control"
                            v-model="attributes.description"
                        >
                    </td>
                    <td>
                        <select
                            class="form-select"
                            aria-label="Default select example"
                            v-model="attributes.data_type"
                        >
                            <option value="string">Chuỗi</option>
                            <option value="int">Số nguyên</option>
                            <option value="double">Số thực</option>
                        </select>
                    </td>
                    <td>
                        <button
                            class="btn btn-danger"
                            @click="deleteAttribute(index)"
                        > Xóa
                        </button>
                    </td>
                </tr>

                <button v-if="validCreateSubmit"
                        class="btn btn-primary"
                        @click="handleCreateAttributes"
                >

                    Tạo mới nhóm sản phẩm
                </button>

                </tbody>
            </table>
        </div>

    </div>
</template>

<script>
import axios from 'axios'

export default {
    data() {
        return {
            nameCollection: '',
            nameTable: '',
            listAttributes: [],
        }
    },
    computed: {
        validCreateSubmit() {
            return this.listAttributes.length !== 0;
        }
    },
    methods: {
        addAttributes() {
            this.listAttributes.push({
                name: '',
                description: '',
                data_type: 'string',
            });
        },
        deleteAttribute(index) {
            this.listAttributes.splice(index, 1);
        },
        handleCreateAttributes() {
            axios.post('/api/collection/create',{
                name: this.nameCollection,
                table: this.nameTable,
                list: this.listAttributes,
            })
            .then(data=>{
                this.$router.push('/collection');

            })
            .catch(error=>console.log(error));
        }
    }
}
</script>


<style scoped>

</style>
