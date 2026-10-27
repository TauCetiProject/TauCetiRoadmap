import Mathlib
import TauCeti.KnotTheory.Grid.Homology.Tau
import TauCeti.KnotTheory.Grid.Move.Components
import TauCeti.LowDimTopology.Plumbing.ChainComplex
import TauCeti.LowDimTopology.Plumbing.BlowUp
import TauCeti.LowDimTopology.Plumbing.EdgeBlowUp

/-!
# Combinatorial Heegaard Floer and grid homology: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the roadmap that are statable on the native carriers:
invariance of the grid invariant `τ` under grid moves (Lane G.5–G.7), and invariance of the
characteristic-two lattice homology of a negative-definite plumbing under the two genus-zero
`(-1)`-blow-ups of valence at most two (Lane L, after Némethi, arXiv:0709.0841, Proposition
3.4.2 and Remark 3.4.3(a)).

Headline theorems that are not statable at the pins, and the missing carrier of each:

* the Milnor conjecture `u(T_{p,q}) = (p−1)(q−1)/2` and `|τ(K)| ≤ u(K)` (Lane G.7): no
  unknotting number and no crossing-change relation on `TauCeti.GridLink`;
* `|τ(K)| ≤ g_s(K)` (Lane G.10): no map from grid diagrams to smooth knots carrying a slice
  genus;
* `χ(GĤ(K)) = Δ_K(t)` (Lane G.4): Tau Ceti's Alexander polynomial is defined on Seifert
  matrices, and no Seifert matrix of a grid diagram exists at the pin;
* invariance of `HF̂_st` (Lane H.3): no multi-pointed Heegaard diagram with the nice-move
  calculus and no stable chain complex;
* Némethi's cohomology `Hom_ℤ(C_q, T⁺)` with genus-decorated weights (Lane L.1) and the signed
  `ℤ[U]` graph/surface chain complex (Lane L.3): `TauCeti.PlumbingGraph` carries no genus
  decoration and the native complex has `𝔽₂[U]` coefficients only;
* the correction-term formula and the completed comparison with `HF⁻`: no Heegaard Floer
  homology or `d`-invariant at the pin.
-/

namespace TauCetiRoadmap.CombinatorialHeegaardFloer

/-! ## Lane G: grid homology -/

/-- **Grid invariance of `τ`.** If two grid diagrams are related by grid moves (cyclic
permutations, commutations, stabilizations and destabilizations) and one presents a knot, then
the invariants `τ` of the two diagrams agree over every commutative ring of characteristic two.
This is the descent to `τ` of the invariance of `GH⁻` as a graded `𝔽[U]`-module
(Ozsváth–Stipsicz–Szabó, *Grid Homology for Knots and Links*, Theorem 5.3.1 and Definition 6.1.5). -/
theorem tau_eq_of_movesTo {n m : ℕ} {G : TauCeti.GridDiagram n} {G' : TauCeti.GridDiagram m}
    (hG : G.IsKnot) (h : G.MovesTo G') (K : Type*) [CommRing K] [CharP K 2] :
    (h.isKnot_iff.mpr hG).tau K = hG.tau K := by
  sorry

/-! ## Lane L: lattice homology -/

/-- **Blow-up invariance of lattice homology at a vertex.** For a negative-definite plumbing
graph `P`, a characteristic covector `k` and an odd value `ε` on the exceptional class, the
characteristic-two lattice homology of the blow-up of `P` at a vertex, in the characteristic
covector extending `k` by `ε`, is isomorphic in every cubical degree to that of `P` in `k`
(Némethi, arXiv:0709.0841, Proposition 3.4.2, homological form of Remark 3.4.3(a)). -/
theorem latticeChainHomology_blowUpVertex {V : Type*} [DecidableEq V] [Fintype V]
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
theorem latticeChainHomology_blowUpEdge {V : Type*} [DecidableEq V] [Fintype V]
    (P : TauCeti.PlumbingGraph V) (hP : P.IsNegativeDefinite) (u v : V)
    (h : P.toSimpleGraph.Adj u v) (k : P.characteristicVectors) (ε : ℤ) (hε : Odd ε) (q : ℕ) :
    Nonempty ((P.blowUpEdge u v h).latticeChainHomology
        (P.blowUpEdgeCharacteristic u v h k ε hε) q ≅ P.latticeChainHomology k q) := by
  sorry

end TauCetiRoadmap.CombinatorialHeegaardFloer
