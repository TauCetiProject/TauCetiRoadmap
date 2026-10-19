import Mathlib
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.FiniteType.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.BaseChange
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Determinant
import TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic
import TauCeti.Algebra.AlgebraicGroup.MultiplicativeGroup.Basic
import TauCeti.Algebra.AlgebraicGroup.AdditiveGroup.Basic
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.SimplyConnected.Basic
import TauCeti.Algebra.AlgebraicGroup.Connected.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.GeometricallyReduced.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.Tangent.Cotangent
import TauCeti.Algebra.Quaternion.NormForm
import TauCeti.NumberTheory.NumberField.Global.Adeles.LocallyCompact
import TauCeti.NumberTheory.NumberField.Global.Ideles.Norm.Basic
import TauCeti.RingTheory.DedekindDomain.FiniteAdeleRing.ClassGroup

/-!
# Adelic algebraic groups and arithmetic quotients: representative target signatures

The mathematical roadmap is `README.md`. This file records the definitions and theorem signatures
that can already be stated against the pinned Mathlib and Tau Ceti. It is not an exhaustive list
of the targets of any layer.

Local analytic charts, cotangent comparison and additive Haar change of variables are the
RG2.0 supplier contract in `README.md`; RG2.4 supplies the local adjoint-modulus theorem and
algebraic parabolic determinant reduction. The adelic modulus uses these suppliers before the
AA.2.4 gauge measures. These README-only contracts have no suggested declarations here;
SR supplies coefficient-valued moduli and square roots for normalized induction.

The finite-group character inputs of AA.2.4 are specified in `README.md`. Its ramified local
Artin-factor induction identity, one-dimensional Artin–Hecke comparison and analytic assembly are
README-only targets.

Design choices.
* An affine algebraic group over a number field `F` is a commutative Hopf `F`-algebra `H`; its
  points with values in an `F`-algebra `R` form the convolution group `WithConv (H →ₐ[F] R)`.
* Points with values in a topological ring carry the point topology of ReductiveGroupsPartII,
  layer RG2.0: the coarsest topology making every evaluation continuous.
* Measures whose construction is itself a target (restricted products of Haar measures) are stated
  in existence-and-uniqueness form; measures that are specialisations of Mathlib's Haar measure
  are definitions.
-/

namespace TauCetiRoadmap.AdelicAlgebraicGroups

noncomputable section

open scoped RestrictedProduct Topology ENNReal NNReal TensorProduct NumberField Matrix Classical
open MeasureTheory Filter Set

/-! ## Carrier conventions -/

/-- `G(𝔸_F)` for `G = Spec H`: the convolution group of `F`-algebra maps `H → 𝔸_F`. -/
abbrev AdelicPoints (F : Type) [Field F] [NumberField F]
    (H : Type) [CommRing H] [HopfAlgebra F H] :=
  WithConv (H →ₐ[F] NumberField.AdeleRing (𝓞 F) F)

namespace AdelicPoints

open IsDedekindDomain

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `G(𝔸_{F,f})`. -/
abbrev FiniteAdelicPoints := WithConv (H →ₐ[F] FiniteAdeleRing (𝓞 F) F)

/-- `G(F_∞) = G(F ⊗_ℚ ℝ)`. -/
abbrev InfinitePoints := WithConv (H →ₐ[F] NumberField.InfiniteAdeleRing F)

/-- `G(F_v)` at a finite place `v`. -/
abbrev LocalPoints (v : HeightOneSpectrum (𝓞 F)) := WithConv (H →ₐ[F] v.adicCompletion F)

instance instTopologicalSpace : TopologicalSpace (AdelicPoints F H) :=
  ⨅ h : H, TopologicalSpace.induced (fun x => x.ofConv h) inferInstance

instance instTopologicalSpaceFinite : TopologicalSpace (FiniteAdelicPoints F H) :=
  ⨅ h : H, TopologicalSpace.induced (fun x => x.ofConv h) inferInstance

instance instTopologicalSpaceInfinite : TopologicalSpace (InfinitePoints F H) :=
  ⨅ h : H, TopologicalSpace.induced (fun x => x.ofConv h) inferInstance

instance instTopologicalSpaceLocal (v : HeightOneSpectrum (𝓞 F)) :
    TopologicalSpace (LocalPoints F H v) :=
  ⨅ h : H, TopologicalSpace.induced (fun x => x.ofConv h) inferInstance

instance instIsTopologicalGroup : IsTopologicalGroup (AdelicPoints F H) := by
  sorry

instance instIsTopologicalGroupFinite : IsTopologicalGroup (FiniteAdelicPoints F H) := by
  sorry

instance instIsTopologicalGroupInfinite : IsTopologicalGroup (InfinitePoints F H) := by
  sorry

instance instIsTopologicalGroupLocal (v : HeightOneSpectrum (𝓞 F)) :
    IsTopologicalGroup (LocalPoints F H v) := by
  sorry

instance instMeasurableSpace : MeasurableSpace (AdelicPoints F H) := borel _

instance instBorelSpace : BorelSpace (AdelicPoints F H) := ⟨rfl⟩

/-- `G(𝔸_F)` is Hausdorff ([Conrad], Prop. 2.1, p. 2). -/
instance instT2Space : T2Space (AdelicPoints F H) := by
  sorry

/-- For `H` of finite type, `G(𝔸_F)` and `G(𝔸_{F,f})` are locally compact and second countable
([Borel], §1.2, p. 7). -/
instance instLocallyCompactSpace [Algebra.FiniteType F H] :
    LocallyCompactSpace (AdelicPoints F H) := by
  sorry

instance instSecondCountableTopology [Algebra.FiniteType F H] :
    SecondCountableTopology (AdelicPoints F H) := by
  sorry

instance instLocallyCompactSpaceFinite [Algebra.FiniteType F H] :
    LocallyCompactSpace (FiniteAdelicPoints F H) := by
  sorry

/-- The diagonal `G(F) → G(𝔸_F)`. -/
def diagonal : WithConv (H →ₐ[F] F) →* AdelicPoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _)

/-- The diagonal `G(F) → G(𝔸_{F,f})`. -/
def finiteDiagonal : WithConv (H →ₐ[F] F) →* FiniteAdelicPoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _)

/-- The diagonal `G(F) → G(F_∞)`. -/
def infiniteDiagonal : WithConv (H →ₐ[F] F) →* InfinitePoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _)

/-- The finite component `G(𝔸_F) → G(𝔸_{F,f})`. -/
def finiteProjection : AdelicPoints F H →* FiniteAdelicPoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (AlgHom.snd F _ _)

/-- The archimedean component `G(𝔸_F) → G(F_∞)`. -/
def infiniteProjection : AdelicPoints F H →* InfinitePoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (AlgHom.fst F _ _)

/-- `x ↦ (1, x)`, `G(𝔸_{F,f}) → G(𝔸_F)`: an embedding of point groups, not a ring inclusion with
archimedean coordinate zero. -/
def finiteEmbed : FiniteAdelicPoints F H →* AdelicPoints F H where
  toFun x := WithConv.toConv {
    toFun h := ((1 : InfinitePoints F H).ofConv h, x.ofConv h)
    map_zero' := by sorry
    map_one' := by sorry
    map_add' := by sorry
    map_mul' := by sorry
    commutes' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

/-- `H` as an object of Tau Ceti's category of finite-type Hopf algebras. -/
abbrev finiteTypeObj [Algebra.FiniteType F H] : TauCeti.FiniteTypeCommHopfAlgCat F :=
  ⟨CommHopfAlgCat.of F H, (inferInstance : Algebra.FiniteType F H)⟩

end AdelicPoints

/-- `X*_F(G)`: the group-like elements of `H`, the homomorphisms `G → G_m` defined over `F`. -/
abbrev RationalCharacter (F : Type) [Field F] (H : Type) [CommRing H] [HopfAlgebra F H] :=
  GroupLike F H

namespace RationalCharacter

variable {F : Type} [Field F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- The value `χ(x) = x(χ) ∈ R^×` of a rational character on an `R`-point. -/
def apply {R : Type} [CommRing R] [Algebra F R] (χ : RationalCharacter F H)
    (x : WithConv (H →ₐ[F] R)) : Rˣ :=
  Units.map x.ofConv.toMonoidHom (GroupLike.toUnits F χ)

end RationalCharacter

/-- `a_G = Hom(X*_F(G), ℝ)`. -/
abbrev RealCharacterSpace (F : Type) [Field F] (H : Type) [CommRing H] [HopfAlgebra F H] :=
  Additive (RationalCharacter F H) →+ ℝ

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- The Harish-Chandra map `H_G : G(𝔸_F) → a_G`, `⟨H_G(x), χ⟩ = log ‖χ(x)‖` with Tau Ceti's idele
norm ([Arthur], §3, p. 16). -/
def logHeight : AdelicPoints F H →* Multiplicative (RealCharacterSpace F H) where
  toFun x := Multiplicative.ofAdd
    { toFun := fun χ => Real.log ((TauCeti.GlobalNumberFields.ideleNorm
        (RationalCharacter.apply (Additive.toMul χ) x) : ℝ≥0) : ℝ)
      map_zero' := by sorry
      map_add' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

/-- `G(𝔸_F)^1 = ker H_G`. -/
def normOne : Subgroup (AdelicPoints F H) := (logHeight F H).ker

end AdelicPoints

namespace Reduction

open AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- A rational cocharacter `G_m → G` (coordinate map `H → F[T, T⁻¹]`) is central when its points
commute with all points of `G`, on every coefficient algebra. -/
def IsCentralCocharacter (c : H →ₐc[F] LaurentPolynomial F) : Prop :=
  ∀ (R : Type) [CommRing R] [Algebra F R] (t : WithConv (LaurentPolynomial F →ₐ[F] R))
    (g : WithConv (H →ₐ[F] R)),
    Commute (WithConv.toConv (t.ofConv.comp (c : H →ₐ[F] LaurentPolynomial F))) g

end Reduction

namespace Approximation

open AdelicPoints IsDedekindDomain

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- Adelic points whose finite components outside `S_f` are `1`: the factor `G(F_S)` of
`G(𝔸_F)` for `S = ∞ ∪ S_f`. -/
def supportedAt (Sf : Finset (HeightOneSpectrum (𝓞 F))) : Subgroup (AdelicPoints F H) where
  carrier := {x | ∀ v ∉ Sf, ∀ h : H,
    (finiteProjection F H x).ofConv h v = (1 : FiniteAdelicPoints F H).ofConv h v}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- Strong approximation for `S = ∞ ∪ S_f`: `G(F) G(F_S)` is dense in `G(𝔸_F)`, equivalently `G(F)`
is dense in the adelic points away from `S` ([Rapinchuk], §2.1, Definition, p. 7). -/
def HasStrongApproximation (Sf : Finset (HeightOneSpectrum (𝓞 F))) : Prop :=
  Dense {x : AdelicPoints F H | ∃ g, ∃ y ∈ supportedAt F H Sf, x = diagonal F H g * y}

end Approximation

/-! ## Headline theorems -/

namespace Reduction

open AdelicPoints

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- Finiteness of class numbers: `G(F)\G(𝔸_{F,f})/U` is finite for every compact open `U`
([Borel], Theorem 5.1, p. 19). -/
theorem finite_classes [Algebra.FiniteType F H] (U : Subgroup (FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    Finite (DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U) := by
  sorry

/-- `G(F)\G(𝔸_F)^1` has finite volume for connected `G`: a fundamental domain of the rational
points in `G(𝔸_F)^1` has finite Haar measure ([Platonov–Rapinchuk–Rapinchuk], Theorem 5.24,
pp. 318–321). -/
theorem exists_fundamentalDomain_normOne_lt_top [Algebra.FiniteType F H]
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F (CommHopfAlgCat.of F H))
    (μ : Measure (normOne F H)) [μ.IsHaarMeasure] :
    ∃ D : Set (normOne F H),
      IsFundamentalDomain ((diagonal F H).range.subgroupOf (normOne F H)) D μ ∧ μ D < ∞ := by
  sorry

/-- For connected `G`, `G(F)\G(𝔸_F)` has finite volume exactly when `X*_F(G) = 0`
([Platonov–Rapinchuk–Rapinchuk], Theorem 5.22(2), pp. 314–316). -/
theorem finite_volume_iff [Algebra.FiniteType F H]
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F (CommHopfAlgCat.of F H))
    (μ : Measure (AdelicPoints F H)) [μ.IsHaarMeasure] :
    (∃ D : Set (AdelicPoints F H), IsFundamentalDomain (diagonal F H).range D μ ∧ μ D < ∞) ↔
      Subsingleton (RationalCharacter F H) := by
  sorry

/-- Compactness criterion: for connected reductive `G`, `G(F)\G(𝔸_F)^1` is compact, that is, a
compact set meets every `G(F)`-orbit of `G(𝔸_F)^1`, exactly when every rational cocharacter is
central (the derived group is anisotropic) ([Borel], Theorem 5.8, p. 22; [Arthur], §4, p. 21). -/
theorem exists_compact_normOne_iff [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    (∃ C : Set (AdelicPoints F H), IsCompact C ∧
        ∀ x ∈ normOne F H, ∃ γ, diagonal F H γ * x ∈ C) ↔
      ∀ c : H →ₐc[F] LaurentPolynomial F, IsCentralCocharacter F H c := by
  sorry

end Reduction

namespace Approximation

open AdelicPoints IsDedekindDomain

/-- A simply connected semisimple group has strong approximation away from a finite set
containing infinity when every nontrivial semisimple quotient has noncompact points over that
set. This is the simple-factor condition expressed through injective coordinate morphisms
([Arthur], Theorem 2.1(a), p. 12; [PR94], Theorem 7.12, p. 427). -/
theorem hasStrongApproximation_of_simplyConnected
    (F : Type) [Field F] [NumberField F] (G : TauCeti.SemisimpleCommHopfAlgCat F)
    (hsc : TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty F G)
    (Sf : Finset (HeightOneSpectrum (𝓞 F)))
    (hS : ∀ (Q : TauCeti.SemisimpleCommHopfAlgCat F) (f : Q.obj →ₐc[F] G.obj),
      Function.Injective f → ¬ Function.Surjective (algebraMap F Q.obj) →
        ¬ IsCompact (Set.univ : Set (InfinitePoints F Q.obj × ∀ v : Sf, LocalPoints F Q.obj v))) :
    HasStrongApproximation F (G.obj : Type) Sf := by
  sorry

end Approximation

/-! ## Layer AA.0: restricted products of Haar measures -/

namespace RestrictedHaar

open _root_.RestrictedProduct

variable {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  {B : ∀ i, Subgroup (G i)}

/-- The Borel σ-algebra on a restricted product. -/
instance instMeasurableSpace : MeasurableSpace (Πʳ i, [G i, B i]) := borel _

instance instBorelSpace : BorelSpace (Πʳ i, [G i, B i]) := ⟨rfl⟩

/-- The box `{x | ∀ i, x i ∈ C i}` of a family of subsets `C i ⊆ G i`. -/
def box (C : ∀ i, Set (G i)) : Set (Πʳ i, [G i, B i]) := {x | ∀ i, x i ∈ C i}

/-- A restricted product of countably many second countable groups over open subgroups is second
countable, so its Borel σ-algebra is generated by the boxes with open factors that are cofinitely
`B i` ([Sutherland], §23.3, p. 6). -/
theorem secondCountableTopology [Countable ι] [∀ i, IsTopologicalGroup (G i)]
    [∀ i, SecondCountableTopology (G i)] [Fact (∀ i, IsOpen (B i : Set (G i)))] :
    SecondCountableTopology (Πʳ i, [G i, B i]) := by
  sorry

/-- The restricted product of Haar measures. For left Haar measures `μ i` with `μ i (B i) = 1` for
all but finitely many `i`, and `B i` compact for all but finitely many `i`, there is a unique Borel
measure on `Πʳ i, [G i, B i]` giving every measurable box whose factors are cofinitely `B i` the
mass `∏ᶠ i, μ i (C i)`; it is a left Haar measure ([Borel], §5.5, p. 21;
[Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the construction after it, pp. 188–189). -/
theorem exists_unique_haarProduct [Countable ι] [∀ i, IsTopologicalGroup (G i)]
    [∀ i, LocallyCompactSpace (G i)] [∀ i, T2Space (G i)] [∀ i, SecondCountableTopology (G i)]
    [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)] [Fact (∀ i, IsOpen (B i : Set (G i)))]
    (hB : ∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))
    (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1) :
    ∃! ν : Measure (Πʳ i, [G i, B i]), ν.IsHaarMeasure ∧
      ∀ C : ∀ i, Set (G i), (∀ i, MeasurableSet (C i)) → (∀ᶠ i in cofinite, C i = B i) →
        ν (box C) = ∏ᶠ i, μ i (C i) := by
  sorry

/-- Rescaling finitely many local Haar measures rescales their restricted product by the
product of the local scalars ([Borel], §5.5, p. 21). -/
theorem haarProduct_rescale [Countable ι] [∀ i, IsTopologicalGroup (G i)]
    [∀ i, LocallyCompactSpace (G i)] [∀ i, T2Space (G i)] [∀ i, SecondCountableTopology (G i)]
    [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)] [Fact (∀ i, IsOpen (B i : Set (G i)))]
    (hB : ∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))
    (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1)
    (c : ι → ℝ≥0∞) (hc0 : ∀ i, c i ≠ 0) (hcfin : ∀ i, c i ≠ ∞)
    (hc : ∀ᶠ i in cofinite, c i = 1)
    (ν ν' : Measure (Πʳ i, [G i, B i]))
    (hν : ∀ C : ∀ i, Set (G i), (∀ i, MeasurableSet (C i)) → (∀ᶠ i in cofinite, C i = B i) →
      ν (box C) = ∏ᶠ i, μ i (C i))
    (hν' : ∀ C : ∀ i, Set (G i), (∀ i, MeasurableSet (C i)) → (∀ᶠ i in cofinite, C i = B i) →
      ν' (box C) = ∏ᶠ i, (c i • μ i) (C i)) :
    ν' = (∏ᶠ i, c i) • ν := by
  sorry

/-- Summably perturbed integral masses determine a unique convergent restricted Haar product.
A box with exceptional set `T` has its finite product of local masses times the infinite tail
product; exceptional factors retain their original normalization
([Platonov–Rapinchuk–Rapinchuk], Lemma 3.63 and the construction after it, pp. 188–189). -/
theorem exists_unique_convergentHaarProduct [Countable ι] [∀ i, IsTopologicalGroup (G i)]
    [∀ i, LocallyCompactSpace (G i)] [∀ i, T2Space (G i)] [∀ i, SecondCountableTopology (G i)]
    [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)] [Fact (∀ i, IsOpen (B i : Set (G i)))]
    (S : Finset ι) (hB : ∀ i ∉ S, IsCompact (B i : Set (G i)))
    (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (hsum : Summable (fun i : {i // i ∉ S} => |(μ i (B i)).toReal - 1|)) :
    ∃! ν : Measure (Πʳ i, [G i, B i]), ν.IsHaarMeasure ∧
      ∀ (T : Finset ι), S ⊆ T → ∀ C : ∀ i, Set (G i),
        (∀ i, MeasurableSet (C i)) → (∀ i ∉ T, C i = B i) →
        ν (box C) = (∏ i ∈ T, μ i (C i)) *
          ENNReal.ofReal (∏' i : {i // i ∉ T}, (μ i (B i)).toReal) := by
  sorry

end RestrictedHaar

/-- The volumes `1 − p⁻¹` of `ℤ_p^×` for the form measures `|dx/x|_p` have product zero, so the
Tamagawa measure of `G_m` needs the convergence factors `(1 − p⁻¹)⁻¹` ([Borel], §5.5, p. 21). -/
theorem tendsto_prod_one_sub_inv_prime :
    Tendsto (fun N : ℕ => ∏ p ∈ Finset.filter Nat.Prime (Finset.range N), (1 - (p : ℝ)⁻¹))
      atTop (𝓝 0) := by
  sorry

namespace Adeles

open _root_.NumberField IsDedekindDomain

variable (K : Type*) [Field K] [NumberField K]

/-- Multiplication by a unit of the completion scales additive Haar images by its absNorm-normalized
norm ([Platonov–Rapinchuk–Rapinchuk], §3.5, pp. 186–187). -/
theorem distribHaarChar_adicCompletion (v : HeightOneSpectrum (𝓞 K))
    (x : (v.adicCompletion K)ˣ) :
    distribHaarChar (v.adicCompletion K) x = ‖(x : v.adicCompletion K)‖₊ := by
  sorry

/-- The additive Haar character of an idele is its product-defined idele norm
([Platonov–Rapinchuk–Rapinchuk], §3.5, pp. 186–189). -/
theorem distribHaarChar_adeleRing (x : IdeleGroup (𝓞 K) K) :
    distribHaarChar (AdeleRing (𝓞 K) K) x =
      (TauCeti.GlobalNumberFields.ideleNorm x : ℝ≥0) := by
  sorry

instance instMeasurableSpaceFiniteAdeleRing : MeasurableSpace (FiniteAdeleRing (𝓞 K) K) :=
  borel _

instance instBorelSpaceFiniteAdeleRing : BorelSpace (FiniteAdeleRing (𝓞 K) K) := ⟨rfl⟩

instance instMeasurableSpaceInfiniteAdeleRing : MeasurableSpace (InfiniteAdeleRing K) := borel _

instance instBorelSpaceInfiniteAdeleRing : BorelSpace (InfiniteAdeleRing K) := ⟨rfl⟩

/-- The product σ-algebra on `𝔸_K = K_∞ × 𝔸_{K,f}`. -/
instance instMeasurableSpaceAdeleRing : MeasurableSpace (AdeleRing (𝓞 K) K) :=
  inferInstanceAs (MeasurableSpace (InfiniteAdeleRing K × FiniteAdeleRing (𝓞 K) K))

/-- Both factors are second countable, so the product σ-algebra is the Borel σ-algebra. -/
instance instBorelSpaceAdeleRing : BorelSpace (AdeleRing (𝓞 K) K) := by
  sorry

/-- The compact open subring `∏_v 𝒪_v` of the finite adeles. -/
def finiteIntegers : TopologicalSpace.PositiveCompacts (FiniteAdeleRing (𝓞 K) K) where
  carrier := {x | ∀ v, x v ∈ v.adicCompletionIntegers K}
  isCompact' := by sorry
  interior_nonempty' := by sorry

/-- The Haar measure on `𝔸_{K,f}` normalized by `μ_f(∏_v 𝒪_v) = 1`. -/
def finiteAdeleHaar : Measure (FiniteAdeleRing (𝓞 K) K) :=
  Measure.addHaarMeasure (finiteIntegers K)

/-- `finiteAdeleHaar` is the restricted product of the local Haar measures normalized by
`μ_v(𝒪_v) = 1`: a measurable box with cofinitely integral factors has mass `∏ᶠ v, μ_v(C_v)`
([Sutherland], §23.3, p. 6; [Platonov–Rapinchuk–Rapinchuk], Lemma 3.63, pp. 188–189). -/
theorem finiteAdeleHaar_box [∀ v : HeightOneSpectrum (𝓞 K), MeasurableSpace (v.adicCompletion K)]
    [∀ v : HeightOneSpectrum (𝓞 K), BorelSpace (v.adicCompletion K)]
    (μ : ∀ v : HeightOneSpectrum (𝓞 K), Measure (v.adicCompletion K))
    [∀ v, (μ v).IsAddHaarMeasure] (hμ : ∀ v, μ v (v.adicCompletionIntegers K) = 1)
    (C : ∀ v : HeightOneSpectrum (𝓞 K), Set (v.adicCompletion K))
    (hC : ∀ v, MeasurableSet (C v))
    (hcof : ∀ᶠ v in cofinite, C v = (v.adicCompletionIntegers K : Set (v.adicCompletion K))) :
    finiteAdeleHaar K {x | ∀ v, x v ∈ C v} = ∏ᶠ v, μ v (C v) := by
  sorry

/-- The closure of a nonzero ideal `𝔞` of `𝓞_K` in `𝔸_{K,f}` has mass `N(𝔞)⁻¹`. -/
theorem finiteAdeleHaar_closure_ideal (I : Ideal (𝓞 K)) (hI : I ≠ ⊥) :
    finiteAdeleHaar K (closure (algebraMap (𝓞 K) (FiniteAdeleRing (𝓞 K) K) '' I)) =
      (Ideal.absNorm I : ℝ≥0∞)⁻¹ := by
  sorry

/-- The archimedean measure: Lebesgue measure at real places and `2 dx dy` at complex places,
transported from the mixed space. -/
def infiniteAdeleHaar : Measure (InfiniteAdeleRing K) :=
  (2 : ℝ≥0∞) ^ InfinitePlace.nrComplexPlaces K •
    Measure.map (InfiniteAdeleRing.ringEquiv_mixedSpace K).symm volume

/-- The normalized Haar measure `μ_𝔸 = μ_∞ × μ_f` on the adeles. -/
def adeleHaar : Measure (AdeleRing (𝓞 K) K) := (infiniteAdeleHaar K).prod (finiteAdeleHaar K)

theorem adeleHaar_isAddHaarMeasure : (adeleHaar K).IsAddHaarMeasure := by
  sorry

/-- `D_∞ × ∏_v 𝒪_v`, with `D_∞` the parallelotope of an integral basis of `𝓞_K` in `K_∞`. -/
def adeleFundamentalSet : Set (AdeleRing (𝓞 K) K) :=
  (InfiniteAdeleRing.ringEquiv_mixedSpace K ⁻¹'
      ZSpan.fundamentalDomain (mixedEmbedding.latticeBasis K)) ×ˢ (finiteIntegers K : Set _)

/-- `D_∞ × ∏_v 𝒪_v` is a fundamental domain for `K` in `𝔸_K`, of mass `|d_K|^{1/2}`; so
`vol(𝔸_K/K) = |d_K|^{1/2}` for this normalization. The domain follows from GlobalNumberFields
layer 6 additive strong approximation and `ZSpan.isAddFundamentalDomain`; its mass follows from
`NumberField.mixedEmbedding.volume_fundamentalDomain_latticeBasis`
(Mathlib `NumberTheory/NumberField/Discriminant/Basic.lean`, line 89) and the factor `2^{r₂}`
in `infiniteAdeleHaar`. [Sutherland], §23.3, p. 6, fixes the local normalization. -/
theorem isAddFundamentalDomain_adeleFundamentalSet :
    IsAddFundamentalDomain (algebraMap K (AdeleRing (𝓞 K) K)).range.toAddSubgroup
        (adeleFundamentalSet K) (adeleHaar K) ∧
      adeleHaar K (adeleFundamentalSet K) = ENNReal.ofReal (Real.sqrt |(discr K : ℝ)|) := by
  sorry

end Adeles

/-! ## Layer AA.1: adelic points of algebraic groups -/

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- The archimedean and finite projections identify adelic points with the product of their
point groups, with the evaluation topologies ([Conrad], Proposition 2.1, proof, p. 2). -/
theorem exists_infiniteFiniteEquiv :
    ∃ e : AdelicPoints F H ≃ₜ* InfinitePoints F H × FiniteAdelicPoints F H,
      ∀ x, e x = (infiniteProjection F H x, finiteProjection F H x) := by
  sorry

/-- `G(F)` is a discrete closed subgroup of `G(𝔸_F)` for `H` of finite type ([Conrad], Ex. 2.3,
p. 3; [Borel], §1.2, p. 7). -/
theorem discreteTopology_range_diagonal [Algebra.FiniteType F H] :
    DiscreteTopology (diagonal F H).range := by
  sorry

theorem isClosed_range_diagonal [Algebra.FiniteType F H] :
    IsClosed ((diagonal F H).range : Set (AdelicPoints F H)) := by
  sorry

/-- The additive-group point equivalence identifies the adelic evaluation topology with the
adele-ring topology ([Arthur], §2, p. 11). -/
theorem isHomeomorph_ga :
    IsHomeomorph (TauCeti.AdditiveGroup.gaPointsMulEquiv (R := F)
      (A := NumberField.AdeleRing (𝓞 F) F)) := by
  sorry

/-- The `GL_n` point equivalence identifies the adelic evaluation topology with the units
topology on adelic matrices, in every rank ([Conrad], Proposition 2.1, p. 2; RG2.0). -/
theorem isHomeomorph_gln (n : ℕ) :
    IsHomeomorph (TauCeti.GeneralLinear.pointsMulEquiv (R := F)
      (A := NumberField.AdeleRing (𝓞 F) F) n) := by
  sorry

/-- `G_m(𝔸_F)` is the idele group: Tau Ceti's `MultiplicativeGroup.pointsMulEquiv` is a
homeomorphism onto `𝔸_F^×` with the units topology ([Borel], §1.3, p. 7). -/
theorem isHomeomorph_gm :
    IsHomeomorph (TauCeti.MultiplicativeGroup.pointsMulEquiv (R := F)
      (A := NumberField.AdeleRing (𝓞 F) F)) := by
  sorry

/-- Evaluation at `T` on adelic `G_m` is not a topological embedding into the adele ring. -/
theorem gm_not_subspace : ¬ Topology.IsEmbedding (fun x : AdelicPoints F (LaurentPolynomial F) =>
    x.ofConv (LaurentPolynomial.T 1)) := by
  sorry

/-- `G(𝔸_F)` is unimodular for connected reductive `G` ([Borel], §5.5, p. 20). -/
theorem modularCharacter_eq_one [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    Measure.modularCharacter (G := AdelicPoints F H) = 1 := by
  sorry

end AdelicPoints

/-- `𝒪_{F,S}`: the elements of `F` integral at every finite place outside `S`. -/
abbrev SIntegers (F : Type) [Field F] [NumberField F]
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F))) :=
  (S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 F))).integer F

/-- An integral model of `G = Spec H` away from `S`: a finitely presented commutative Hopf
`𝒪_{F,S}`-algebra with a Hopf isomorphism of its generic fibre with `H` ([Conrad], Thm 3.4 and
Rem. 3.5, pp. 5–6). -/
structure IntegralModel (F : Type) [Field F] [NumberField F]
    (H : Type) [CommRing H] [HopfAlgebra F H]
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F))) where
  /-- The coordinate Hopf algebra over `𝒪_{F,S}`. -/
  coordinate : CommHopfAlgCat (SIntegers F S)
  finitePresentation : Algebra.FinitePresentation (SIntegers F S) coordinate
  /-- The identification of the generic fibre with `H`. -/
  baseChangeIso : TauCeti.CommHopfAlgCat.baseChange (K := F) coordinate ≅ CommHopfAlgCat.of F H

namespace IntegralModel

open IsDedekindDomain AdelicPoints

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]
  {S : Finset (HeightOneSpectrum (𝓞 F))}

/-- `𝓗(𝒪_v) ⊂ G(F_v)` for `v ∉ S`: the points with integral values on the image of the integral
coordinate ring. -/
def localPoints (M : IntegralModel F H S) (v : HeightOneSpectrum (𝓞 F)) (hv : v ∉ S) :
    Subgroup (LocalPoints F H v) where
  carrier := {g | ∀ a : M.coordinate,
    g.ofConv (M.baseChangeIso.hom.hom ((1 : F) ⊗ₜ[SIntegers F S] a)) ∈ v.adicCompletionIntegers F}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- The restricting subgroups: `𝓗(𝒪_v)` for `v ∉ S` and `G(F_v)` for `v ∈ S`. -/
def level (M : IntegralModel F H S) (v : HeightOneSpectrum (𝓞 F)) : Subgroup (LocalPoints F H v) :=
  if hv : v ∈ S then ⊤ else M.localPoints v hv

/-- Spreading out: every finite-type `H` has an integral model away from some finite `S`
([Conrad], Thm 3.4(1), p. 5). -/
theorem exists_of_finiteType [Algebra.FiniteType F H] :
    ∃ S : Finset (HeightOneSpectrum (𝓞 F)), Nonempty (IntegralModel F H S) := by
  sorry

/-- Adelic points as a restricted product: coordinate projections give an isomorphism of
topological groups `G(𝔸_{F,f}) ≃ Πʳ v, [G(F_v), B_v]` ([Conrad], Thm 3.6, p. 6). -/
theorem exists_restrictedProductEquiv [Algebra.FiniteType F H] (M : IntegralModel F H S) :
    ∃ e : FiniteAdelicPoints F H ≃ₜ* Πʳ v, [LocalPoints F H v, M.level v],
      ∀ (x : FiniteAdelicPoints F H) (v : HeightOneSpectrum (𝓞 F)) (h : H),
        (e x v).ofConv h = (x.ofConv h) v := by
  sorry

end IntegralModel

/-! ## Layer AA.2: characters, quotient measures and Tamagawa measures -/

namespace RationalCharacter

variable {F : Type} [Field F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- For `G` of finite type, geometrically reduced and geometrically connected, `X*_F(G)` is free
abelian of finite rank, by geometric maximal-torus restriction and subgroup theory over `ℤ`
(ReductiveGroups, layers 4, 5 and 7; Tau Ceti `isMulTorsionFree_geometricCharacterGroup`). -/
theorem free [Algebra.FiniteType F H]
    (hred : TauCeti.geometricallyReducedCommHopfAlgProperty F (CommHopfAlgCat.of F H))
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F (CommHopfAlgCat.of F H)) :
    Module.Free ℤ (Additive (RationalCharacter F H)) ∧
      Module.Finite ℤ (Additive (RationalCharacter F H)) := by
  sorry

/-- The rational character lattice of `GL_n`, for `n > 0`, is generated by the determinant. -/
theorem gln_det (n : ℕ) (hn : 0 < n) :
    ∃ e : RationalCharacter F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n) ≃*
      Multiplicative ℤ,
      e (TauCeti.GeneralLinear.determinantGroupLike F n) = Multiplicative.ofAdd (1 : ℤ) := by
  sorry

/-- Every rational character of `SL_n` is trivial, including ranks zero and one. -/
theorem sln_trivial (n : ℕ) :
    Subsingleton (RationalCharacter F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n)) := by
  sorry

end RationalCharacter

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- Every rational-character coordinate of the Harish-Chandra logarithm is continuous
([Arthur], §3, p. 16). -/
theorem continuous_logHeight_apply (χ : RationalCharacter F H) :
    Continuous (fun x : AdelicPoints F H =>
      (logHeight F H x).toAdd (Additive.ofMul χ)) := by
  sorry

/-- `H_G` vanishes on `G(F)` by the product formula ([Arthur], §3, p. 16). -/
theorem logHeight_diagonal (g : WithConv (H →ₐ[F] F)) : logHeight F H (diagonal F H g) = 1 := by
  sorry

/-- For connected reductive `G`, `H_G` is onto `a_G`: on the split component `A_G(ℝ)^0` it is an
isomorphism ([Arthur], (5.1), p. 24). -/
theorem logHeight_surjective [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    Function.Surjective (logHeight F H) := by
  sorry

/-- The norm-one subgroup of adelic `G_m` corresponds to the kernel of the idele norm. -/
theorem normOne_gm (x : AdelicPoints F (LaurentPolynomial F)) :
    x ∈ normOne F (LaurentPolynomial F) ↔
      TauCeti.GlobalNumberFields.ideleNorm (TauCeti.MultiplicativeGroup.pointsMulEquiv x) = 1 := by
  sorry

/-- The adelic norm-one subgroup of `SL₂` is the full adelic group. -/
theorem normOne_sl2 : normOne F (TauCeti.SpecialLinear.coordinateHopfAlgebra F 2) = ⊤ := by
  sorry

-- Ordinary right translation by a point of nonzero height leaves the norm-one carrier.
example {x g : AdelicPoints F H} (hx : x ∈ normOne F H)
    (hg : logHeight F H g ≠ 1) : x * g ∉ normOne F H := by
  change logHeight F H (x * g) ≠ 1
  rw [map_mul, (show logHeight F H x = 1 from hx), one_mul]
  exact hg

end AdelicPoints

/-- The invariant top-form line `ω_G = ∧^d (𝔪_ε/𝔪_ε²)` for a commutative Hopf algebra with
finite-dimensional identity cotangent space of dimension `d`; a gauge form is a nonzero vector
of this line ([Rosengarten], §1.1, p. 2). -/
abbrev GaugeForm (k : Type*) [Field k] (H : Type*) [CommRing H] [HopfAlgebra k H]
    [FiniteDimensional k (TauCeti.Bialgebra.CotangentSpace k H)] :=
  ⋀[k]^(Module.finrank k (TauCeti.Bialgebra.CotangentSpace k H))
    (TauCeti.Bialgebra.CotangentSpace k H)

namespace GaugeForm

variable (k : Type*) [Field k] (H : Type*) [CommRing H] [HopfAlgebra k H]
    [FiniteDimensional k (TauCeti.Bialgebra.CotangentSpace k H)]

/-- A finite-dimensional identity cotangent space has a one-dimensional top exterior power. -/
theorem finrank_eq_one :
    Module.finrank k (GaugeForm k H) = 1 := by
  sorry

/-- The identity cotangent space of the trivial group is finite-dimensional. -/
instance finiteDimensional_trivial : FiniteDimensional k (TauCeti.Bialgebra.CotangentSpace k k) := by
  sorry

/-- The empty wedge, a fixed generator of the trivial group's top-form line. -/
def trivialGroupGenerator : GaugeForm k k := by
  have h : Module.finrank k (TauCeti.Bialgebra.CotangentSpace k k) = 0 := by sorry
  unfold GaugeForm
  rw [h]
  exact exteriorPower.ιMulti k 0 (Fin.elim0 : Fin 0 → TauCeti.Bialgebra.CotangentSpace k k)

/-- The degree-zero top-form line of the trivial group, identified with the scalar field by
`exteriorPower.zeroEquiv`. A gauge scalar retains its value on the empty basis. -/
def trivialGroupEquiv : GaugeForm k k ≃ₗ[k] k := by
  unfold GaugeForm
  have h : Module.finrank k (TauCeti.Bialgebra.CotangentSpace k k) = 0 := by sorry
  rw [h]
  exact exteriorPower.zeroEquiv k (TauCeti.Bialgebra.CotangentSpace k k)

end GaugeForm

namespace HomogeneousMeasure

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [LocallyCompactSpace G] [T2Space G] [SecondCountableTopology G]
  [MeasurableSpace G] [BorelSpace G]

/-- Matching modular characters give the unique right-invariant homogeneous measure satisfying
Weil's formula for the chosen right Haar measures on `G` and its closed subgroup `H`
([Platonov–Rapinchuk–Rapinchuk], Theorem 3.64 and (3.26), pp. 189–190, after inversion). -/
theorem exists_unique_quotientMeasure (H : Subgroup G) (hH : IsClosed (H : Set G))
    [LocallyCompactSpace H] [MeasurableSpace H] [BorelSpace H]
    (μG : Measure G) [μG.inv.IsHaarMeasure] (μH : Measure H) [μH.inv.IsHaarMeasure]
    (hmod : ∀ h : H, Measure.modularCharacter (G := G) h =
      Measure.modularCharacter (G := H) h) :
    letI : MeasurableSpace (MulAction.orbitRel.Quotient H G) := borel _
    ∃! ν : Measure (MulAction.orbitRel.Quotient H G), IsFiniteMeasureOnCompacts ν ∧
      (∀ g : G, Measure.map (fun q : MulAction.orbitRel.Quotient H G =>
        Quotient.mk'' (q.out * g)) ν = ν) ∧
      ∀ f : G → ℝ, Continuous f → HasCompactSupport f →
        (∫ g, f g ∂μG) = ∫ q, (∫ h : H, f ((h : G) * q.out) ∂μH) ∂ν := by
  sorry

end HomogeneousMeasure

namespace Tamagawa

open IsDedekindDomain

variable (F : Type) [Field F] [NumberField F]

/-- The split local Artin factor `(1 − q_v^{−s})^{−r}` of the character module `ℤ^r` with trivial
Galois action, `q_v` the residue cardinality at `v`. -/
def splitLocalFactor (v : HeightOneSpectrum (𝓞 F)) (r : ℕ) (s : ℂ) : ℂ :=
  ((1 - (Ideal.absNorm v.asIdeal : ℂ) ^ (-s)) ^ r)⁻¹

/-- The split leading coefficient `(res_{s=1} ζ_F)^r`. -/
def splitLeadingCoeff (r : ℕ) : ℝ := NumberField.dedekindZeta_residue F ^ r

/-- Corrected volumes of `GL_n`: for `n ≥ 1`, `(1 − q⁻¹)⁻¹ · #GL_n(𝔽_q) · q^{−n²} =
∏_{i=2}^{n} (1 − q^{−i})` at the residue field `𝔽_q` of `v` ([Platonov–Rapinchuk–Rapinchuk],
Example 5.23, p. 316, for `SL_2`). -/
theorem gl_correctedVolume (v : HeightOneSpectrum (𝓞 F)) (n : ℕ) (hn : 1 ≤ n) :
    (1 - (Ideal.absNorm v.asIdeal : ℝ)⁻¹)⁻¹ * Nat.card (GL (Fin n) (𝓞 F ⧸ v.asIdeal)) *
        (Ideal.absNorm v.asIdeal : ℝ) ^ (-((n : ℤ) ^ 2)) =
      ∏ i ∈ Finset.Icc 2 n, (1 - (Ideal.absNorm v.asIdeal : ℝ) ^ (-(i : ℤ))) := by
  sorry

end Tamagawa

/-! ## Layer AA.3: reduction and arithmetic quotients -/

namespace RealSiegel

variable {n : ℕ}

/-- `b` is `C`-reduced in the standard basis: `|b_ij| < C b_ii`, `b_ii < C b_jj` for `i < j` and
`∏ b_ii < C det b` ([BKT], Definition 4.11, p. 17). -/
def IsReduced (C : ℝ) (b : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  (∀ i j, |b i j| < C * b i i) ∧ (∀ i j, i < j → b i i < C * b j j) ∧ (∏ i, b i i < C * b.det)

/-- Reduction for `GL_n(ℝ)`: there is `C > 0` such that every positive definite form is
`GL_n(ℤ)`-equivalent to a `C`-reduced form ([Platonov–Rapinchuk–Rapinchuk], Theorem 4.12,
pp. 206–208). -/
theorem exists_reduced_GLZ : ∃ C : ℝ, 0 < C ∧ ∀ b : Matrix (Fin n) (Fin n) ℝ, b.PosDef →
    ∃ γ : GL (Fin n) ℤ, IsReduced C
      (((γ.map (Int.castRingHom ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ)ᵀ * b *
        ((γ.map (Int.castRingHom ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ)) := by
  sorry

end RealSiegel

namespace Reduction

open AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `Γ_{x,U} = G(F) ∩ x U x⁻¹`. -/
def levelArithmetic (x : FiniteAdelicPoints F H) (U : Subgroup (FiniteAdelicPoints F H)) :
    Subgroup (WithConv (H →ₐ[F] F)) :=
  (U.map (MulAut.conj x).toMonoidHom).comap (finiteDiagonal F H)

variable {F H}

/-- `Γ_{x,U}` is discrete in `G(F_∞)` ([Milne], Lemma 5.13, p. 57). -/
theorem levelArithmetic_discrete [Algebra.FiniteType F H] (x : FiniteAdelicPoints F H)
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H))) :
    DiscreteTopology ((levelArithmetic F H x U).map (infiniteDiagonal F H)) := by
  sorry

/-- Nested compact open levels give a finite-index inclusion of their rational intersections
([Milne], Lemma 5.13, p. 57, and compactness of the larger level). -/
theorem levelArithmetic_finiteRelIndex [Algebra.FiniteType F H]
    (x : FiniteAdelicPoints F H) (U U' : Subgroup (FiniteAdelicPoints F H))
    (h : U' ≤ U)
    (hUc : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H)))
    (hU'c : IsCompact (U' : Set (FiniteAdelicPoints F H)))
    (hU'o : IsOpen (U' : Set (FiniteAdelicPoints F H))) :
    (levelArithmetic F H x U').IsFiniteRelIndex (levelArithmetic F H x U) := by
  sorry

/-- The groups `Γ_{x,U}` for all `x` and compact open `U` are commensurable ([Milne], Lemma 5.13,
p. 57). -/
theorem levelArithmetic_commensurable [Algebra.FiniteType F H]
    (x y : FiniteAdelicPoints F H) (U V : Subgroup (FiniteAdelicPoints F H))
    (hUc : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H)))
    (hVc : IsCompact (V : Set (FiniteAdelicPoints F H)))
    (hVo : IsOpen (V : Set (FiniteAdelicPoints F H))) :
    (levelArithmetic F H x U).Commensurable (levelArithmetic F H y V) := by
  sorry

/-- The rational diagonal has a Borel fundamental domain for adelic Haar measure
([Borel], §1.2, p. 7; AA.2.3, using discrete translations and measurable fundamental domains). -/
theorem exists_measurable_fundamentalDomain [Algebra.FiniteType F H]
    (μ : Measure (AdelicPoints F H)) [μ.IsHaarMeasure] :
    ∃ D : Set (AdelicPoints F H), MeasurableSet D ∧
      IsFundamentalDomain (diagonal F H).range D μ := by
  sorry

/-- A compact set meets every rational orbit of norm-one adelic `G_m`. -/
theorem compact_gm : ∃ C : Set (AdelicPoints F (LaurentPolynomial F)), IsCompact C ∧
    ∀ x ∈ normOne F (LaurentPolynomial F), ∃ γ, diagonal F (LaurentPolynomial F) γ * x ∈ C := by
  sorry

/-- No compact set meets every rational orbit of adelic `SL₂`. -/
theorem not_compact_sl2 : ¬ ∃ C : Set (AdelicPoints F (TauCeti.SpecialLinear.coordinateHopfAlgebra F 2)),
    IsCompact C ∧ ∀ x ∈ normOne F (TauCeti.SpecialLinear.coordinateHopfAlgebra F 2),
      ∃ γ, diagonal F (TauCeti.SpecialLinear.coordinateHopfAlgebra F 2) γ * x ∈ C := by
  sorry

end Reduction

/-! ## Layer AA.4: approximation, neat levels and Hecke maps -/

namespace Approximation

open AdelicPoints IsDedekindDomain _root_.NumberField

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `G(F_w)` at an archimedean place `w`. -/
abbrev ArchPoints (w : InfinitePlace F) := WithConv (H →ₐ[F] w.Completion)

instance (w : InfinitePlace F) : TopologicalSpace (ArchPoints F H w) :=
  ⨅ h : H, TopologicalSpace.induced (fun x => x.ofConv h) inferInstance

/-- The diagonal `G(F) → G(F_S) = ∏_{w ∈ S_∞} G(F_w) × ∏_{v ∈ S_f} G(F_v)`. -/
def diagonalS (Sinf : Finset (InfinitePlace F)) (Sf : Finset (HeightOneSpectrum (𝓞 F)))
    (g : WithConv (H →ₐ[F] F)) :
    (∀ w : Sinf, ArchPoints F H w) × (∀ v : Sf, LocalPoints F H v) :=
  (fun _ => TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _) g,
    fun _ => TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _) g)

/-- Weak approximation for `S = S_∞ ∪ S_f`: `G(F)` is dense in `G(F_S)` ([HW], §1, p. 6). -/
def HasWeakApproximation (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (HeightOneSpectrum (𝓞 F))) : Prop :=
  DenseRange (diagonalS F H Sinf Sf)

/-- The group `μ₂` over `ℚ` fails weak approximation at the real and 2-adic places. -/
theorem not_hasWeakApproximation_mu2 (v : HeightOneSpectrum (𝓞 ℚ))
    (hv : (2 : 𝓞 ℚ) ∈ v.asIdeal) :
    ¬ HasWeakApproximation ℚ (MonoidAlgebra ℚ (Multiplicative (ZMod 2))) Finset.univ {v} := by
  sorry

/-- General linear groups satisfy weak approximation at every finite set of places, by weak
approximation on the open determinant-nonzero locus (AA.4.1, using GlobalNumberFields layer 1). -/
theorem hasWeakApproximation_gln (n : ℕ) (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (HeightOneSpectrum (𝓞 F))) :
    HasWeakApproximation F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n) Sinf Sf := by
  sorry

/-- Split tori of every rank satisfy weak approximation by field weak approximation and finite
products (AA.4.1, using GlobalNumberFields layer 1). -/
theorem hasWeakApproximation_splitTorus (r : ℕ) (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (HeightOneSpectrum (𝓞 F))) :
    HasWeakApproximation F (AddMonoidAlgebra F (Fin r → ℤ)) Sinf Sf := by
  sorry

/-- Connected semisimple simply connected groups have weak approximation for every finite set of
places ([PR94], Theorem 7.8, p. 415). -/
theorem hasWeakApproximation_of_simplyConnected (G : TauCeti.SemisimpleCommHopfAlgCat F)
    (hsc : TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty F G)
    (Sinf : Finset (InfinitePlace F)) (Sf : Finset (HeightOneSpectrum (𝓞 F))) :
    HasWeakApproximation F (G.obj : Type) Sinf Sf := by
  sorry

variable {F H} in
/-- With `S = ∞`, strong approximation makes every class set `G(F)\G(𝔸_{F,f})/U` a point
([Borel], §2.6, p. 13). -/
theorem HasStrongApproximation.classNumber_one (h : HasStrongApproximation F H ∅)
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    Subsingleton (DoubleCoset.Quotient
      ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U) := by
  sorry

/-- `SL_n` has strong approximation with respect to the archimedean places ([Rapinchuk],
Theorem 2.3, p. 12, for the absolutely almost simple simply connected group `SL_n`, `n ≥ 2`). -/
theorem hasStrongApproximation_sln (n : ℕ) :
    HasStrongApproximation F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n) ∅ := by
  sorry

/-- The group `G_m` over `ℚ` fails strong approximation away from infinity. -/
theorem not_hasStrongApproximation_gm : ¬ HasStrongApproximation ℚ (LaurentPolynomial ℚ) ∅ := by
  sorry

end Approximation

namespace Neat

open AdelicPoints Reduction

/-- An automorphism of `ℂ^n` is neat if its eigenvalues generate a torsion-free subgroup of `ℂ^×`
([Milne], §3, p. 34). -/
def IsNeatAut {n : ℕ} (α : GL (Fin n) ℂ) : Prop :=
  ∀ z ∈ Subgroup.closure
      {z : ℂˣ | Module.End.HasEigenvalue (Matrix.toLin' (α : Matrix (Fin n) (Fin n) ℂ)) z},
    IsOfFinOrder z → z = 1

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- The matrix action on rational points of an algebraic representation with coordinate map
`r : O(GL_n) → H`, with entries sent to `ℂ` by `τ`. -/
def algebraicPointMap (τ : F →+* ℂ) (n : ℕ)
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H) :
    WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ where
  toFun g := Matrix.GeneralLinearGroup.map τ
    (TauCeti.GeneralLinear.pointsMulEquiv (R := F) n
      (WithConv.toConv (g.ofConv.comp
        (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐ[F] H))))
  map_one' := by sorry
  map_mul' := by sorry

/-- `ρ` is the point action of a faithful algebraic representation: its coordinate map is
surjective (a closed immersion), not merely injective on rational points. -/
def IsFaithfulAlgebraicPointHom (τ : F →+* ℂ) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) : Prop :=
  ∃ r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H,
    Function.Surjective r ∧ ρ = algebraicPointMap τ n r

/-- A compact open `U ⊂ G(𝔸_{F,f})` is a neat level if every `G(F) ∩ x U x⁻¹` consists of neat
elements for the faithful representation `ρ` ([Milne], §5, p. 58). -/
def IsNeatLevel (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ)
    (U : Subgroup (FiniteAdelicPoints F H)) : Prop :=
  ∀ x : FiniteAdelicPoints F H, ∀ g ∈ levelArithmetic F H x U, IsNeatAut (ρ g)

-- The identity representation is faithful through its identity coordinate morphism.
example (τ : F →+* ℂ) (n : ℕ) : IsFaithfulAlgebraicPointHom τ n
    (algebraicPointMap τ n (BialgHom.id F
      (TauCeti.GeneralLinear.coordinateHopfAlgebra F n))) := by
  exact ⟨BialgHom.id F _, Function.surjective_id, rfl⟩

-- The trivial group embeds faithfully into `GL₀` through the surjective counit.
example (τ : F →+* ℂ) :
    Function.Surjective (Bialgebra.counitBialgHom F
      (TauCeti.GeneralLinear.coordinateHopfAlgebra F 0)) ∧
    IsFaithfulAlgebraicPointHom τ 0
      (algebraicPointMap τ 0 (Bialgebra.counitBialgHom F
        (TauCeti.GeneralLinear.coordinateHopfAlgebra F 0))) := by
  have hs : Function.Surjective (Bialgebra.counitBialgHom F
      (TauCeti.GeneralLinear.coordinateHopfAlgebra F 0)) := by
    intro a
    exact ⟨algebraMap F _ a, by simp⟩
  exact ⟨hs, ⟨Bialgebra.counitBialgHom F _, hs, rfl⟩⟩

/-- Neat levels exist: every compact open `U` contains a normal open subgroup of finite index that
is a neat level ([Milne], Proposition 3.5, p. 34). -/
theorem exists_isNeatLevel_le [Algebra.FiniteType F H] (τ : F →+* ℂ) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (hρ : IsFaithfulAlgebraicPointHom τ n ρ)
    (U : Subgroup (FiniteAdelicPoints F H)) (hUc : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    ∃ U' ≤ U, (U'.subgroupOf U).Normal ∧ IsOpen (U' : Set (FiniteAdelicPoints F H)) ∧
      U'.relIndex U ≠ 0 ∧ IsNeatLevel n ρ U' := by
  sorry

/-- At a neat level every rational intersection is torsion free, using the faithful algebraic
representation ([Milne], §3, p. 34, and §5, p. 58). -/
theorem torsion_free_levelArithmetic (τ : F →+* ℂ) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (hρ : IsFaithfulAlgebraicPointHom τ n ρ)
    (U : Subgroup (FiniteAdelicPoints F H)) (hneat : IsNeatLevel n ρ U)
    (x : FiniteAdelicPoints F H) (g : WithConv (H →ₐ[F] F))
    (hg : g ∈ levelArithmetic F H x U) (hfinite : IsOfFinOrder g) : g = 1 := by
  sorry

end Neat

namespace LevelMaps

open AdelicPoints Reduction

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `K∞ × U ⊂ G(F_∞) × G(𝔸_{F,f}) = G(𝔸_F)`. -/
def levelSubgroup (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :
    Subgroup (AdelicPoints F H) :=
  Kinf.comap (infiniteProjection F H) ⊓ U.comap (finiteProjection F H)

/-- `x ∼ γ x k` for `γ ∈ G(F)` and `k ∈ K∞U`. -/
def levelSetoid (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :
    Setoid (AdelicPoints F H) where
  r x y := ∃ γ, ∃ k ∈ levelSubgroup F H U Kinf, y = diagonal F H γ * x * k
  iseqv := by sorry

/-- The level quotient `X_U = G(F)\G(𝔸_F)/K∞U` with the quotient topology ([Milne], §5, p. 57). -/
abbrev LevelQuotient (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :=
  Quotient (levelSetoid F H U Kinf)

variable {F H}

/-- A finite adelic class representative labels each arithmetic component of the quotient
with trivial archimedean level; its real coordinate is retained
([Milne], Lemma 5.13, p. 57; [Arthur], §2, p. 13). -/
theorem exists_componentHomeomorph [Algebra.FiniteType F H]
    (U : Subgroup (FiniteAdelicPoints F H)) (hUc : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H)))
    (rep : DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U →
      FiniteAdelicPoints F H)
    (hrep : ∀ c, DoubleCoset.mk (finiteDiagonal F H).range U (rep c) = c) :
    ∃ e : (Σ c : DoubleCoset.Quotient
        ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U,
        MulAction.orbitRel.Quotient
          ((levelArithmetic F H (rep c) U).map (infiniteDiagonal F H)) (InfinitePoints F H)) ≃ₜ
      LevelQuotient F H U ⊥,
      ∀ c (x : AdelicPoints F H), finiteProjection F H x = rep c →
        e ⟨c, Quotient.mk'' (infiniteProjection F H x)⟩ = Quotient.mk _ x := by
  sorry

/-- The level map `X_{U'} → X_U`, `[x] ↦ [x]`, for `U' ≤ U`. -/
def levelMap {U U' : Subgroup (FiniteAdelicPoints F H)} (h : U' ≤ U)
    (Kinf : Subgroup (InfinitePoints F H)) :
    LevelQuotient F H U' Kinf → LevelQuotient F H U Kinf :=
  Quotient.map' id (by sorry)

/-- The Hecke correspondence `X_U ← X_{U ∩ gUg⁻¹} → X_U`, `[x] ↦ [x]` and `[x] ↦ [xg]`
([Arthur], §2, p. 13). -/
def hecke (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H))
    (g : FiniteAdelicPoints F H) :
    (LevelQuotient F H (U ⊓ U.map (MulAut.conj g).toMonoidHom) Kinf → LevelQuotient F H U Kinf) ×
      (LevelQuotient F H (U ⊓ U.map (MulAut.conj g).toMonoidHom) Kinf → LevelQuotient F H U Kinf) :=
  (levelMap inf_le_left Kinf, Quotient.map' (· * finiteEmbed F H g) (by sorry))

/-- If `K∞ ∩ ker H_G` (placed at the archimedean component) is compact, every full rational
stabilizer `G(F) ∩ x K∞U x⁻¹` is finite
([Arthur], §1, pp. 7–8, and §2, pp. 13–15). -/
theorem finite_rationalStabilizer [Algebra.FiniteType F H]
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (Kinf : Subgroup (InfinitePoints F H))
    (hK : IsCompact {x : AdelicPoints F H | infiniteProjection F H x ∈ Kinf ∧
      finiteProjection F H x = 1 ∧ logHeight F H x = 1})
    (x : AdelicPoints F H) :
    Finite (((levelSubgroup F H U Kinf).map (MulAut.conj x).toMonoidHom).comap
      (diagonal F H)) := by
  sorry

/-- Compact open finite level and a closed archimedean level with compact height kernel and
surjective height image give a Hausdorff locally compact arithmetic quotient
([Milne], Lemma 5.13, p. 57; [Arthur], §2, pp. 13–15). -/
theorem t2Space_locallyCompactSpace_levelQuotient [Algebra.FiniteType F H]
    (U : Subgroup (FiniteAdelicPoints F H)) (hUc : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H)))
    (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hK : IsCompact {x : AdelicPoints F H | infiniteProjection F H x ∈ Kinf ∧
      finiteProjection F H x = 1 ∧ logHeight F H x = 1})
    (hKH : ∀ y : AdelicPoints F H, ∃ x : AdelicPoints F H, infiniteProjection F H x ∈ Kinf ∧
      finiteProjection F H x = 1 ∧ logHeight F H x = logHeight F H y) :
    T2Space (LevelQuotient F H U Kinf) ∧ LocallyCompactSpace (LevelQuotient F H U Kinf) := by
  sorry

/-- Covering maps between neat levels: for `U` neat, `U' ≤ U` open and `K∞` closed with
`K∞ ∩ ker H_G` compact and every value of `H_G` taken on `K∞` (placed at the archimedean
component), `X_{U'} → X_U` is a covering map whose fibres have `[U : U']` elements
([Milne], §5, p. 58). -/
theorem isCoveringMap_levelMap [Algebra.FiniteType F H] (τ : F →+* ℂ) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ)
    {U U' : Subgroup (FiniteAdelicPoints F H)} (h : U' ≤ U)
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hU' : IsOpen (U' : Set (FiniteAdelicPoints F H))) (hneat : Neat.IsNeatLevel n ρ U)
    (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hK : IsCompact {x : AdelicPoints F H | infiniteProjection F H x ∈ Kinf ∧
      finiteProjection F H x = 1 ∧ logHeight F H x = 1})
    (hKH : ∀ y : AdelicPoints F H, ∃ x : AdelicPoints F H, infiniteProjection F H x ∈ Kinf ∧
      finiteProjection F H x = 1 ∧ logHeight F H x = logHeight F H y) :
    IsCoveringMap (levelMap h Kinf) ∧
      ∀ y, Nat.card (levelMap h Kinf ⁻¹' {y}) = U'.relIndex U := by
  sorry

/-- The second leg of the Hecke correspondence sends the class of `x` to the class of `xg`. -/
theorem hecke_snd (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H))
    (g : FiniteAdelicPoints F H) (x : AdelicPoints F H) :
    (hecke U Kinf g).2 (Quotient.mk _ x) = Quotient.mk _ (x * finiteEmbed F H g) := rfl

end LevelMaps

/-- The idele class group modulo squares is compact ([Khayutin], proof of Proposition 3.6, p. 25
(compactness of `ℚ^×\𝔸^×/𝔸^{×2}`); Definition 3.1, p. 22, for `G_res`). -/
theorem compactSpace_ideleClassGroup_quotient_squares (F : Type) [Field F] [NumberField F] :
    CompactSpace (NumberField.IdeleClassGroup (𝓞 F) F ⧸
      Subgroup.closure (Set.range fun x : NumberField.IdeleClassGroup (𝓞 F) F => x ^ 2)) := by
  sorry

namespace CompactFourier

variable {C : Type*} [CommGroup C] [TopologicalSpace C] [IsTopologicalGroup C]
  [CompactSpace C] [T2Space C] [SecondCountableTopology C] [MeasurableSpace C] [BorelSpace C]

/-- A quadratic-character kernel has Fourier coefficient one at the trivial character and at
that quadratic character, and zero at all other characters ([Khayutin], proof of Proposition 3.6,
arXiv v3 pp. 24–25, by character orthogonality). -/
theorem quadraticKernel_fourier (μ : ProbabilityMeasure C) [(μ : Measure C).IsHaarMeasure]
    (χ ψ : C →ₜ* ℂˣ) (hne : χ ≠ 1) (hquad : ∀ x, χ x ^ 2 = 1) :
    (∫ x, (ψ x : ℂ) ∂((2 : ℝ≥0∞) • (μ : Measure C).restrict {x | χ x = 1})) =
      if ψ = 1 ∨ ψ = χ then 1 else 0 := by
  sorry

/-- Haar probabilities on the kernels of distinct nontrivial quadratic characters converge
weakly to Haar probability on the compact abelian group ([Khayutin], proof of Proposition 3.6,
arXiv v3 pp. 24–25, by compact abelian Fourier theory). -/
theorem tendsto_quadraticKernel_haar (μ : ProbabilityMeasure C) [(μ : Measure C).IsHaarMeasure]
    (χ : ℕ → C →ₜ* ℂˣ) (hχ : Function.Injective χ) (hne : ∀ n, χ n ≠ 1)
    (hquad : ∀ n x, χ n x ^ 2 = 1) :
    ∃ m : ℕ → ProbabilityMeasure C,
      (∀ n, (m n : Measure C) = (2 : ℝ≥0∞) • (μ : Measure C).restrict {x | χ n x = 1}) ∧
      Tendsto m atTop (𝓝 μ) := by
  sorry

/-- A weak limit of probabilities invariant under distinct quadratic-character kernels is
invariant under the whole compact abelian group ([Khayutin], proof of Proposition 3.6,
arXiv v3 p. 25). -/
theorem isMulLeftInvariant_of_tendsto (χ : ℕ → C →ₜ* ℂˣ) (hχ : Function.Injective χ)
    (hquad : ∀ n x, χ n x ^ 2 = 1) (m : ℕ → ProbabilityMeasure C) (μ : ProbabilityMeasure C)
    (hm : ∀ n t, χ n t = 1 → Measure.map (t * ·) (m n : Measure C) = (m n : Measure C))
    (hlim : Tendsto m atTop (𝓝 μ)) : (μ : Measure C).IsMulLeftInvariant := by
  sorry

end CompactFourier

/-! ## Layer AA.5: worked examples -/

namespace AdelicExamples.GL1

open _root_.NumberField IsDedekindDomain AdelicPoints

variable (F : Type) [Field F] [NumberField F]

/-- `G_m(F)\G_m(𝔸_F)` is the idele class group, through `MultiplicativeGroup.pointsMulEquiv`
([Arthur], §3, p. 16). -/
theorem exists_quotientHomeomorph :
    ∃ e : MulAction.orbitRel.Quotient (diagonal F (LaurentPolynomial F)).range
        (AdelicPoints F (LaurentPolynomial F)) ≃ₜ IdeleClassGroup (𝓞 F) F,
      ∀ x, e (Quotient.mk'' x) = QuotientGroup.mk (TauCeti.MultiplicativeGroup.pointsMulEquiv x) := by
  sorry

/-- `Γ_U = F^× ∩ U` as a subgroup of `𝒪_F^×`. -/
def levelUnits (U : Subgroup (FiniteAdeleRing (𝓞 F) F)ˣ) : Subgroup (𝓞 F)ˣ :=
  U.comap ((FiniteAdeleRing.unitEmbedding (𝓞 F) F).comp
    (Units.map (algebraMap (𝓞 F) F).toMonoidHom))

/-- For open `U ≤ Ô^×`, `Γ_U` has finite index in `𝒪_F^×` ([CG], §8.2, p. 78 (the rank; finite
index is a direct deduction from compactness of `Ô^×`)). -/
theorem levelUnits_finiteIndex (U : Subgroup (FiniteAdeleRing (𝓞 F) F)ˣ)
    (hU : IsOpen (U : Set (FiniteAdeleRing (𝓞 F) F)ˣ))
    (hle : U ≤ FiniteAdeleRing.integralUnits (𝓞 F) F) : (levelUnits F U).FiniteIndex := by
  sorry

/-- `U_Q = K_∞ × ∏_v U_{Q,v}`: trivial at real places, the unit circle at complex places, `𝒪_v^×`
for `v ∉ Q` and the `p^n`-th powers of `𝒪_v^×` for `v ∈ Q`. -/
def levelQ (Q : Finset (HeightOneSpectrum (𝓞 F))) (p n : ℕ) : Subgroup (IdeleGroup (𝓞 F) F) where
  carrier := {x |
    (∀ w : InfinitePlace F, w.IsReal → (x : AdeleRing (𝓞 F) F).1 w = 1) ∧
    (∀ w : InfinitePlace F, w.IsComplex → ‖(x : AdeleRing (𝓞 F) F).1 w‖ = 1) ∧
    (∀ v, v ∉ Q → (x : AdeleRing (𝓞 F) F).2 v ∈ v.adicCompletionIntegers F ∧
      ((x⁻¹ : IdeleGroup (𝓞 F) F) : AdeleRing (𝓞 F) F).2 v ∈ v.adicCompletionIntegers F) ∧
    (∀ v ∈ Q, ∃ y : (v.adicCompletionIntegers F)ˣ,
      (x : AdeleRing (𝓞 F) F).2 v = ((y ^ (p ^ n) : (v.adicCompletionIntegers F)ˣ) :
        v.adicCompletion F))}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- The real number `t` in the completion `F_w`. -/
def archComponent (t : ℝ) (w : InfinitePlace F) : w.Completion :=
  if hw : w.IsReal then (InfinitePlace.Completion.ringEquivRealOfIsReal hw).symm t
  else (InfinitePlace.Completion.ringEquivComplexOfIsComplex
    (InfinitePlace.not_isReal_iff_isComplex.mp hw)).symm (t : ℂ)

/-- The idele with component `t ≠ 0` at every archimedean place and `1` at every finite place. -/
def archimedeanScalar (t : ℝ) : IdeleGroup (𝓞 F) F :=
  if ht : t = 0 then 1 else
    { val := ((fun w => archComponent F t w : InfiniteAdeleRing F), 1)
      inv := ((fun w => archComponent F t⁻¹ w : InfiniteAdeleRing F), 1)
      val_inv := by sorry
      inv_val := by sorry }

/-- `A_{G_m}(ℝ)^0 = ℝ_{>0}`, embedded diagonally at the archimedean places. -/
def posRealsDiag : Subgroup (IdeleGroup (𝓞 F) F) where
  carrier := {x | ∃ t : ℝ, 0 < t ∧ x = archimedeanScalar F t}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- A positive scalar at every infinite place has idele norm `t^[F:ℚ]`. -/
theorem ideleNorm_archimedeanScalar (t : ℝ) (ht : 0 < t) :
    ((TauCeti.GlobalNumberFields.ideleNorm (archimedeanScalar F t) : ℝ≥0) : ℝ) =
      t ^ Module.finrank ℚ F := by
  sorry

/-- `X_Q = F^×\𝔸_F^×/U_Q A_∞^0`, with the quotient topology. -/
abbrev XQ (Q : Finset (HeightOneSpectrum (𝓞 F))) (p n : ℕ) :=
  IdeleGroup (𝓞 F) F ⧸ (IdeleGroup.principalSubgroup (𝓞 F) F ⊔ levelQ F Q p n ⊔ posRealsDiag F)

/-- Every connected component of `X_Q` is a compact torus of dimension `r₁ + r₂ − 1` ([CG], §8.2,
pp. 78–79). -/
theorem nonempty_connectedComponent_homeomorph (Q : Finset (HeightOneSpectrum (𝓞 F))) (p n : ℕ)
    [Fact p.Prime] (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) (x : XQ F Q p n) :
    Nonempty (connectedComponent x ≃ₜ (Fin (Units.rank F) → AddCircle (1 : ℝ))) := by
  sorry

end AdelicExamples.GL1

namespace AdelicExamples.GL2

open scoped MatrixGroups UpperHalfPlane
open Matrix

/-- The finite adeles of `ℚ`. -/
abbrev Af := IsDedekindDomain.FiniteAdeleRing ℤ ℚ

/-- `x ∈ ℤ̂`: every component lies in `ℤ_p`. -/
def IsAdelicInteger (x : Af) : Prop :=
  ∀ v : IsDedekindDomain.HeightOneSpectrum ℤ, x v ∈ v.adicCompletionIntegers ℚ

/-- `x ≡ y mod N` in `ℤ̂`: `x − y ∈ Nℤ̂`, which is equality for `N = 0`. -/
def CongrMod (N : ℕ) (x y : Af) : Prop :=
  ∃ z : Af, IsAdelicInteger z ∧ x - y = (N : Af) * z

/-- The diagonal embedding `GL₂(ℚ) → GL₂(𝔸_f)`. -/
def diag : GL (Fin 2) ℚ →* GL (Fin 2) Af := Matrix.GeneralLinearGroup.map (algebraMap ℚ Af)

/-- Rational matrices as real matrices. -/
def toReal : GL (Fin 2) ℚ →* GL (Fin 2) ℝ := Matrix.GeneralLinearGroup.map (Rat.castHom ℝ)

/-- `ℤ̂^×` inside `𝔸_f^×`. -/
abbrev zhatUnits : Subgroup Afˣ := IsDedekindDomain.FiniteAdeleRing.integralUnits ℤ ℚ

/-- `GL₂(ℤ̂)`: integral matrices with integral inverse. -/
def GL2Zhat : Subgroup (GL (Fin 2) Af) where
  carrier := {g | ∀ i j, IsAdelicInteger ((g : Matrix (Fin 2) (Fin 2) Af) i j) ∧
    IsAdelicInteger (((g⁻¹ : GL (Fin 2) Af) : Matrix (Fin 2) (Fin 2) Af) i j)}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- `K(N) = ker(GL₂(ℤ̂) → GL₂(ℤ/N))`. -/
def principalLevel (N : ℕ) : Subgroup (GL (Fin 2) Af) where
  carrier := {g | g ∈ GL2Zhat ∧
    ∀ i j, CongrMod N ((g : Matrix (Fin 2) (Fin 2) Af) i j) ((1 : Matrix (Fin 2) (Fin 2) Af) i j)}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- `K₀(N)`: matrices of `GL₂(ℤ̂)` with `c ≡ 0 mod N`. -/
def level0 (N : ℕ) : Subgroup (GL (Fin 2) Af) where
  carrier := {g | g ∈ GL2Zhat ∧ CongrMod N ((g : Matrix (Fin 2) (Fin 2) Af) 1 0) 0}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- `K₁(N)`: matrices of `GL₂(ℤ̂)` with `c ≡ 0` and `d ≡ 1 mod N`. -/
def level1 (N : ℕ) : Subgroup (GL (Fin 2) Af) where
  carrier := {g | g ∈ GL2Zhat ∧ CongrMod N ((g : Matrix (Fin 2) (Fin 2) Af) 1 0) 0 ∧
    CongrMod N ((g : Matrix (Fin 2) (Fin 2) Af) 1 1) 1}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- `Γ_{g,U} = GL₂(ℚ)^+ ∩ gUg⁻¹`, with `GL₂(ℚ)` embedded diagonally. -/
def componentGroup (U : Subgroup (GL (Fin 2) Af)) (g : GL (Fin 2) Af) : Subgroup (GL (Fin 2) ℚ) :=
  GLPos (Fin 2) ℚ ⊓ (U.map (MulAut.conj g).toMonoidHom).comap diag

/-- The image of `Γ_{g,U}` in `GL₂(ℝ)`, acting on `ℍ` by Möbius transformations. -/
def componentGroupReal (U : Subgroup (GL (Fin 2) Af)) (g : GL (Fin 2) Af) :
    Subgroup (GL (Fin 2) ℝ) :=
  (componentGroup U g).map toReal

variable {U : Subgroup (GL (Fin 2) Af)}

/-- For compact open `U`, `Γ_{g,U}` is an arithmetic subgroup of `SL₂`: its real image is
commensurable with `SL₂(ℤ)` ([Milne], §4, p. 42, Proposition 4.1, p. 43; Lemma 5.13, p. 57). -/
theorem isArithmetic_componentGroupReal (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) (g : GL (Fin 2) Af) :
    (componentGroupReal U g).IsArithmetic := by
  sorry

/-- At level `K(N)` and a representative in `GL₂(ℤ̂)` the component group is `Γ(N)`
([Milne], Lemma 5.13, p. 57). -/
theorem componentGroup_principalLevel (N : ℕ) (hN : 0 < N) {g : GL (Fin 2) Af}
    (hg : g ∈ GL2Zhat) :
    componentGroup (principalLevel N) g =
      (CongruenceSubgroup.Gamma N).map (SpecialLinearGroup.mapGL ℚ) := by
  sorry

/-- `GL₂(ℚ)^+`, embedded diagonally in `GL₂(𝔸_f)`. -/
def ratPos : Subgroup (GL (Fin 2) Af) := (GLPos (Fin 2) ℚ).map diag

/-- The components `GL₂(ℚ)^+\GL₂(𝔸_f)/U`. -/
abbrev Components (U : Subgroup (GL (Fin 2) Af)) :=
  DoubleCoset.Quotient (ratPos : Set (GL (Fin 2) Af)) U

/-- `(z, a) ∼ (q z, q a u)` for `q ∈ GL₂(ℚ)^+` and `u ∈ U`. -/
def levelSetoid (U : Subgroup (GL (Fin 2) Af)) : Setoid (ℍ × GL (Fin 2) Af) where
  r x y := ∃ q ∈ GLPos (Fin 2) ℚ, ∃ u ∈ U, y.1 = toReal q • x.1 ∧ y.2 = diag q * x.2 * u
  iseqv := by sorry

/-- The level space `GL₂(ℚ)^+ \ (ℍ × GL₂(𝔸_f)/U)`, the model of `GL₂(ℚ)\GL₂(𝔸)/ℝ^×SO(2)U`. -/
abbrev LevelSpace (U : Subgroup (GL (Fin 2) Af)) := Quotient (levelSetoid U)

/-- The upper half-plane decomposition: for representatives `rep c` of the components,
`[z] ↦ [(z, rep c)]` is a homeomorphism `⊔_c Γ_{rep c, U}\ℍ ≃ X_U` ([Milne], Lemma 5.13,
p. 57). -/
theorem exists_componentHomeomorph (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) (rep : Components U → GL (Fin 2) Af)
    (hrep : ∀ c, DoubleCoset.mk ratPos U (rep c) = c) :
    ∃ e : (Σ c : Components U, MulAction.orbitRel.Quotient (componentGroupReal U (rep c)) ℍ) ≃ₜ
        LevelSpace U,
      ∀ c (z : ℍ), e ⟨c, Quotient.mk'' z⟩ = (Quotient.mk (levelSetoid U) (z, rep c) : LevelSpace U) := by
  sorry

/-- At level `K(N)` the components are indexed by `(ℤ/N)^×` ([Milne], Lemma 5.13, p. 57). -/
theorem nonempty_componentsPrincipalEquiv (N : ℕ) (hN : 0 < N) :
    Nonempty (Components (principalLevel N) ≃ (ZMod N)ˣ) := by
  sorry

/-- The determinant image of `K₁(N)` is `ℤ̂^×` for every positive level `N`. -/
theorem map_det_level1 (N : ℕ) (hN : 0 < N) :
    (level1 N).map Matrix.GeneralLinearGroup.det = zhatUnits := by
  sorry

/-- The determinant image of `K₀(N)` is `ℤ̂^×` for every positive level `N`
([Milne], §5, pp. 57–58). -/
theorem map_det_level0 (N : ℕ) (hN : 0 < N) :
    (level0 N).map Matrix.GeneralLinearGroup.det = zhatUnits := by
  sorry

end AdelicExamples.GL2

namespace AdelicExamples.DefiniteQuaternion

open scoped Quaternion

variable {a b : ℚ}

/-- Hasse–Schilling–Maass over `ℚ`: the reduced norms of `ℍ[ℚ, a, b]^×` are all of `ℚ^×` if the
algebra splits at `∞` and `ℚ_{>0}` if it is definite ([Khayutin], §2.3, pp. 15–16). -/
theorem nrd_image (ha : a ≠ 0) (hb : b ≠ 0) (c : ℚ) (hc : c ≠ 0) :
    (∃ x : ℍ[ℚ, a, b], x ≠ 0 ∧ QuaternionAlgebra.normForm _ 0 _ x = c) ↔
      (0 < c ∨ ¬ (a < 0 ∧ b < 0)) := by
  sorry

end AdelicExamples.DefiniteQuaternion

end

end TauCetiRoadmap.AdelicAlgebraicGroups
