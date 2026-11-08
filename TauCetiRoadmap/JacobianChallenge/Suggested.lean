module

public import Mathlib
public import TauCeti.AlgebraicGeometry.AbelianVariety.Albanese
public import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
public import TauCeti.AlgebraicGeometry.Cohomology.Genus
public import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
public import TauCeti.AlgebraicGeometry.EffectiveCartierDivisor.Degree.Basic
public import TauCeti.AlgebraicGeometry.Modules.Differentials.Basic
public import TauCeti.AlgebraicGeometry.Morphisms.Smooth.RelativeDimension
public import TauCeti.AlgebraicGeometry.PicardFunctor.Abel.Fppf
public import TauCeti.AlgebraicGeometry.PicardFunctor.Fppf
public import TauCeti.AlgebraicGeometry.PicardFunctor.PicZero.Fppf

/-!
# The Jacobian challenge: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need, all with real bodies on Mathlib's representability API:
the Picard scheme of a morphism (`HasPicardScheme`, `picardScheme`, `picardSchemeIso`) and the
Jacobian of a smooth proper geometrically connected curve over a field (`picZeroSets`,
`jacobianScheme`, `jacobianSchemeRepresentableBy`, its group law, `JacobianVariety`,
`abelJacobi` and its base change `abelJacobiBaseChange`). The Jacobian is the representing object of the degree-zero Picard fppf sheaf,
so it is defined without a rational point; the point enters only through the Abel–Jacobi
morphism. Multiplication statements carry the nonzero-integer and positive-dimension
hypotheses.

Headline theorems stated here: finite-dimensionality of coherent cohomology on a proper
scheme over a field; Serre duality on a smooth proper curve through a trace on
`H¹(X, Ω_{X/k})`; the Hilbert scheme of points of a curve; the Picard scheme of the curve;
representability of the degree-zero Picard sheaf, properness and geometric integrality of the
representing scheme; `dim Jac X = g`; the Albanese property of the Abel–Jacobi morphism, its
being a closed immersion in genus at least one and an isomorphism in genus one; the Albanese
property of its base change along a field extension; `[n]` an isogeny and étale exactly when
`n` is invertible in `k`.

Not statable at the pins: the Serre-duality trace as a named map (it needs the repartition
description of `H¹(X, Ω_{X/k})` and residues at closed points of arbitrary residue field; the
duality statement quantifies the trace existentially instead); the degree-`d` pieces of the
Picard scheme (no degree-`d` subsheaf); the representation of the degree-zero Picard sheaf of
`X_K` by the base change of `Jac X` without a rational point (Tau Ceti has a base-change
isomorphism for the presheaf `relativePicardDegreeZeroFunctor` only, none for
`relativePicardDegreeZeroFppfSheaf`); the dual abelian variety, polarizations, theta and the
Picard-pullback comparison (no dual carrier); the canonical identification
`T₀ Jac X ≅ H¹(X, 𝒪_X)` (the deformation map from `H¹(X, 𝒪_X)` into Tau Ceti's
`AbelianVariety.TangentSpace` is a construction not available at the pin; its dimension
consequence is `dim_jacobianVariety`).

Mathlib's `WeierstrassCurve.Jacobian` means Jacobian *coordinates*, not the Jacobian
*variety*; the name here is `JacobianVariety`.
-/

@[expose] public section

namespace TauCetiRoadmap.JacobianChallenge

open CategoryTheory MonoidalCategory AlgebraicGeometry Opposite

universe u

/-! ## Layer B: coherent cohomology over `k`, Serre duality and the genus -/

/-- **Finiteness of coherent cohomology.** On a proper scheme over a field, every cohomology
group of a finitely presented sheaf of modules is finite-dimensional (Stacks 02O6). -/
theorem finiteDimensional_cohomology {k : Type u} [Field k] (X : Scheme.{u})
    [X.Over (Spec (.of k))] [IsProper (X ↘ Spec (.of k))]
    (F : X.Modules) [F.IsFinitePresentation] (i : ℕ) :
    FiniteDimensional k (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology F i) := by
  sorry

/-- **Serre duality through a trace.** On a proper curve smooth of relative dimension one over
`k` there is a `k`-linear trace `t : H¹(X, Ω_{X/k}) → k` such that, for every quasi-coherent
`F`, each linear form on `H¹(X, F)` is `t ∘ H¹(φ)` for exactly one `φ : F ⟶ Ω_{X/k}`. The
README (B.2) normalizes `t` as the residue sum; for `F = L` invertible the statement says that the
cup pairing `H⁰(X, Ω_{X/k} ⊗ L⁻¹) × H¹(X, L) → k` is perfect, and for `F = 𝒪_X` that
`dim_k H⁰(X, Ω_{X/k}) = dim_k H¹(X, 𝒪_X)` (Tate 1968, §4, Corollary to Theorem 5). -/
@[stacks 0BS2 "(5) and (6); the trace is quantified, its residue normalisation is README B.2"]
theorem serreDuality_exists_trace {k : Type u} [Field k] (X : Scheme.{u})
    [X.Over (Spec (.of k))] [SmoothOfRelativeDimension 1 (X ↘ Spec (.of k))]
    [IsProper (X ↘ Spec (.of k))] :
    ∃ t : TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology (X.relativeDifferentials k) 1 →ₗ[k] k,
      ∀ (F : X.Modules) [F.IsQuasicoherent],
        Function.Bijective (fun φ : F ⟶ X.relativeDifferentials k =>
          t ∘ₗ Scheme.Modules.cohomologyMapBaseLinear k X φ 1) := by
  sorry

/-! ## Layer C: relative coherent cohomology and the Hilbert scheme of points -/

/-- **The Hilbert scheme of points of a curve.** For a proper curve smooth of relative
dimension one over a field and every `d`, relative effective Cartier divisors of degree `d`
form a representable functor on all test schemes; the representing scheme is the symmetric
power `Symᵈ X`. -/
@[stacks 0B9A "Special case: a proper curve smooth of relative dimension one over a field."]
theorem isRepresentable_relativeEffectiveCartierDegreeSubfunctor {k : Type u} [Field k]
    (X : Over (Spec (.of k))) [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] (d : ℕ) :
    Functor.IsRepresentable
      (TauCeti.AlgebraicGeometry.relativeEffectiveCartierDegreeSubfunctor X.hom d).toFunctor := by
  sorry

/-! ## Layer D: the relative Picard functor and the Jacobian scheme -/

/-- A morphism `f : X ⟶ S` **has a Picard scheme** when the presheaf of sets underlying Tau
Ceti's group-valued relative Picard fppf sheaf is representable. The sheaf takes values in
`Type (u + 1)` while morphisms of `Over S` lie in `Type u`; `Functor.RepresentableBy` allows
this, so no universe is shrunk. -/
abbrev HasPicardScheme {S X : Scheme.{u}} (f : X ⟶ S) : Prop :=
  ((TauCeti.AlgebraicGeometry.relativePicardFppfSheaf f).obj ⋙
    forget AddCommGrpCat).IsRepresentable

/-- The **Picard scheme** of `f`: the representing object of the relative Picard fppf sheaf.
Its group law is tensor product of line-bundle classes, transported by Yoneda. -/
noncomputable def picardScheme {S X : Scheme.{u}} (f : X ⟶ S) [HasPicardScheme f] : Over S :=
  ((TauCeti.AlgebraicGeometry.relativePicardFppfSheaf f).obj ⋙ forget AddCommGrpCat).reprX

/-- The **representing isomorphism** between the lifted functor of points of `picardScheme f`
and the relative Picard fppf sheaf. -/
noncomputable def picardSchemeIso {S X : Scheme.{u}} (f : X ⟶ S) [HasPicardScheme f] :
    uliftYoneda.{u + 1}.obj (picardScheme f) ≅
      (TauCeti.AlgebraicGeometry.relativePicardFppfSheaf f).obj ⋙ forget AddCommGrpCat :=
  Functor.uliftYonedaReprXIso _

/-- A proper curve smooth of relative dimension one with geometrically connected fibres over a
field has a Picard scheme. No rational point is assumed. -/
@[stacks 0B9Z "More general: over any field, with no rational point."]
theorem hasPicardScheme_of_curve {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    HasPicardScheme X.hom := by
  sorry

/-- The degree-zero relative Picard fppf sheaf of a smooth proper geometrically connected curve
over `k`, as a presheaf of sets on `Over (Spec k)`: the functor the Jacobian represents. -/
noncomputable abbrev picZeroSets {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    (Over (Spec (.of k)))ᵒᵖ ⥤ Type (u + 1) :=
  (TauCeti.AlgebraicGeometry.relativePicardDegreeZeroFppfSheaf X.hom).obj ⋙ forget AddCommGrpCat

/-- **`Pic⁰` is representable over any field.** The degree-zero Picard fppf sheaf of a smooth
proper geometrically connected curve is representable on all test schemes over `k`; no rational
point is assumed (the README builds the representing scheme by Galois descent). -/
@[stacks 0BA0 "More general: the degree-zero piece over any field."]
theorem isRepresentable_picZeroSets {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    (picZeroSets X).IsRepresentable := by
  sorry

/-- Representability of the degree-zero Picard sheaf, as an instance, so that its representing
object can be named. -/
instance instIsRepresentablePicZeroSets {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    (picZeroSets X).IsRepresentable :=
  isRepresentable_picZeroSets X

/-- The **Jacobian scheme** of the curve: the representing object of the degree-zero Picard
fppf sheaf (Mathlib's `Functor.reprX`). -/
noncomputable def jacobianScheme {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    Over (Spec (.of k)) :=
  (picZeroSets X).reprX

/-- The representation of the degree-zero Picard fppf sheaf by the Jacobian scheme: on every
test scheme `T` over `k`, morphisms `T ⟶ Jac X` are the degree-zero Picard classes of `X_T`. -/
noncomputable def jacobianSchemeRepresentableBy {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    (picZeroSets X).RepresentableBy (jacobianScheme X) :=
  (picZeroSets X).representableBy

/-- The group law of the Jacobian scheme: tensor product of degree-zero classes, transported
along the representation (Mathlib's `CommGrpObj.ofRepresentableBy`). -/
noncomputable instance jacobianSchemeCommGrpObj {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    CommGrpObj (jacobianScheme X) :=
  CommGrpObj.ofRepresentableBy (jacobianScheme X)
    ((TauCeti.AlgebraicGeometry.relativePicardDegreeZeroFppfSheaf X.hom).obj ⋙
      AddCommGrpCat.toCommGrp) (jacobianSchemeRepresentableBy X)

/-- **The Jacobian scheme is proper** over `k` (Stacks 0BA0 over a separably closed field;
descended to any field in the README). -/
theorem isProper_jacobianScheme {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    IsProper (jacobianScheme X).hom := by
  sorry

/-- Properness of the Jacobian scheme, as an instance. -/
instance instIsProperJacobianScheme {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    IsProper (jacobianScheme X).hom :=
  isProper_jacobianScheme X

/-- **The Jacobian scheme is geometrically integral**: smooth and geometrically connected
(Stacks 0BA0; Kleiman, Proposition 5.19). -/
theorem geometricallyIntegral_jacobianScheme {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    GeometricallyIntegral (jacobianScheme X).hom := by
  sorry

/-- Geometric integrality of the Jacobian scheme, as an instance. -/
instance instGeometricallyIntegralJacobianScheme {k : Type u} [Field k]
    (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    GeometricallyIntegral (jacobianScheme X).hom :=
  geometricallyIntegral_jacobianScheme X

/-- The **Jacobian** of a smooth proper geometrically connected curve over `k`: the Jacobian
scheme with its tensor-product group law, on Tau Ceti's abelian-variety carrier. It is defined
without a rational point. -/
noncomputable def JacobianVariety {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom] :
    TauCeti.AlgebraicGeometry.AbelianVariety k where
  toOver := jacobianScheme X
  grpObj := inferInstance
  isProper := inferInstance
  geometricallyIntegral := inferInstance

/-- **The dimension of the Jacobian is the genus**, through `T₀ Pic⁰ ≅ H¹(X, 𝒪_X)` and the
dimension of Tau Ceti's `AbelianVariety.TangentSpace` (Kleiman, Theorem 5.11; Milne, *Abelian
Varieties*, III Proposition 2.1). -/
theorem dim_jacobianVariety {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom]
    [FiniteDimensional k (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X.left).obj 1)] :
    (JacobianVariety X).dim = X.left.genus k := by
  sorry

/-! ## Layer E: abelian varieties -/

/-- Multiplication by a nonzero integer on an abelian variety is an isogeny. -/
theorem multiplication_isogeny {k : Type u} [Field k]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety k) (n : ℤ) (hn : n ≠ 0) :
    TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny
      (TauCeti.AlgebraicGeometry.AbelianVariety.mulBy A n) := by
  sorry

/-- On a positive-dimensional abelian variety, multiplication by an integer is étale
exactly when that integer is nonzero in the ground field. -/
theorem multiplication_etale_iff {k : Type u} [Field k]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety k) (hdim : 0 < A.dim) (n : ℤ) :
    Etale (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom
      (TauCeti.AlgebraicGeometry.AbelianVariety.mulBy A n)) ↔ (n : k) ≠ 0 := by
  sorry

/-! ## Layer F: Abel–Jacobi and the universal property -/

/-- The **Abel–Jacobi morphism** `x ↦ 𝒪(x − x₀)` into the Jacobian, for a `k`-rational point
`x₀`: the morphism corresponding, under `jacobianSchemeRepresentableBy`, to the class that Tau
Ceti's `abelJacobiMapToPicZeroFppf` assigns to the identity of `X`. The Jacobian itself does not
depend on `x₀`. -/
noncomputable def abelJacobi {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom]
    (x₀ : 𝟙_ (Over (Spec (.of k))) ⟶ X) : X ⟶ (JacobianVariety X).toOver :=
  (jacobianSchemeRepresentableBy X).homEquiv.symm
    ((TauCeti.AlgebraicGeometry.abelJacobiMapToPicZeroFppf X.hom (Over.w x₀)).app (op X)
      (ULift.up (𝟙 X)))

/-- The Abel–Jacobi morphism has the Albanese property: every pointed curve morphism to an
abelian variety factors through a unique homomorphism. Normalized Picard pullback with
`a^* ∘ λ_Θ = [−1]` and biduality provide the factorization, including for the zero Jacobian in
genus zero (Milne, *Abelian Varieties*, III Proposition 6.1). -/
theorem isAlbanese_abelJacobi {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom]
    (x₀ : 𝟙_ (Over (Spec (.of k))) ⟶ X) :
    TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese x₀ (abelJacobi X x₀) := by
  sorry

/-- In genus at least one the Abel–Jacobi morphism is a closed immersion (Milne, *Abelian
Varieties*, III Proposition 2.3). -/
theorem isClosedImmersion_abelJacobi {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom]
    [FiniteDimensional k (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X.left).obj 1)]
    (hg : 1 ≤ X.left.genus k) (x₀ : 𝟙_ (Over (Spec (.of k))) ⟶ X) :
    IsClosedImmersion (abelJacobi X x₀).left := by
  sorry

/-- In genus one the Abel–Jacobi morphism is an isomorphism of the pointed curve with its
Jacobian: `Jac (E, O) ≅ E` (Milne, *Abelian Varieties*, III Propositions 2.1 and 2.3). -/
theorem isIso_abelJacobi_of_genus_eq_one {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom]
    [FiniteDimensional k (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X.left).obj 1)]
    (hg : X.left.genus k = 1) (x₀ : 𝟙_ (Over (Spec (.of k))) ⟶ X) :
    IsIso (abelJacobi X x₀) := by
  sorry

/-- The **base change of the Abel–Jacobi morphism** along a field extension `K/k`: the pullback
of `abelJacobi X x₀` to the curve `X_K`, as a morphism into the underlying scheme of the
base-changed Jacobian `(Jac X)_K` (Tau Ceti's `AbelianVariety.baseChange`, whose underlying
object is the pullback of that of `Jac X` by `AbelianVariety.baseChange_toOver`). -/
noncomputable def abelJacobiBaseChange {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom]
    (K : Type u) [Field K] [Algebra k K] (x₀ : 𝟙_ (Over (Spec (.of k))) ⟶ X) :
    (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap k K)))).obj X ⟶
      ((JacobianVariety X).baseChange K).toOver :=
  (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap k K)))).map (abelJacobi X x₀) ≫
    eqToHom (TauCeti.AlgebraicGeometry.AbelianVariety.baseChange_toOver _ K).symm

/-- **Base change of the Abel–Jacobi morphism has the Albanese property.** For a field extension
`K/k` and a `k`-rational point `x₀`, the base change `(Jac X)_K`, with
`abelJacobiBaseChange X K x₀`, has the Albanese property for the curve `X_K` pointed at the base
change of `x₀`. With `isAlbanese_abelJacobi` for `X_K` this determines the isomorphism
`(Jac X)_K ≅ Jac X_K` of abelian varieties, with its group law, as the unique one carrying one
Abel–Jacobi morphism to the other. -/
theorem isAlbanese_baseChange_abelJacobi {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom]
    (K : Type u) [Field K] [Algebra k K] (x₀ : 𝟙_ (Over (Spec (.of k))) ⟶ X) :
    TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese
      (Functor.LaxMonoidal.ε (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap k K)))) ≫
        (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap k K)))).map x₀)
      (abelJacobiBaseChange X K x₀) := by
  sorry

end TauCetiRoadmap.JacobianChallenge
