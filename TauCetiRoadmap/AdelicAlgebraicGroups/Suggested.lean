import Mathlib
import TauCeti.Algebra.AlgebraicGroup.Hopf.Map
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.BaseChange
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.SimplyConnected.Basic
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.FunctorOfPoints
import TauCeti.Algebra.Quaternion.NormForm
import TauCeti.NumberTheory.NumberField.Global.Adeles.LocallyCompact
import TauCeti.NumberTheory.NumberField.Global.Ideles.Norm.Basic

/-!
# Adelic algebraic groups and arithmetic quotients: headline targets

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for headline milestones; discharging them
finishes neither a layer nor the roadmap.

The targets are restricted and convergent Haar products (AA.0), the integral-model restricted
product comparison (AA.1), homogeneous quotient integration (AA.2), real reduction and general
arithmetic covolume, class-number, finite-volume and compactness theorems (AA.3), semisimple weak
and strong approximation, neat levels and their covering maps, quaternion norm images and compact
abelian Fourier limits (AA.4), and GL₁ logarithmic tori and the upper-half-plane decomposition of
the GL₂ level space (AA.5). The auxiliary definitions have real bodies on Mathlib's and Tau Ceti's
point, character, measure, matrix and quotient carriers. The norm-one subgroup is the intersection
of character-norm kernels, so no Harish-Chandra logarithm is needed to state it.

Tamagawa normalization and restriction of scalars require local gauge measures and finite-image
Artin L-functions absent from the pins. Siegel covering, finite overlap, cusps and Orr–Schnell
containment require compatible rational parabolic, relative-root and Cartan–Siegel data absent
there. Weil-restriction transport requires the coefficient-natural Weil-restriction interface.
The disconnected finite-volume criterion needs the number-field geometric identity-component
subgroup. These statements are deferred until those objects are available; the connected
finite-volume criterion is stated below.

The torsor Hasse principle requires the affine/fppf torsor-class and scalar-extension comparison.
The GL₁ component-class and cohomology identifications require the ray-class comparison and torus
cohomology interfaces; the torus homeomorphism is stated below. The GL₂ Riemann-surface comparison
needs the Fuchsian quotient complex structure. These objects are absent from the pins, so their
targets remain in the README.
-/

namespace TauCetiRoadmap.AdelicAlgebraicGroups

noncomputable section

open MeasureTheory Filter Set
open scoped RestrictedProduct Topology ENNReal NNReal NumberField Matrix Classical TensorProduct

variable (F : Type) [Field F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- The evaluation topology on the native convolution group of points. -/
instance evaluationTopology (R : Type) [CommRing R] [Algebra F R] [TopologicalSpace R] :
    TopologicalSpace (WithConv (H →ₐ[F] R)) :=
  ⨅ h : H, TopologicalSpace.induced (fun x => x.ofConv h) inferInstance

/-- Evaluation of a rational character as a unit-valued group homomorphism. -/
def characterValue {R : Type} [CommRing R] [Algebra F R] (χ : GroupLike F H) :
    WithConv (H →ₐ[F] R) →* Rˣ where
  toFun x := Units.map x.ofConv.toMonoidHom (GroupLike.toUnits F χ)
  map_one' := by
    apply Units.ext
    change (1 : WithConv (H →ₐ[F] R)) (χ : H) = 1
    simp
  map_mul' x y := by
    apply Units.ext
    change (x * y) (χ : H) = x (χ : H) * y (χ : H)
    rw [AlgHom.convMul_apply, χ.isGroupLikeElem_val.comul_eq_tmul_self]
    simp

variable [NumberField F]

/-- Adelic points on the native Hopf-algebra point carrier. -/
abbrev AdelicPoints := WithConv (H →ₐ[F] NumberField.AdeleRing (𝓞 F) F)

/-- The simultaneous kernels of all rational-character norms, namely `G(𝔸_F)^1`. -/
def normOne : Subgroup (AdelicPoints F H) :=
  ⨅ χ : GroupLike F H,
    (TauCeti.GlobalNumberFields.ideleNorm.comp (characterValue F H χ)).ker

/-- The Borel measurable structure for adelic Haar measures. -/
instance adelicBorel : MeasurableSpace (AdelicPoints F H) := borel _

namespace AdelicPoints

/-- Finite adelic points. -/
abbrev FiniteAdelicPoints := WithConv (H →ₐ[F] IsDedekindDomain.FiniteAdeleRing (𝓞 F) F)

/-- Archimedean points. -/
abbrev InfinitePoints := WithConv (H →ₐ[F] NumberField.InfiniteAdeleRing F)

/-- Local points at a finite place. -/
abbrev LocalPoints (v : IsDedekindDomain.HeightOneSpectrum (𝓞 F)) :=
  WithConv (H →ₐ[F] v.adicCompletion F)

/-- The rational diagonal. -/
def diagonal : WithConv (H →ₐ[F] F) →* AdelicPoints F H :=
  TauCeti.AlgHom.mapValue (Algebra.ofId F _)

/-- The finite rational diagonal. -/
def finiteDiagonal : WithConv (H →ₐ[F] F) →* FiniteAdelicPoints F H :=
  TauCeti.AlgHom.mapValue (Algebra.ofId F _)

/-- Projection to the finite component. -/
def finiteProjection : AdelicPoints F H →* FiniteAdelicPoints F H :=
  TauCeti.AlgHom.mapValue (AlgHom.snd F _ _)

/-- Projection to the archimedean component. -/
def infiniteProjection : AdelicPoints F H →* InfinitePoints F H :=
  TauCeti.AlgHom.mapValue (AlgHom.fst F _ _)

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
coordinate ring. The integral generators already form a subgroup. -/
def localPoints (M : IntegralModel F H S) (v : HeightOneSpectrum (𝓞 F)) (_hv : v ∉ S) :
    Subgroup (LocalPoints F H v) :=
  Subgroup.closure {g | ∀ a : M.coordinate,
    g.ofConv (M.baseChangeIso.hom.hom ((1 : F) ⊗ₜ[SIntegers F S] a)) ∈ v.adicCompletionIntegers F}

/-- The restricting subgroups: `𝓗(𝒪_v)` for `v ∉ S` and `G(F_v)` for `v ∈ S`. -/
def level (M : IntegralModel F H S) (v : HeightOneSpectrum (𝓞 F)) : Subgroup (LocalPoints F H v) :=
  if hv : v ∈ S then ⊤ else M.localPoints v hv

/-- `Γ(M,T)` consists of rational points integral on the model's coordinates away from `T`.
It is the image of the model's `𝒪_{F,T}`-points under its generic-fibre identification
([Conrad], Thms 3.4 and 3.6, pp. 5–6; [Milne], §4, pp. 42–43). The generators form a subgroup. -/
def globalPoints (M : IntegralModel F H S) (T : Finset (HeightOneSpectrum (𝓞 F)))
    (_hST : S ⊆ T) : Subgroup (WithConv (H →ₐ[F] F)) :=
  Subgroup.closure {g | ∀ a : M.coordinate,
    g.ofConv (M.baseChangeIso.hom.hom ((1 : F) ⊗ₜ[SIntegers F S] a)) ∈
      (T : Set (HeightOneSpectrum (𝓞 F))).integer F}

/-- Adelic points as a restricted product: coordinate projections give an isomorphism of
topological groups `G(𝔸_{F,f}) ≃ Πʳ v, [G(F_v), B_v]` ([Conrad], Thm 3.6, p. 6). -/
theorem exists_restrictedProductEquiv [Algebra.FiniteType F H] (M : IntegralModel F H S) :
    ∃ e : FiniteAdelicPoints F H ≃ₜ* Πʳ v, [LocalPoints F H v, M.level v],
      ∀ (x : FiniteAdelicPoints F H) (v : HeightOneSpectrum (𝓞 F)) (h : H),
        (e x v).ofConv h = (x.ofConv h) v := by
  sorry

end IntegralModel

namespace Reduction

open AdelicPoints

/-- A rational cocharacter is central on every coefficient algebra. -/
def IsCentralCocharacter (c : H →ₐc[F] LaurentPolynomial F) : Prop :=
  ∀ (R : Type) [CommRing R] [Algebra F R] (t : WithConv (LaurentPolynomial F →ₐ[F] R))
    (g : WithConv (H →ₐ[F] R)),
    Commute (WithConv.toConv (t.ofConv.comp (c : H →ₐ[F] LaurentPolynomial F))) g

/-- The rational intersection with a conjugate of a finite level. -/
def levelArithmetic (x : FiniteAdelicPoints F H) (U : Subgroup (FiniteAdelicPoints F H)) :
    Subgroup (WithConv (H →ₐ[F] F)) :=
  (U.map (MulAut.conj x).toMonoidHom).comap (finiteDiagonal F H)

variable {F H}

/-- An `S`-arithmetic subgroup is commensurable with the global integral group of a model
whose exceptional places lie in `S` ([Milne], §3, p. 33; [Rapinchuk], §2.4, pp. 11–12). -/
def IsSArithmetic (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F)))
    (Γ : Subgroup (WithConv (H →ₐ[F] F))) : Prop :=
  ∃ (S₀ : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F)))
    (M : IntegralModel F H S₀) (hS : S₀ ⊆ S), Γ.Commensurable (M.globalPoints S hS)

/-- The archimedean quotient of a connected reductive group by an arithmetic subgroup has
finite Haar covolume exactly when it has no nontrivial rational character. For a number field
this is Borel–Harish-Chandra applied to restriction of scalars ([Milne], Thm 3.3(a), pp. 33–34).
The split central direction is retained. -/
theorem arithmetic_finite_volume_iff [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F
      ⟨CommHopfAlgCat.of F H, (inferInstance : Algebra.FiniteType F H)⟩)
    (Γ : Subgroup (WithConv (H →ₐ[F] F))) (hΓ : IsSArithmetic ∅ Γ)
    [MeasurableSpace (InfinitePoints F H)] [BorelSpace (InfinitePoints F H)]
    (μ : Measure (InfinitePoints F H)) [μ.IsHaarMeasure] :
    (∃ D : Set (InfinitePoints F H),
      IsFundamentalDomain (Γ.map (TauCeti.AlgHom.mapValue (R := F) (H := H)
        (Algebra.ofId F (NumberField.InfiniteAdeleRing F)))) D μ ∧ μ D < ∞) ↔
        Subsingleton (GroupLike F H) := by
  sorry

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
      Subsingleton (GroupLike F H) := by
  sorry

/-- Compactness criterion: for connected reductive `G`, `G(F)\G(𝔸_F)^1` is compact, that is, a
compact set meets every `G(F)`-orbit of `G(𝔸_F)^1`, exactly when every rational cocharacter is
central (the derived group is anisotropic) ([Borel], Theorem 5.8, p. 22; [Arthur], §4, p. 21). -/
theorem exists_compact_normOne_iff [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F
      ⟨CommHopfAlgCat.of F H, (inferInstance : Algebra.FiniteType F H)⟩) :
    (∃ C : Set (AdelicPoints F H), IsCompact C ∧
        ∀ x ∈ normOne F H, ∃ γ, diagonal F H γ * x ∈ C) ↔
      ∀ c : H →ₐc[F] LaurentPolynomial F, IsCentralCocharacter F H c := by
  sorry

end Reduction

namespace Approximation

open AdelicPoints IsDedekindDomain

/-- Strong approximation away from `∞ ∪ S_f`, expressed by density on the full adeles. -/
def HasStrongApproximation (Sf : Finset (HeightOneSpectrum (𝓞 F))) : Prop :=
  Dense {x : AdelicPoints F H | ∃ g : WithConv (H →ₐ[F] F), ∃ y : AdelicPoints F H,
    (∀ v ∉ Sf, ∀ h : H,
      (finiteProjection F H y).ofConv h v = (1 : FiniteAdelicPoints F H).ofConv h v) ∧
    x = diagonal F H g * y}

/-- Weak approximation at a finite set of infinite and finite places. -/
def HasWeakApproximation (Sinf : Finset (NumberField.InfinitePlace F))
    (Sf : Finset (HeightOneSpectrum (𝓞 F))) : Prop :=
  DenseRange (fun g : WithConv (H →ₐ[F] F) =>
    ((fun w : Sinf => TauCeti.AlgHom.mapValue (Algebra.ofId F w.val.Completion) g),
      fun v : Sf => TauCeti.AlgHom.mapValue (Algebra.ofId F (v.val.adicCompletion F)) g))

/-- Connected semisimple simply connected groups have weak approximation for every finite set of
places ([PR94], Theorem 7.8, p. 415). -/
theorem hasWeakApproximation_of_simplyConnected (G : TauCeti.SemisimpleCommHopfAlgCat F)
    (hsc : TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty F G)
    (Sinf : Finset (NumberField.InfinitePlace F)) (Sf : Finset (HeightOneSpectrum (𝓞 F))) :
    HasWeakApproximation F (G.obj : Type) Sinf Sf := by
  sorry

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

namespace RestrictedHaar

open _root_.RestrictedProduct

variable {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  {B : ∀ i, Subgroup (G i)}

/-- The Borel σ-algebra on a restricted product. -/
instance instMeasurableSpace : MeasurableSpace (Πʳ i, [G i, B i]) := borel _

instance instBorelSpace : BorelSpace (Πʳ i, [G i, B i]) := ⟨rfl⟩

/-- The box `{x | ∀ i, x i ∈ C i}` of a family of subsets `C i ⊆ G i`. -/
def box (C : ∀ i, Set (G i)) : Set (Πʳ i, [G i, B i]) := {x | ∀ i, x i ∈ C i}

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

namespace Neat

open AdelicPoints Reduction

/-- An automorphism of `ℂ^n` is neat if its eigenvalues generate a torsion-free subgroup of `ℂ^×`
([Milne], §3, p. 34). -/
def IsNeatAut {n : ℕ} (α : GL (Fin n) ℂ) : Prop :=
  ∀ z ∈ Subgroup.closure
      {z : ℂˣ | Module.End.HasEigenvalue (Matrix.toLin' (α : Matrix (Fin n) (Fin n) ℂ)) z},
    IsOfFinOrder z → z = 1

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- The complex point action of an algebraic representation. -/
def algebraicPointMap (τ : F →+* ℂ) (n : ℕ)
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H) :
    WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ :=
  (Matrix.GeneralLinearGroup.map τ).comp
    ((TauCeti.GeneralLinear.pointsMulEquiv (R := F) n).toMonoidHom.comp
      (TauCeti.AlgHom.mapDomain r))

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

/-- Neat levels exist: every compact open `U` contains a normal open subgroup of finite index that
is a neat level ([Milne], Proposition 3.5, p. 34). -/
theorem exists_isNeatLevel_le [Algebra.FiniteType F H] (τ : F →+* ℂ) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (hρ : IsFaithfulAlgebraicPointHom τ n ρ)
    (U : Subgroup (FiniteAdelicPoints F H)) (hUc : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    ∃ U' ≤ U, (U'.subgroupOf U).Normal ∧ IsOpen (U' : Set (FiniteAdelicPoints F H)) ∧
      U'.relIndex U ≠ 0 ∧ IsNeatLevel n ρ U' := by
  sorry

end Neat

namespace LevelMaps

open AdelicPoints Reduction

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `K∞ × U ⊂ G(F_∞) × G(𝔸_{F,f}) = G(𝔸_F)`. -/
def levelSubgroup (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :
    Subgroup (AdelicPoints F H) :=
  Kinf.comap (infiniteProjection F H) ⊓ U.comap (finiteProjection F H)


/-- The native double quotient with its quotient topology. -/
abbrev LevelQuotient (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :=
  Quotient (DoubleCoset.setoid ((diagonal F H).range : Set (AdelicPoints F H))
    (levelSubgroup F H U Kinf))

variable {F H}

/-- The map induced by the identity when the finite level shrinks. -/
def levelMap {U U' : Subgroup (FiniteAdelicPoints F H)} (h : U' ≤ U)
    (Kinf : Subgroup (InfinitePoints F H)) :
    LevelQuotient F H U' Kinf → LevelQuotient F H U Kinf :=
  Quotient.map' id (by
    intro x y hxy
    obtain ⟨a, ha, b, hb, hab⟩ := DoubleCoset.rel_iff.mp hxy
    exact DoubleCoset.rel_iff.mpr ⟨a, ha, b, ⟨hb.1, h hb.2⟩, hab⟩)

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
      finiteProjection F H x = 1 ∧ x ∈ normOne F H})
    (hKH : ∀ y : AdelicPoints F H, ∃ x : AdelicPoints F H, infiniteProjection F H x ∈ Kinf ∧
      finiteProjection F H x = 1 ∧ ∀ χ : GroupLike F H,
        TauCeti.GlobalNumberFields.ideleNorm (characterValue F H χ x) =
          TauCeti.GlobalNumberFields.ideleNorm (characterValue F H χ y)) :
    IsCoveringMap (levelMap h Kinf) ∧
      ∀ y, Nat.card (levelMap h Kinf ⁻¹' {y}) = U'.relIndex U := by
  sorry

end LevelMaps

namespace QuaternionNorms

open scoped Quaternion

/-- Hasse–Schilling–Maass: quaternion reduced norms over any number field are exactly the
nonzero elements positive at the ramified real places (AA.4.6; [Platonov–Rapinchuk–Rapinchuk],
Theorem 1.34, pp. 43–44). Every quaternion algebra in characteristic zero has such a presentation. -/
theorem nrd_image (F : Type) [Field F] [NumberField F] {a b : F}
    (ha : a ≠ 0) (hb : b ≠ 0) (c : F) (hc : c ≠ 0) :
    (∃ x : ℍ[F, a, b]ˣ, QuaternionAlgebra.normForm a 0 b (x : ℍ[F, a, b]) = c) ↔
      ∀ τ : F →+* ℝ, τ a < 0 → τ b < 0 → 0 < τ c := by
  sorry

end QuaternionNorms

/-- Idele classes modulo squares are compact Hausdorff: the square image is closed and the
noncompact norm direction disappears (AA.4.6; [Khayutin], proof of Proposition 3.6, p. 25). -/
theorem compactSpace_ideleClassGroup_quotient_squares (F : Type) [Field F] [NumberField F] :
    IsClosed (Set.range fun x : NumberField.IdeleClassGroup (𝓞 F) F => x ^ 2) ∧
      CompactSpace (NumberField.IdeleClassGroup (𝓞 F) F ⧸
        Subgroup.closure (Set.range fun x : NumberField.IdeleClassGroup (𝓞 F) F => x ^ 2)) ∧
      T2Space (NumberField.IdeleClassGroup (𝓞 F) F ⧸
        Subgroup.closure (Set.range fun x : NumberField.IdeleClassGroup (𝓞 F) F => x ^ 2)) := by
  sorry

namespace CompactFourier

variable {C : Type*} [CommGroup C] [TopologicalSpace C] [IsTopologicalGroup C]
  [CompactSpace C] [T2Space C] [SecondCountableTopology C] [MeasurableSpace C] [BorelSpace C]

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

namespace AdelicExamples.GL1

open _root_.NumberField IsDedekindDomain AdelicPoints

variable (F : Type) [Field F] [NumberField F]

/-- `U_Q = K_∞ × ∏_v U_{Q,v}`: trivial at real places, the unit circle at complex places, `𝒪_v^×`
for `v ∉ Q` and the `p^n`-th powers of `𝒪_v^×` for `v ∈ Q`. -/
def levelQ (Q : Finset (HeightOneSpectrum (𝓞 F))) (p n : ℕ) : Subgroup (IdeleGroup (𝓞 F) F) :=
  Subgroup.closure {x |
    (∀ w : InfinitePlace F, w.IsReal → (x : AdeleRing (𝓞 F) F).1 w = 1) ∧
    (∀ w : InfinitePlace F, w.IsComplex → ‖(x : AdeleRing (𝓞 F) F).1 w‖ = 1) ∧
    (∀ v, v ∉ Q → (x : AdeleRing (𝓞 F) F).2 v ∈ v.adicCompletionIntegers F ∧
      ((x⁻¹ : IdeleGroup (𝓞 F) F) : AdeleRing (𝓞 F) F).2 v ∈ v.adicCompletionIntegers F) ∧
    (∀ v ∈ Q, ∃ y : (v.adicCompletionIntegers F)ˣ,
      (x : AdeleRing (𝓞 F) F).2 v = ((y ^ (p ^ n) : (v.adicCompletionIntegers F)ˣ) :
        v.adicCompletion F))}

/-- The real number `t` in the completion `F_w`. -/
def archComponent (t : ℝ) (w : InfinitePlace F) : w.Completion :=
  if hw : w.IsReal then (InfinitePlace.Completion.ringEquivRealOfIsReal hw).symm t
  else (InfinitePlace.Completion.ringEquivComplexOfIsComplex
    (InfinitePlace.not_isReal_iff_isComplex.mp hw)).symm (t : ℂ)

/-- The positive real scalars supported diagonally at all archimedean places. -/
def posRealsDiag : Subgroup (IdeleGroup (𝓞 F) F) :=
  Subgroup.closure {x | ∃ t : ℝ, 0 < t ∧
    (x : AdeleRing (𝓞 F) F).2 = 1 ∧
    ∀ w, (x : AdeleRing (𝓞 F) F).1 w = archComponent F t w}

/-- `X_Q = F^×\𝔸_F^×/U_Q A_∞^0`, with the quotient topology. -/
abbrev XQ (Q : Finset (HeightOneSpectrum (𝓞 F))) (p n : ℕ) :=
  IdeleGroup (𝓞 F) F ⧸ (IdeleGroup.principalSubgroup (𝓞 F) F ⊔ levelQ F Q p n ⊔ posRealsDiag F)

/-- Every connected component of `X_Q` is a compact torus of dimension `r₁ + r₂ − 1` ([CG], §8.2,
pp. 78–79). -/
theorem nonempty_connectedComponent_homeomorph (Q : Finset (HeightOneSpectrum (𝓞 F))) (p n : ℕ)
    [Fact p.Prime] (hn : 1 ≤ n) (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) (x : XQ F Q p n) :
    Nonempty (connectedComponent x ≃ₜ (Fin (Units.rank F) → AddCircle (1 : ℝ))) := by
  sorry

end AdelicExamples.GL1

namespace AdelicExamples.GL2

open scoped MatrixGroups UpperHalfPlane
open Matrix

/-- The finite adeles of `ℚ`. -/
abbrev Af := IsDedekindDomain.FiniteAdeleRing ℤ ℚ

/-- The diagonal embedding `GL₂(ℚ) → GL₂(𝔸_f)`. -/
def diag : GL (Fin 2) ℚ →* GL (Fin 2) Af := Matrix.GeneralLinearGroup.map (algebraMap ℚ Af)

/-- Rational matrices as real matrices. -/
def toReal : GL (Fin 2) ℚ →* GL (Fin 2) ℝ := Matrix.GeneralLinearGroup.map (Rat.castHom ℝ)

/-- `Γ_{g,U} = GL₂(ℚ)^+ ∩ gUg⁻¹`, with `GL₂(ℚ)` embedded diagonally. -/
def componentGroup (U : Subgroup (GL (Fin 2) Af)) (g : GL (Fin 2) Af) : Subgroup (GL (Fin 2) ℚ) :=
  GLPos (Fin 2) ℚ ⊓ (U.map (MulAut.conj g).toMonoidHom).comap diag

/-- The image of `Γ_{g,U}` in `GL₂(ℝ)`, acting on `ℍ` by Möbius transformations. -/
def componentGroupReal (U : Subgroup (GL (Fin 2) Af)) (g : GL (Fin 2) Af) :
    Subgroup (GL (Fin 2) ℝ) :=
  (componentGroup U g).map toReal

variable {U : Subgroup (GL (Fin 2) Af)}

/-- `GL₂(ℚ)^+`, embedded diagonally in `GL₂(𝔸_f)`. -/
def ratPos : Subgroup (GL (Fin 2) Af) := (GLPos (Fin 2) ℚ).map diag

/-- The components `GL₂(ℚ)^+\GL₂(𝔸_f)/U`. -/
abbrev Components (U : Subgroup (GL (Fin 2) Af)) :=
  DoubleCoset.Quotient (ratPos : Set (GL (Fin 2) Af)) U

/-- `(z, a) ∼ (q z, q a u)` for `q ∈ GL₂(ℚ)^+` and `u ∈ U`. -/
def levelSetoid (U : Subgroup (GL (Fin 2) Af)) : Setoid (ℍ × GL (Fin 2) Af) :=
  Relation.EqvGen.setoid fun x y =>
    ∃ q ∈ GLPos (Fin 2) ℚ, ∃ u ∈ U, y.1 = toReal q • x.1 ∧ y.2 = diag q * x.2 * u

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

end AdelicExamples.GL2

end

end TauCetiRoadmap.AdelicAlgebraicGroups
