import { DataTypes, Model } from 'sequelize';
import { sequelize } from '../config/db.js';

// Definición de la clase Persona que extiende de Model
class Persona extends Model {
	// Método para crear una nueva persona
	static async createPersona(persona) {
		try {
			return await this.create(persona);
		} catch (error) {
			console.error(`Unable to create persona: ${error}`);
			throw error;
		}
	}

	// Método para obtener todas las personas
	static async getPersonas() {
		try {
			return await this.findAll();
		} catch (error) {
			console.error(`Unable to find all personas: ${error}`);
			throw error;
		}
	}

	// Método para obtener una persona por su ID
	static async getPersonaById(id) {
		try {
			return await this.findByPk(id);
		} catch (error) {
			console.error(`Unable to find persona by id: ${error}`);
			throw error;
		}
	}

	// Método para actualizar una persona
	static async updatePersona(id, updated_persona) {
		try {
			const persona = await this.findByPk(id);
			return persona.update(updated_persona);
		} catch (error) {
			console.error(`Unable to update the persona: ${error}`);
			throw error;
		}
	}

	// Método para alternar el estado de la persona
	static async togglePersonaState(id) {
		try {
			const persona = await this.findByPk(id);
			const newState = !persona.EstadoPersona;
			await persona.update({ EstadoPersona: newState });
			return persona;
		} catch (error) {
			console.error(`Unable to toggle persona state: ${error}`);
			throw error;
		}
	}
}

// Definición del modelo Persona en Sequelize
Persona.init({
	IdPersona: {
		type: DataTypes.INTEGER,
		primaryKey: true,
		autoIncrement: true
	},
	NombrePersona: {
		type: DataTypes.STRING(20),
		allowNull: false
	},
	ApellidoPersona: {
		type: DataTypes.STRING(20),
		allowNull: false
	},
	CorreoPersona: {
		type: DataTypes.STRING(30),
		allowNull: false,
		unique: true
	},
	ClavePersona: {
		type: DataTypes.STRING(20),
		allowNull: false
	},
	EstadoPersona: {
		type: DataTypes.BOOLEAN,
		defaultValue: false
	},
	FotoPersona: {
		type: DataTypes.TEXT
	},
	FotoPersonaURL: {
		type: DataTypes.TEXT
	},
	bannerPersona: {
		type: DataTypes.TEXT
	},
	bannerPersonaURL: {
		type: DataTypes.TEXT
	},
	TelefonoPersona: {
		type: DataTypes.INTEGER
	},
	idRolFK: {
		type: DataTypes.INTEGER,
		allowNull: false
	}
}, {
	sequelize,
	tableName: 'Persona',
	timestamps: false,
	underscored: false,
});

export { Persona };
