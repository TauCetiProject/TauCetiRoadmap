import Mathlib
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Representation.Faithful.Basic

/-!
# Automorphic bundles: headline theorem signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`; discharging these statements finishes neither a layer nor the roadmap.

Layer B1.1's `finiteTensorStabilizer` states that every faithful representation of a reductive
algebraic group in characteristic zero realizes that group as the pointwise stabilizer of finitely
many mixed tensors. It uses Tau Ceti's coordinate Hopf algebras, comodules and scheme-theoretic
faithfulness. Mathlib's tensor algebra on `V × Module.Dual k V` packages finite sums of mixed tensor
words. Testing the same tensors over every commutative coefficient algebra specifies the stabilizer
as a group scheme, including its points over nonreduced algebras. A Tate line included in the
coefficient is part of `V` with its actual group action; it is not trivialized.

The other headline results require objects absent from the pinned libraries:

* B0's associated-coefficient descent and analytic comparison need geometric group torsors,
  analytic Shimura quotients and ShimuraData's compact-dual, reflex-flag-descent and
  homogeneous-variation objects.
* B1 and B1.general's canonical principal-bundle existence, embedding independence and normalized
  conjugation need Shimura data, canonical models and their Hodge-tensor realizations, with the
  deligne-torus convention of ReductiveGroupsPartII.
* B2 and B2.general's automorphic bundle and realization comparisons need those principal bundles,
  arithmetic coefficient local systems and filtered de Rham realizations.
* B3 and B3.general's canonical extensions, fan independence and logarithmic comparisons need
  toroidal models, degeneration charts and automorphic boundary sheaves. B3.Hilbert's splitting-model
  compactification and cusp detection additionally need the ramified Hilbert moduli spaces.
* B3.log's ordinary and compact-support period comparisons need logarithmic adic spaces,
  pro-Kummer-étale coefficient systems and period sheaves. B3.BGG's relative resolution and geometric
  dual BGG comparison need algebraic `GSp₄` coefficient modules and relative parabolic complexes,
  together with their automorphic sheaves and logarithmic connections.
* B3.HT's perfectoid towers, rational Levi torsor and algebraic coefficient descent need perfectoid
  Shimura towers and Hodge–Tate period maps.
* B4's geometric–analytic comparison and classical VB normalization, and B5's geometric Hecke
  action, scalar and vector Fourier–Jacobi expansion principles, ramified Hilbert q-expansion
  principle and ordinary and compact-support Siegel decompositions need these automorphic
  coefficients, compactifications, expansion maps and cohomology comparisons.

These headline statements remain specified in the README. Their missing structures cannot be
replaced by the analytic modular-form carriers or by numerical weight formulas.
-/

open scoped TensorProduct

namespace TauCetiRoadmap.AutomorphicBundles

universe u

variable {k V : Type u} [Field k] [AddCommGroup V] [Module k V]

/-- Extend mixed tensors to a coefficient algebra, including the natural base change of duals. -/
noncomputable def mixedTensorBaseChange (A : Type u) [CommRing A] [Algebra k A] :
    TensorAlgebra k (V × Module.Dual k V) →ₐ[k]
      TensorAlgebra A ((A ⊗[k] V) × Module.Dual A (A ⊗[k] V)) :=
  TensorAlgebra.lift k <|
    ((TensorAlgebra.ι A).restrictScalars k).comp
      ((TensorProduct.mk k A V 1).prodMap (Module.Dual.baseChange A))

/-- Act on mixed tensors by `g` on vectors and by precomposition with `g⁻¹` on duals. -/
noncomputable def mixedTensorAction {A W : Type u} [CommRing A]
    [AddCommGroup W] [Module A W] (g : W ≃ₗ[A] W) :
    TensorAlgebra A (W × Module.Dual A W) →ₐ[A] TensorAlgebra A (W × Module.Dual A W) :=
  TensorAlgebra.lift A <|
    (TensorAlgebra.ι A).comp (g.toLinearMap.prodMap g.symm.toLinearMap.dualMap)

/-- B1.1: a faithful representation of a reductive group in characteristic zero admits finitely
many mixed tensors whose simultaneous pointwise stabilizer is exactly the represented group,
over every commutative coefficient algebra ([Deligne], §3 Proposition 3.1(a–c), pp.22–23).
The tensor family is chosen over the ground field, before coefficient extension. -/
theorem finiteTensorStabilizer [CharZero k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hH : TauCeti.reductiveCommHopfAlgProperty k H)
    [FiniteDimensional k V] [TauCeti.Comodule k H V]
    (hV : TauCeti.Comodule.IsFaithful (k := k) (H := H) (V := V)) :
    ∃ (n : ℕ) (t : Fin n → TensorAlgebra k (V × Module.Dual k V)),
      ∀ (A : Type u) [CommRing A] [Algebra k A]
        (g : (A ⊗[k] V) ≃ₗ[A] (A ⊗[k] V)),
        (∀ i, mixedTensorAction g (mixedTensorBaseChange A (t i)) =
          mixedTensorBaseChange A (t i)) ↔
        ∃ x : WithConv (H →ₐ[k] A), TauCeti.Comodule.pointsAction V x = g := by
  sorry

end TauCetiRoadmap.AutomorphicBundles
