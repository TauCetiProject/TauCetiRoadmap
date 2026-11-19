import Mathlib
import TauCeti.KnotTheory.Grid.Homology.Bigraded
import TauCeti.KnotTheory.Grid.Homology.HatBigrading
import TauCeti.KnotTheory.Grid.Move.Components
import TauCeti.KnotTheory.Grid.Move.Tau
import TauCeti.KnotTheory.Grid.CrossingChange.UnknottingNumber
import TauCeti.LowDimTopology.Plumbing.ChainComplex
import TauCeti.LowDimTopology.Plumbing.BlowUp
import TauCeti.LowDimTopology.Plumbing.EdgeBlowUp

/-!
# Combinatorial Heegaard Floer and grid homology: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable on the native carriers:
invariance of the grid homologies `GH⁻` and `GĤ` of a knot grid under grid moves, as bigraded
modules (Layer 3, §3.5), the bound `|τ(K)| ≤ u(K)` and the Milnor conjecture for grid knots
(Layer 3, §3.7), and invariance of the characteristic-two lattice homology of a negative-definite
plumbing under the two genus-zero `(-1)`-blow-ups of valence at most two (Layer 4, §4.1, after
Némethi, arXiv:0709.0841, Proposition 3.4.2 and Remark 3.4.3(a)).

The Alexander-graded invariance of `GH⁻` and the invariance of `τ` under grid moves are proved at
the Tau Ceti pin, as `TauCeti.GridDiagram.IsKnot.unblockedHomologyIsomorphic_of_movesTo` and
`TauCeti.GridDiagram.IsKnot.tau_eq_of_movesTo`, and are not restated here.
The fully blocked homology `GH̃` is not an invariant of the knot; its relation
`GH̃(G) ≅ GĤ(K) ⊗ W^⊗(n−1)` to `GĤ` is a target of README §3.5, not a headline.

Headline theorems that are not statable at the pins, and the missing carrier of each:

* the link form of grid invariance, over `𝔽[V₁,…,V_ℓ]` with one variable per component (§3.6):
  no component-indexed coefficient ring for the unblocked complex of a link;
* `χ(GĤ(K)) = Δ_K(t)` (§3.4): Tau Ceti's Alexander polynomial `TauCeti.KnotTheory.alexander` is
  defined on Seifert matrices, and no Seifert matrix or Alexander polynomial of a grid knot
  exists at the pin;
* `|τ(K)| ≤ g_s(K)` (§3.10): no map from grid knots to smooth knots, on which Tau Ceti's slice
  genus `TauCeti.sliceGenus` is defined;
* the invariance of the filtered quasi-isomorphism type of the Alexander-filtered grid complex
  (§3.13): no filtered chain homotopy equivalence at the pins;
* Cromwell's theorem (§2.2): no map from grid diagrams to links in `S³`;
* invariance of `HF̂_st` (§§5.3 and 5.5): no nice-move calculus, no convenient diagrams, no
  classes of pairs (homology, number of basepoints) and no homology of Tau Ceti's hat
  differential `TauCeti.HeegaardRegionSystem.hatDifferential`;
* Némethi's cohomology `Hom_ℤ(C_q, T⁺)` with genus-decorated weights and its invariance under the
  genus-zero blow-ups (§4.2), and the genus-corrected integral complex (§4.4):
  `TauCeti.PlumbingGraph` carries no genus decoration and there is no `T⁺`-valued cochain
  carrier;
* the correction-term formula and the completed comparison with `HF⁻`: no Heegaard Floer
  homology or `d`-invariant at the pins.
-/

namespace TauCetiRoadmap.CombinatorialHeegaardFloer

open Polynomial

/-! ## Layer 3: grid homology -/

/-- Two knot grids have **isomorphic unblocked grid homologies as bigraded `K[U]`-modules**: some
`K[U]`-linear equivalence `GH⁻(G) ≃ GH⁻(G')`, with `U` acting through any one variable, maps the
piece of each (Maslov, Alexander) bidegree into the piece of the same bidegree. The Maslov grading
is `M_O`; the two grids may have different sizes. -/
def BigradedUnblockedHomologyIsomorphic {n m : ℕ} {G : TauCeti.GridDiagram n}
    {G' : TauCeti.GridDiagram m} (hG : G.IsKnot) (hG' : G'.IsKnot)
    (K : Type*) [CommRing K] [CharP K 2] : Prop :=
  letI := hG.unblockedHomologyModule K
  letI := hG'.unblockedHomologyModule K
  ∃ e : G.unblockedHomology K ≃ₗ[K[X]] G'.unblockedHomology K,
    TauCeti.LinearMap.IsHomogeneous e.toLinearMap
      (hG.toOddComponentGridDiagram.bigradedUnblockedHomologyGrading K).piece
      (hG'.toOddComponentGridDiagram.bigradedUnblockedHomologyGrading K).piece 0

/-- **Grid invariance of `GH⁻`, bigraded.** If two grid diagrams are related by grid moves and one
presents a knot, then their unblocked grid homologies are isomorphic as bigraded `K[U]`-modules,
by an isomorphism preserving the Maslov grading `M_O` and the Alexander grading, over every
commutative ring `K` of characteristic two (Ozsváth–Stipsicz–Szabó, *Grid Homology for Knots and
Links*, Theorem 5.3.1). -/
theorem bigradedUnblockedHomologyIsomorphic_of_movesTo {n m : ℕ} {G : TauCeti.GridDiagram n}
    {G' : TauCeti.GridDiagram m} (hG : G.IsKnot) (h : G.MovesTo G')
    (K : Type*) [CommRing K] [CharP K 2] :
    BigradedUnblockedHomologyIsomorphic hG (h.isKnot_iff.mpr hG) K := by
  sorry

/-- **Grid invariance of `GĤ`.** If two grid diagrams `G` and `G'` are related by grid moves and
one presents a knot, then for any choice of the blocked `O`-markings `i` of `G` and `i'` of `G'`,
their simply blocked grid homologies, as modules over `K`, are isomorphic by an isomorphism
preserving the Maslov grading `M_O` and the Alexander grading, over every commutative ring `K` of
characteristic two (Ozsváth–Stipsicz–Szabó, *Grid Homology for Knots and Links*, Theorem 5.3.1,
with Corollary 4.6.17 for the choice of the blocked marking). -/
theorem simplyBlockedHomology_equiv_of_movesTo {n m : ℕ} {G : TauCeti.GridDiagram n}
    {G' : TauCeti.GridDiagram m} (hG : G.IsKnot) (h : G.MovesTo G') (i : Fin n) (i' : Fin m)
    (K : Type*) [CommRing K] [CharP K 2] :
    ∃ e : (ModuleCat.restrictScalars
          (MvPolynomial.C : K →+* MvPolynomial {c : Fin n // c ≠ i} K)).obj
          ((G.simplyBlockedComplex K i).homology ()) ≃ₗ[K]
        (ModuleCat.restrictScalars
          (MvPolynomial.C : K →+* MvPolynomial {c : Fin m // c ≠ i'} K)).obj
          ((G'.simplyBlockedComplex K i').homology ()),
      TauCeti.LinearMap.IsHomogeneous e.toLinearMap
        (hG.toOddComponentGridDiagram.bigradedHatHomologyGrading K i).piece
        ((h.isKnot_iff.mpr hG).toOddComponentGridDiagram.bigradedHatHomologyGrading K i').piece
        0 := by
  sorry

/-- **`τ` bounds the unknotting number.** For a grid knot `L` and a field `K` of characteristic
two, `|τ(L)| ≤ u(L)`, where the unknotting number `u(L)` is the least number of crossing changes,
each a cross-commutation of presenting grid diagrams, that turn `L` into the unknot
(Ozsváth–Stipsicz–Szabó, *Grid Homology for Knots and Links*, Corollary 6.1.8). -/
theorem natAbs_tau_le_unknottingNumber {L : TauCeti.GridLink} (hL : L.IsKnot)
    (K : Type*) [Field K] [CharP K 2] :
    ((hL.tau K).natAbs : ℕ∞) ≤ L.unknottingNumber := by
  sorry

/-- **The Milnor conjecture for grid knots.** If `p + 1` and `q + 1` are coprime, the knot
presented by the standard grid `torusLink p q` of the `(p + 1, q + 1)` torus knot has unknotting
number `p q / 2`, that is `(P - 1)(Q - 1) / 2` for `P = p + 1` and `Q = q + 1`
(Ozsváth–Stipsicz–Szabó, *Grid Homology for Knots and Links*, Corollary 6.3.3, after Sarkar,
arXiv:1011.5265). -/
theorem unknottingNumber_toGridLink_torusLink {p q : ℕ} (h : (p + 1).Coprime (q + 1)) :
    (TauCeti.GridDiagram.torusLink p q).toGridLink.unknottingNumber = ((p * q / 2 : ℕ) : ℕ∞) := by
  sorry

/-! ## Layer 4: lattice homology -/

/-- **Blow-up invariance of lattice homology at a vertex.** For a negative-definite plumbing
graph `P`, a characteristic covector `k` and an odd value `ε` on the exceptional class, the
characteristic-two lattice homology of the blow-up of `P` at a vertex, in the characteristic
covector extending `k` by `ε`, is isomorphic in every cubical degree to that of `P` in `k`
(Némethi, arXiv:0709.0841, Proposition 3.4.2, homological form of Remark 3.4.3(a)). -/
theorem nonempty_latticeChainHomology_blowUpVertex {V : Type*} [DecidableEq V] [Fintype V]
    (P : TauCeti.PlumbingGraph V) (hP : P.IsNegativeDefinite) (v : V)
    (k : P.characteristicVectors) (ε : ℤ) (hε : Odd ε) (q : ℕ) :
    Nonempty ((P.blowUpVertex v).latticeChainHomology (P.blowUpCharacteristic v k ε hε) q ≅
      P.latticeChainHomology k q) := by
  sorry

/-- **Blow-up invariance of lattice homology along an edge.** For a negative-definite plumbing
graph `P`, adjacent vertices `u` and `v`, a characteristic covector `k` and an odd value `ε` on
the exceptional class, the characteristic-two lattice homology of the blow-up of `P` along the
edge `uv` is isomorphic in every cubical degree to that of `P` (Némethi, arXiv:0709.0841,
Proposition 3.4.2, the intersection-point case of its proof). -/
theorem nonempty_latticeChainHomology_blowUpEdge {V : Type*} [DecidableEq V] [Fintype V]
    (P : TauCeti.PlumbingGraph V) (hP : P.IsNegativeDefinite) (u v : V)
    (h : P.toSimpleGraph.Adj u v) (k : P.characteristicVectors) (ε : ℤ) (hε : Odd ε) (q : ℕ) :
    Nonempty ((P.blowUpEdge u v h).latticeChainHomology
        (P.blowUpEdgeCharacteristic u v h k ε hε) q ≅ P.latticeChainHomology k q) := by
  sorry

end TauCetiRoadmap.CombinatorialHeegaardFloer
