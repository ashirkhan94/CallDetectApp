import PropTypes from 'prop-types';
import React from 'react';
import { requireNativeComponent, findNodeHandle } from 'react-native';

export class RNVideoRenderView extends React.Component {
    static propTypes: {
        /**
         * A int value to identifier the Video view, will be used to bind video stream later
         */
        tileId: PropTypes.Requireable<number>;
    };

    render() {
        return <VideoView {...this.props} />;
    }
}

RNVideoRenderView.propTypes = {
    /**
     * A int value to identifier the Video view, will be used to bind video stream later
     */
    tileId: PropTypes.number,
};

var VideoView = requireNativeComponent('VideoView');