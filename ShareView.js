/**
 * Created by aykj on 2016/12/20.
 */

import React, { Component } from 'react';
import {
    NativeModules,
    requireNativeComponent,
    TouchableOpacity,
    View,
    Text
} from 'react-native';

// var UMShare = NativeModules.GZYUmengShare
//
// export default class GZYShareView extends Component {
//
//
//     _share(){
//         UMShare.showShareView()
//     }
//
//     render() {
//         return (
//             <View style={{flex:1,justifyContent:'center',alignItems:'center'}}>
//                 <TouchableOpacity onPress={this._share}>
//                     <Text>
//                      分享
//                     </Text>
//                 </TouchableOpacity>
//             </View>
//     );
//     }
// }

var GZYShareView = requireNativeComponent('GZYUMShareView',ShareView)

export default class ShareView extends Component{

    static propTypes = {
        title:React.PropTypes.string,
        shareText:React.PropTypes.string,
        imageName:React.PropTypes.string,
        webUrl:React.PropTypes.string
    }

    render(){
        return(
            <GZYShareView {...this.props}/>
        )
    }


}


