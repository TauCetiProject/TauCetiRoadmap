import Mathlib

/-!
# Congruence modules of theta lifts: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about the lattices of algebraic modular forms on a definite unitary
group `U(V_j)` over a CM field, with values in the dual Weyl lattice of an algebraic representation,
about the Hecke algebra acting on them and its eigensystems, and about the `ℓ`-adic Galois
representations attached to those eigensystems (the Galois representations of definite unitary
groups of BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1). Neither Mathlib nor Tau Ceti
has these carriers at the pins. Mathlib has unitary groups of matrices over star rings
(`Matrix.unitaryGroup`) and continuous group cohomology, and Tau Ceti has abstract Selmer structures
(local conditions given as subgroups) and the Selmer groups of elliptic curves; neither has algebraic modular forms on adelic unitary groups, their Hecke algebras,
automorphic Galois representations, crystalline or de Rham representations of local Galois groups,
the Bloch–Kato finite classes, or congruence modules of Hecke modules.

* The total congruence bound (7.10c, 7.11): for every step `j` of a chain of theta lifts satisfying
  the size conditions, with a good twisting datum, a thick set of length at most `C_L·log x`
  satisfying the depth hypothesis and a host with wild-kernel budget `κ_W`, the weighted sum over the
  twisted places of the congruence lengths `η_j(𝔭)` is at most `d^Z_j·(C + κ_W)·x^ε·B₀`, with `C`
  depending only on constants fixed before `ε`. It lacks the lattices of algebraic modular forms on
  the definite groups of the chain, their Hecke algebras and lifted eigensystems, the congruence
  modules along a set of eigensystems, the twisted Tate–Shafarevich groups `Ш¹(E, ℓ, e)`, and the
  chain data (ThetaChainsOnDefiniteUnitaryGroups Layers 2–3).
* Twist selection for the lifts (7.8 (2)): an anticyclotomic character of `ℓ`-power order, ramified
  at a bounded number of degree-one places, after which the Bloch–Kato Selmer groups of the twisted
  lattices have length at most `v_ℓ(w_{tr}(E)) + ε′`. It lacks the Bloch–Kato local conditions above
  `ℓ` (crystalline representations and `H¹_f`), the Galois lattices attached to good eigenforms on
  `U(W_j)`, families of auxiliary places in position and the governing field.
* The Ribet-type bound with local defects (7.7b): the valuation of the congruence ideal of the cut
  by the type at a lifted point is at most the length of a relaxed Bloch–Kato Selmer group, the
  twisted Tate–Shafarevich groups, `v_ℓ(h_E)`, the tame costs and explicit local defects. It lacks,
  besides the Bloch–Kato Selmer groups, the Hecke–Galois family `(r_x)` over the localised Hecke
  algebra and its congruence ideal.
* Weight elimination (7.16): for a crystalline `ℓ`-adic representation of `G_E` with prescribed
  Hodge–Tate weights whose reduction contains a block of crystalline characters, the depth of its
  weight is at most `i_W(ℓ, τ)`. It lacks crystalline representations and their Hodge–Tate weights,
  and Wach lattices.

The elementary lattice statements on which the dual index of the projected lattice (7.15) rests are
HermitianFormsAndLattices §4.0a, owned there; 7.15 itself is a statement about lattices of algebraic
modular forms and is not a headline. The criterion 7.9 (a) is a statement about a representation of
an abstract group over `𝔽̄_ℓ` and good labels over a finite field; it is a step of the route to
residual irreducibility, its notion of good labels is owned by RowTowerAndRallisIdentities §5.3 and
the exceptional set `𝔅(N, g)` by ThetaChainsOnDefiniteUnitaryGroups §2.7, and it is not stated here.
-/

namespace TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.CongruenceModulesOfThetaLifts

end TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.CongruenceModulesOfThetaLifts
