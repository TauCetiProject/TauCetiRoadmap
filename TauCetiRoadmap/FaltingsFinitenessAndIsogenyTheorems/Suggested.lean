import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.AbelianVariety.Product
import TauCeti.AlgebraicGeometry.Cohomology.Module.Base
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.BaseChange
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Ring
import TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Galois
import TauCeti.AlgebraicGeometry.LineBundle.Basic

/-!
# Faltings finiteness and isogeny theorems: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These are suggested forms for headline theorems; discharging them finishes
neither a layer nor the roadmap. The definitions have real bodies and the theorems use `sorry`.

On Tau Ceti's abelian varieties, this file states finiteness of isogeny classes with good
reduction outside a finite set (R28.5.3), finiteness of direct factors over any field
(R28.5.12), and the unpolarized Shafarevich theorem in every dimension (R28.5.13).
Good reduction is expressed by a smooth proper commutative group scheme with geometrically
connected fibres over the localization of the ring of integers, with its generic fibre
identified with the given abelian variety as a group scheme.

It also states finiteness of curves of any fixed genus at least two with good reduction
outside a finite set (R28.5.15), on native schemes over the number field. Their genus is
the vector-space rank of the first cohomology of the structure sheaf; good reduction is
the existence of a smooth proper model with geometrically connected fibres.

For Weierstrass elliptic curves over number fields, it states semisimplicity, the integral
Tate Hom comparison, the isogeny criteria by rational Tate representations and by almost
all Frobenius traces, and finiteness of an isogeny class (R28.6.2–R28.6.5).
The rational representation is the scalar extension of Tau Ceti's integral Galois action.
At good places, Mathlib's local polynomial has degree-one coefficient `−a_v`, so comparing
these coefficients outside a finite set states the trace criterion.

The remaining headline signatures require interfaces absent at the pins:

* R28.1.11, R28.2.1, R28.2.9 and R28.3.4 need semiabelian models, their metrized Hodge
  lines and modular heights, and the local and global divisible-group towers with their
  invariant differentials. The fractional-ideal degree formula alone does not supply these.
* R28.4.5–R28.4.8 and R28.6.7 need the Tate representation and its functorial Hom action
  for the scheme-theoretic abelian-variety carrier; the pinned Tate representation is for
  Weierstrass curves. Polarized finiteness also needs polarizations of abelian varieties.
* R28.5.11 needs those polarizations, including their degrees and isomorphisms.
* R28.5.14 needs the Jacobian of a smooth projective curve with its canonical principal
  polarization, to state the rational Torelli theorem.

These results remain specified in the README without substitute declarations here.
-/

namespace TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems

open CategoryTheory AlgebraicGeometry NumberField IsDedekindDomain
open scoped TensorProduct WeierstrassCurve

/-- Good reduction of an abelian variety at a finite place: a smooth proper commutative
model with geometrically connected fibres over the local ring, and a group-scheme
isomorphism of its generic fibre with `A` (R28.5.3, R28.5.13). -/
noncomputable def hasGoodReductionAt {K : Type*} [Field K] [NumberField K]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety K) (v : HeightOneSpectrum (𝓞 K)) : Prop :=
  ∃ G : CommGrp (Over (Spec (.of (v.valuationSubringAtPrime K)))),
    Smooth G.X.hom ∧ IsProper G.X.hom ∧ GeometricallyConnected G.X.hom ∧
      Nonempty (((Over.pullback (Spec.map (CommRingCat.ofHom
        (algebraMap (v.valuationSubringAtPrime K) K)))).mapCommGrp.obj G) ≅
          CommGrp.mk A.toOver)

/-- Satz 5: finitely many isogeny classes of abelian varieties of fixed dimension over
`K` have good reduction outside `S` (R28.5.3, Faltings 1983, pp. 362–363). -/
theorem finite_isogenyClasses {K : Type*} [Field K] [NumberField K]
    (S : Finset (HeightOneSpectrum (𝓞 K))) (g : ℕ) :
    ∃ F : Finset (TauCeti.AlgebraicGeometry.AbelianVariety K),
      ∀ A : TauCeti.AlgebraicGeometry.AbelianVariety K,
        A.dim = g → (∀ v, v ∉ S → hasGoodReductionAt A v) →
          ∃ B ∈ F, ∃ f : A ⟶ B, TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny f := by
  sorry

/-- An abelian variety over any field has finitely many direct factors up to isomorphism
(R28.5.12, Milne I Theorem 15.3). -/
theorem finite_directFactors {k : Type*} [Field k]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety k) :
    ∃ S : Finset (TauCeti.AlgebraicGeometry.AbelianVariety k),
      ∀ B C : TauCeti.AlgebraicGeometry.AbelianVariety k,
        Nonempty (A ≅ B.prod C) → ∃ B' ∈ S, Nonempty (B ≅ B') := by
  sorry

/-- The unpolarized Shafarevich theorem: finitely many isomorphism classes of abelian
varieties of fixed dimension over `K` have good reduction outside `S`
(R28.5.13, Milne IV Theorem 1.4). -/
theorem shafarevich_unpolarized {K : Type*} [Field K] [NumberField K]
    (S : Finset (HeightOneSpectrum (𝓞 K))) (g : ℕ) :
    ∃ F : Finset (TauCeti.AlgebraicGeometry.AbelianVariety K),
      ∀ A : TauCeti.AlgebraicGeometry.AbelianVariety K,
        A.dim = g → (∀ v, v ∉ S → hasGoodReductionAt A v) →
          ∃ B ∈ F, Nonempty (A ≅ B) := by
  sorry

/-- Good reduction of a curve at a finite place, expressed by a smooth proper model
with geometrically connected fibres and an isomorphism of its generic fibre (R28.5.15). -/
noncomputable def curveHasGoodReductionAt {K : Type*} [Field K] [NumberField K]
    (C : Over (Spec (.of K))) (v : HeightOneSpectrum (𝓞 K)) : Prop :=
  ∃ X : Over (Spec (.of (v.valuationSubringAtPrime K))),
    Smooth X.hom ∧ IsProper X.hom ∧ GeometricallyConnected X.hom ∧
      Nonempty ((Over.pullback (Spec.map (CommRingCat.ofHom
        (algebraMap (v.valuationSubringAtPrime K) K)))).obj X ≅ C)

/-- Finitely many curves of fixed genus at least two over `K` have good reduction
outside `S` (R28.5.15, Faltings' Korollar 1 to Satz 6). Genus is the rank of `H¹(O_C)`;
a smooth proper curve over a field is projective. No rational point is assumed. -/
theorem finite_curves_goodReduction {K : Type*} [Field K] [NumberField K]
    (S : Finset (HeightOneSpectrum (𝓞 K))) (g : ℕ) (hg : 2 ≤ g) :
    ∃ F : Finset (Over (Spec (.of K))), ∀ C : Over (Spec (.of K)),
      letI : C.left.Over (Spec (.of K)) := ⟨C.hom⟩
      Smooth C.hom → IsProper C.hom → GeometricallyConnected C.hom →
      topologicalKrullDim C.left = 1 →
      Module.rank K (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
        (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial C.left).obj 1) = g →
      (∀ v, v ∉ S → curveHasGoodReductionAt C v) →
        ∃ D ∈ F, Nonempty (C ≅ D) := by
  sorry

open scoped Classical in
/-- The rational Tate representation of an elliptic curve, obtained from its integral
Galois action by extension of scalars (R28.6.2). -/
noncomputable def ellipticRationalRepresentation {K : Type*} [Field K]
    (W : WeierstrassCurve K) [W.IsElliptic] (l : ℕ) [Fact l.Prime] :
    Representation ℚ_[l] (Field.absoluteGaloisGroup K)
      (ℚ_[l] ⊗[ℤ_[l]] TauCeti.TateModule l (W⁄(AlgebraicClosure K)).toAffine.Point) :=
  (Module.End.baseChangeHom ℤ_[l] ℚ_[l] _).toMonoidHom.comp
    (W.tateModuleGaloisRepresentation (K := AlgebraicClosure K) l)

/-- The rational Tate module of an elliptic curve over a number field is semisimple
(R28.6.2, Faltings' Satz 3 in dimension one). -/
theorem elliptic_semisimple {K : Type*} [Field K] [NumberField K]
    (W : WeierstrassCurve K) [W.IsElliptic] (l : ℕ) [Fact l.Prime] :
    IsSemisimpleModule (MonoidAlgebra ℚ_[l] (Field.absoluteGaloisGroup K))
      (ellipticRationalRepresentation W l).asModule := by
  sorry

open scoped Classical in
/-- The canonical integral Tate Hom comparison for elliptic curves over a number field
is an isomorphism, characterized on pure tensors by the induced point map (R28.6.3). -/
theorem elliptic_tate_hom_iso {K : Type*} [Field K] [NumberField K]
    (W W' : WeierstrassCurve K) [W.IsElliptic] [W'.IsElliptic]
    (l : ℕ) [Fact l.Prime] :
    let ρ := W.tateModuleGaloisRepresentation (K := AlgebraicClosure K) l
    let ρ' := W'.tateModuleGaloisRepresentation (K := AlgebraicClosure K) l
    ∃ e : (ℤ_[l] ⊗[ℤ] TauCeti.Isogeny.Hom W.toAffine W'.toAffine) ≃ₗ[ℤ_[l]]
        Representation.IntertwiningMap ρ ρ',
      ∀ (f : TauCeti.Isogeny.Hom W.toAffine W'.toAffine)
        (x : TauCeti.TateModule l (W⁄(AlgebraicClosure K)).toAffine.Point),
        e (1 ⊗ₜ[ℤ] f) x = TauCeti.TateModule.mapLinearMap
          (f.map (algebraMap K (AlgebraicClosure K))).pointMapHom x := by
  sorry

/-- Two elliptic curves over a number field are isogenous exactly when their rational
Tate representations are isomorphic (R28.6.4, Faltings' Korollar 2). -/
theorem elliptic_isogenous_iff_rationalTateModule {K : Type*} [Field K] [NumberField K]
    (W W' : WeierstrassCurve K) [W.IsElliptic] [W'.IsElliptic]
    (l : ℕ) [Fact l.Prime] :
    (∃ f : TauCeti.Isogeny.Hom W.toAffine W'.toAffine, f ≠ 0) ↔
      Nonempty ((ellipticRationalRepresentation W l).asModule ≃ₗ[
        MonoidAlgebra ℚ_[l] (Field.absoluteGaloisGroup K)]
          (ellipticRationalRepresentation W' l).asModule) := by
  sorry

/-- The Frobenius-trace isogeny criterion (R28.6.4): the degree-one coefficients of the
local polynomials agree at almost all finite places. At good places these are `−a_v`. -/
theorem elliptic_isogenous_iff_ap {K : Type*} [Field K] [NumberField K]
    (W W' : WeierstrassCurve K) [W.IsElliptic] [W'.IsElliptic] :
    (∃ f : TauCeti.Isogeny.Hom W.toAffine W'.toAffine, f ≠ 0) ↔
      ∀ᶠ v : HeightOneSpectrum (𝓞 K) in Filter.cofinite,
        ((W.baseChange (v.adicCompletion K)).localPolynomial
          (v.adicCompletionIntegers K)).coeff 1 =
        ((W'.baseChange (v.adicCompletion K)).localPolynomial
          (v.adicCompletionIntegers K)).coeff 1 := by
  sorry

/-- The isogeny class of an elliptic curve over a number field contains only finitely
many curves up to `K`-isomorphism (R28.6.5, Faltings' Satz 6 for `g = d = 1`). -/
theorem finite_ellipticIsogenyClass {K : Type*} [Field K] [NumberField K]
    (W : WeierstrassCurve K) [W.IsElliptic] :
    ∃ S : Finset (WeierstrassCurve K), ∀ W' : WeierstrassCurve K, W'.IsElliptic →
      (∃ f : TauCeti.Isogeny.Hom W.toAffine W'.toAffine, f ≠ 0) →
      ∃ W'' ∈ S, ∃ C : WeierstrassCurve.VariableChange K, C • W' = W'' := by
  sorry

end TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems
