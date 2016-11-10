//
//  Tools.swift
//  Weather Now
//
//  Created by Nick Hayward on 7/9/15.
//  Copyright (c) 2015 Nick Hayward. All rights reserved.
//

import Foundation
import Cocoa

public class BackgroundController {
  
  
  // BlackBackground
  public class BlackGradient {
    
    let colorTop = NSColor.darkGray
    let colorBottom = NSColor.black
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  

  
  // Day Background Gradient
  public class day_20Gradient {
    // 225	244	254
    let colorTop = NSColor(red: 225/255.0, green: 244/255.0, blue: 254/255.0, alpha: 1.0).cgColor
    // 200	234	251
    let colorBottom = NSColor(red: 200/255.0, green: 234/255.0, blue: 251/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  
  public class day20_30Gradient {
    // 196	231	251
    let colorTop = NSColor(red: 196/255.0, green: 231/255.0, blue: 251/255.0, alpha: 1.0).cgColor
    // 157	217	249
    let colorBottom = NSColor(red: 157/255.0, green: 217/255.0, blue: 249/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  public class day30_40Gradient {
    // 131	209	245
    let colorTop = NSColor(red: 131/255.0, green: 209/255.0, blue: 245/255.0, alpha: 1.0).cgColor
    // 92	179	221
    let colorBottom = NSColor(red: 92/255.0, green: 179/255.0, blue: 221/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  public class day40_50Gradient {
    // 72	191	241
    let colorTop = NSColor(red: 131/255.0, green: 209/255.0, blue: 245/255.0, alpha: 1.0).cgColor
    // 22	112	149
    let colorBottom = NSColor(red: 22/255.0, green: 112/255.0, blue: 149/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  public class day50_60Gradient {
    // 20	155	234
    let colorTop = NSColor(red: 20/255.0, green: 155/255.0, blue: 234/255.0, alpha: 1.0).cgColor
    // 16	97	175
    let colorBottom = NSColor(red: 16/255.0, green: 97/255.0, blue: 175/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  public class day60_70Gradient {
    // 17	132	196
    let colorTop = NSColor(red: 17/255.0, green: 132/255.0, blue: 196/255.0, alpha: 1.0).cgColor
    // 15	83	149
    let colorBottom = NSColor(red: 15/255.0, green: 83/255.0, blue: 159/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  public class day70_80Gradient {
    // 244	138	61
    let colorTop = NSColor(red: 244/255.0, green: 138/255.0, blue: 61/255.0, alpha: 1.0).cgColor
    // 235	70	40
    let colorBottom = NSColor(red: 235/255.0, green: 70/255.0, blue: 40/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  public class day80_90Gradient {
    // 241	115	26
    let colorTop = NSColor(red: 241/255.0, green: 115/255.0, blue: 26/255.0, alpha: 1.0).cgColor
    // 231	54	27
    let colorBottom = NSColor(red: 231/255.0, green: 54/255.0, blue: 27/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  public class day90_100Gradient {
    // 238	95	53
    let colorTop = NSColor(red: 238/255.0, green: 95/255.0, blue: 53/255.0, alpha: 1.0).cgColor
    // 234	54	55
    let colorBottom = NSColor(red: 234/255.0, green: 54/255.0, blue: 55/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  public class day100_110Gradient {
    // 235	68	27
    let colorTop = NSColor(red: 235/255.0, green: 68/255.0, blue: 27/255.0, alpha: 1.0).cgColor
    // 230	23	28
    let colorBottom = NSColor(red: 230/255.0, green: 23/255.0, blue: 28/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  public class day110_120Gradient {
    // 230	36	28
    let colorTop = NSColor(red: 230/255.0, green: 36/255.0, blue: 28/255.0, alpha: 1.0).cgColor
    // 229	0	28
    let colorBottom = NSColor(red: 229/255.0, green: 0/255.0, blue: 28/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  
  public class day120_Gradient {
    // 226	0	28
    let colorTop = NSColor(red: 226/255.0, green: 0/255.0, blue: 28/255.0, alpha: 1.0).cgColor
    // 150	0	17
    let colorBottom = NSColor(red: 150/255.0, green: 0/255.0, blue: 17/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  // Night Background Gradients
  public class night_30Gradient {
    // 50	60	93
    let colorTop = NSColor(red: 50/255.0, green: 60/255.0, blue: 93/255.0, alpha: 1.0).cgColor
    // 33	47	81
    let colorBottom = NSColor(red: 33/255.0, green: 47/255.0, blue: 81/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  
  public class night30_50Gradient {
    // 56	67	103
    let colorTop = NSColor(red: 56/255.0, green: 67/255.0, blue: 103/255.0, alpha: 1.0).cgColor
    // 37	51	88
    let colorBottom = NSColor(red: 37/255.0, green: 51/255.0, blue: 88/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  public class night50_70Gradient {
    // 80	95	144
    let colorTop = NSColor(red: 80/255.0, green: 95/255.0, blue: 144/255.0, alpha: 1.0).cgColor
    // 46	64	108
    let colorBottom = NSColor(red: 46/255.0, green: 64/255.0, blue: 108/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  public class night70_Gradient {
    // 12	87	128
    let colorTop = NSColor(red: 12/255.0, green: 87/255.0, blue: 128/255.0, alpha: 1.0).cgColor
    // 41	71	101
    let colorBottom = NSColor(red: 41/255.0, green: 71/255.0, blue: 101/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
      gl = CAGradientLayer()
      gl.colors = [ colorTop, colorBottom]
      gl.locations = [ 0.0, 1.0]
    }
  }
  
  
  
  
}
