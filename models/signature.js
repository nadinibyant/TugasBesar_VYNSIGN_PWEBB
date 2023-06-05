const {Sequelize, DataTypes } = require('sequelize');
const sequelize = new Sequelize('mysql://root@localhost/dbttd');

const signature = sequelize.define('signature', 
{
    id_signature:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        allowNull: false,
        autoIncrement: true
    },
    user_id: {
        type:DataTypes.INTEGER, 
        allowNull: false
    },
    document_id: {
        type: DataTypes.STRING,
        allowNull: false
    }, 
    id_penerima: {
        type:DataTypes.INTEGER,
        allowNull:false
    },
    jabatan: {
        type:DataTypes.STRING,
        allowNull: false
    },
    status: {
        type:DataTypes.STRING,
        allowNull: false
    },
    signed_at: {
        type: DataTypes.DATE,
        allowNull: false
    },
    created_at:{
        type:DataTypes.DATE,
      
    }, 
    updated_at: {
        type:DataTypes.DATE
    }
}, 
{
    tableName: 'signature',
    timestamps: true,
    createdAt: 'created_at',
    updatedAt: 'updated_at',
});

module.exports = signature