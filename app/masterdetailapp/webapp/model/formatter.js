sap.ui.define([], function () {
	"use strict";

	return {
		/**
		 * Rounds the currency value to 2 digits
		 *
		 * @public
		 * @param {string} sValue value to be formatted
		 * @returns {string} formatted currency value with 2 digits
		 */
		currencyValue : function (sValue) {
			if (!sValue) {
				return "";
			}

			return parseFloat(sValue).toFixed(2);
        },
        
        calcCapacity: function (used_weight, weight_cap,used_volume, volume_cap){

            // Weight capacity percentage
            var wp = used_weight/weight_cap*100;
            // Volume capacity percentage
            var vp = used_volume/volume_cap*100;

            // Return the highest value
            if(wp>vp) return wp.toFixed(2);
            else return vp.toFixed(2)            
        },

        visible : function(value) {
            return !(typeof(value) == 'undefined' || value == null);
        },

        defineTypeIcon : function(foType, icon) {
            if(foType==="FORA" && icon === "rail") return true;
            if(foType!=="FORA" && icon === "rail") return false;
            if(foType!=="FORA" && icon === "road") return true;
            if(foType==="FORA" && icon === "road") return false;
        }
	};
});