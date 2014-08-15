/* -*- Mode: vala; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-
 *
 * Copyright © 2014 Nikhar Agrawal
 *
 * This file is part of libgames-scores.
 *
 * libgames-scores is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * libgames-scores is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with libgames-scores.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace Games
{
namespace Scores
{

using Gtk;

private class Name : Gtk.Dialog
{
    private Context scores;

    public Name (Context scores, Window window)
    {
        Object (use_header_bar : 1);
        this.scores = scores;
	this.transient_for = window;

        var vbox = this.get_content_area ();
        set_border_width (5);

        Entry entry = new Entry ();
        vbox.pack_start (entry, true, true, 0);

        entry.set_text (scores.player_name);

        entry.set_icon_from_icon_name (Gtk.EntryIconPosition.SECONDARY, "edit-clear");
        entry.icon_press.connect ((pos, event) =>
        {
            if (pos == Gtk.EntryIconPosition.SECONDARY)
            {
                entry.set_text ("");
            }
        });
        entry.activate.connect (() => { scores.player_name = entry.get_text ();});

        vbox.show_all ();
    }
}

} /* namespace Scores */
} /* namespace Games */