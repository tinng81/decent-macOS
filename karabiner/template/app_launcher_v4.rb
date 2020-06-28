#!/usr/bin/env ruby
# Parameters

PARAMETERS = {
  :simultaneous_threshold_milliseconds => 1000,
  :trigger_key => 'o',
  :mod_key => ['left_control', 'left_shift', 'left_option', 'left_command'], # Hyper Key
}.freeze

############################################################

require 'json'
require_relative '../lib/karabiner.rb'

def main
  data = {
    'title' => 'App Launcher v4',
    'maintainers' => ['tinng81'],
    'rules' => [
      {
        'description' => 'App Launcher v4 (rev 12)',
        'manipulators' => [
          generate_launcher_mode('g', [{ 'shell_command' => "open -a 'GitHub Desktop.app'" }]),
          generate_launcher_mode('i', [{ 'shell_command' => "open -a 'iTunes.app'" }]),
          generate_launcher_mode('a', [{ 'shell_command' => "open -a 'Activity Monitor.app'" }]),
          generate_launcher_mode('d', [{ 'shell_command' => "open -a 'Disk Utility.app'" }]),
          generate_launcher_mode('v', [{ 'shell_command' => "open -a 'Visual Studio Code.app'" }]),
          generate_launcher_mode('t', [{ 'shell_command' => "open -a 'iTerm.app'" }]),
          generate_launcher_mode('m', [{ 'shell_command' => "open -a 'Airmail 3.app'" }]),
          generate_launcher_mode('c', [{ 'shell_command' => "open -a 'Calendar.app'" }]),
          generate_launcher_mode('f', [{ 'shell_command' => "open -a 'Firefox.app'" }]),
          generate_launcher_mode('s', [{ 'shell_command' => "open -a 'Safari.app'" }]),

          generate_launcher_mode('1', [{ 'shell_command' => "open -a 'Microsoft OneNote.app'" }]),
          generate_launcher_mode('2', [{ 'shell_command' => "open -a 'Microsoft Word.app'" }]),
          generate_launcher_mode('3', [{ 'shell_command' => "open -a 'Microsoft Excel.app'" }]),
          generate_launcher_mode('4', [{ 'shell_command' => "open -a 'Microsoft PowerPoint.app'" }]),
          
          generate_launcher_mode('5', [{ 'shell_command' => "open -a 'Keynote.app'" }]),
          generate_launcher_mode('6', [{ 'shell_command' => "open -a 'Numbers.app'" }]),
          generate_launcher_mode('7', [{ 'shell_command' => "open -a 'Pages.app'" }]),

          # generate_launcher_mode('tab', [{ 'key_code' => 'mission_control' }]),
        ].flatten,
      },
    ],
  }

  puts JSON.pretty_generate(data)
end

def generate_launcher_mode(from_key_code, to)
  data = []

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'key_code' => from_key_code,
      'modifiers' => Karabiner.from_modifiers(PARAMETERS[:mod_key]),
    },
    'to' => to,
    'conditions' => [Karabiner.variable_if('launcher_mode_v4', 1)],
  }

  data << h

  ############################################################

  h = {
    'type' => 'basic',
    'from' => {
      'simultaneous' => [
        { 'key_code' => PARAMETERS[:trigger_key] },
        { 'key_code' => from_key_code },
      ],
      'simultaneous_options' => {
        'key_down_order' => 'strict',
        'key_up_order' => 'insensitive',
        'to_after_key_up' => [
          Karabiner.set_variable('launcher_mode_v4', 0),
        ],
      },
      'modifiers' => Karabiner.from_modifiers(PARAMETERS[:mod_key]),
    },
    'to' => [
      Karabiner.set_variable('launcher_mode_v4', 1),
    ].concat(to),
    'parameters' => {
      'basic.simultaneous_threshold_milliseconds' => PARAMETERS[:simultaneous_threshold_milliseconds],
    },
  }

  data << h

  ############################################################

  data
end

main
