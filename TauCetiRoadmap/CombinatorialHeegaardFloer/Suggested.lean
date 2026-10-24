import Mathlib
import TauCeti.LowDimTopology.Plumbing.ChainComplex
import TauCeti.LowDimTopology.Plumbing.OneVertex

/-!
# Combinatorial Heegaard Floer and grid homology: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap is in `README.md`: the combinatorial bodies of theory that are
formalizable now — grid homology (Lane G), bigraded and filtered homological algebra
(Lane ALG), knot-theory reconciliation (Lane K), lattice homology (Lane L), and the
Ozsváth–Stipsicz–Szabó stable `HF̂` of 3-manifolds (Lane H). The analytic tower lives
in the sibling `HeegaardFloer` roadmap, which also owns the reconciliation theorems
that match each invariant here to its holomorphic counterpart (they are
analytic-blocked, so they are tracked with the slower track).

The plumbing package already supplies a characteristic-two weighted cubical
complex and its homology for a finite plumbing graph and characteristic covector.
Reuse this exact carrier where its hypotheses match; it is not the integral model,
or a proof of the general graph/surface targets. Grid homology, link types,
bigraded polynomial modules, and the broader lattice models remain roadmap targets.
-/

noncomputable section

namespace TauCetiRoadmap.CombinatorialHeegaardFloer

abbrev NativePlumbingComplex {V : Type*} [DecidableEq V] [Fintype V]
    (P : TauCeti.PlumbingGraph V) (k : P.characteristicVectors) :=
  P.latticeChainComplex k

abbrev NativePlumbingHomology {V : Type*} [DecidableEq V] [Fintype V]
    (P : TauCeti.PlumbingGraph V) (k : P.characteristicVectors) (q : ℕ) :=
  P.latticeChainHomology k q

/-- The actual native object in a fixed cubical degree. -/
abbrev NativePlumbingDegree {V : Type*} [DecidableEq V] [Fintype V]
    (P : TauCeti.PlumbingGraph V) (k : P.characteristicVectors) (q : ℕ) :=
  (P.latticeChainComplex k).X q

/-- The actual native chain boundary from degree `q+1` to degree `q`. -/
abbrev NativePlumbingBoundary {V : Type*} [DecidableEq V] [Fintype V]
    (P : TauCeti.PlumbingGraph V) (k : P.characteristicVectors) (q : ℕ) :=
  (P.latticeChainComplex k).d (q + 1) q

/-- A tower-valued cochain is an actual `ℤ`-linear map out of the integral cube chains.
This is a typed carrier shape; each source instance must still supply its precise cube
chains and coefficient module `Tplus`. -/
abbrev TowerValuedCochain (Cq Tplus : Type*) [AddCommGroup Cq] [Module ℤ Cq]
    [AddCommGroup Tplus] [Module ℤ Tplus] :=
  Cq →ₗ[ℤ] Tplus

/-- The type of a degree-raising coboundary between two tower-valued cochain groups. -/
abbrev TowerCochainStep (Cq Csucc Tplus : Type*) [AddCommGroup Cq] [Module ℤ Cq]
    [AddCommGroup Csucc] [Module ℤ Csucc] [AddCommGroup Tplus] [Module ℤ Tplus] :=
  TowerValuedCochain Cq Tplus →ₗ[ℤ] TowerValuedCochain Csucc Tplus

-- Future comparison target: Némethi cohomology versus full cubical homology,
-- only on an explicitly stated common hypothesis and with the grading, support,
-- completion, Hom/duality, coefficient and characteristic-covector maps as arguments.
-- `TowerValuedCochain` and `TowerCochainStep` name the actual Hom_Z carrier shape;
-- the Némethi `Tplus` quotient and weighted face map remain explicit construction targets.
-- theorem nemethi_to_full_cubical_on_overlap ... := by sorry

-- Future integral/general-graph target: define the finite-support signed `ℤ[U]`
-- chain complex, not a cochain complex; prove exponent bounds and `∂²=0` under
-- explicit graph and surface hypotheses. Its map to Némethi's Hom_Z(-, Tplus)
-- cochains requires a separately specified support/duality/completion comparison.
-- def IntegralGraphComplex ... := ...
-- theorem integral_graph_boundary_squared ... := by sorry

end TauCetiRoadmap.CombinatorialHeegaardFloer

/-!
The natural first new grid theorems (Lane G.3–G.5) remain `∂² = 0` for the fully
blocked grid complex over `𝔽₂`, `χ(GĤ K) = Δ_K(t)`, and invariance under the specified
grid moves. The native plumbing imports do not implement them.
-/

namespace TauCetiRoadmap.CombinatorialHeegaardFloer

-- (no theorem targets yet; see README.md)

end TauCetiRoadmap.CombinatorialHeegaardFloer
