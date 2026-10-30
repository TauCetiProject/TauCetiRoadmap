import Mathlib

/-!
# Geometric Satake and fusion: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

General neutral and relative Tannaka reconstruction, finite-type recognition and
characteristic-zero connectedness recognition are supplied by
MotivesAndAlgebraicCycles §§6.1–6.4. GS4 verifies the Satake hypotheses and
identifies the resulting coordinate Hopf algebra, marked fibre and coactions.

The geometric headline results require carriers absent from the pins. GS0's bounded
Witt and Beilinson–Drinfeld Grassmannians, projective perfect models and their
geometric determinant lines have not been constructed. Witt-vector rings, ordinary
schemes and the module Grassmannian do not supply these moduli spaces. GS1's ULA
recognition, relative perversity and special/generic comparison require the local
Hecke v-stacks and their constructible sheaf categories. Those same missing
categories prevent statements of GS2's tensor convolution and rigidity, GS3's
coherent parity-corrected symmetric fusion, and GS4's geometric reconstruction,
integral pinned dual identification and rational Witt and normalized integral
Satake equivalences. Applying relative reconstruction requires the coherent linear
Satake category, bounded enriched representers and internal-comodule comparison
specified in GS4.
The perfect-complex extension requires the relative perfect categories of
classifying stacks and the enhanced Hecke category; the classical comparison
requires Frobenius-descended Satake objects and the spherical Hecke transform.
No geometric equivalence or trace comparison is stated without these objects.
-/
