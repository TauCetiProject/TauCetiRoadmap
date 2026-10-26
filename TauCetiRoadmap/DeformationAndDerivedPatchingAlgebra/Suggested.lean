import Mathlib
import TauCeti.Algebra.Homology.LinearHomComplex.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Basic

/-!
# Deformation and derived patching algebra: headline theorems

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements give Lean forms for headline results; discharging them
finishes neither a layer nor the roadmap.

The statements cover formal presentations and flat completion (§§1.9, 1.13),
Auslander–Buchsbaum, Lescot's criterion, finite actions, top local cohomology and
Hilbert–Samuel theory (§§3.1–3.3, 3.7, 3.11–3.13), integral points (§4.2),
balanced and free-module patching (§§5.5–5.6), uniformizer cycle specialization and
CI parafactoriality (§§6.7, 6.9), minimal representatives (§§7.3, 7.5),
and codimension, CM concentration and regular-source canonical duals (§§9.2–9.3).
Finite projective representatives express Tor amplitude on native cochain complexes;
regular-base CM concentration is expressed by native local cohomology. Residue Ext
defines the depth used in Auslander–Buchsbaum and the CM-base action theorem.

The hull equation bound (§2.5) needs labelled Artinian coefficient categories, hulls
and complete socle obstruction theories, absent from the pins. The complete patch
and its duality functor (§§8.4–8.6, 9.3) need decorated perfect systems and compatible
actions, and normalized dualizing complexes for the canonical comparison; these
carriers are also absent. Cycle specialization is stated coefficientwise using native
localized lengths, as a form of PadicLocalLanglandsForGL2Qp §0.5's agreement theorem, and the
Hilbert–Samuel polynomial is that section's; parafactoriality uses native invertible sheaves and a chosen
regular presentation of the completion. Paired spectral support and survival (§§9.4–9.7) additionally need derived coefficient-action and isolated-block
comparisons. These headline statements are deferred until those mathematical
objects and constructions exist; coefficient-support equalities do not substitute
for the spectral support theorem.

Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a;
Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.
Cochains have C[n]^i = C^(i+n); a module in degree b is M[-b].
-/

noncomputable section
universe u v w
open IsLocalRing CategoryTheory CategoryTheory.Limits
open scoped Pointwise TensorProduct ZeroObject
attribute [local instance] HasDerivedCategory.standard

namespace TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

variable (A : Type u) [CommRing A]
variable (M : Type v) [AddCommGroup M] [Module A M]

/-! ## Definitions used in the headline statements -/

/-- Native derived module objects. -/
abbrev Der (R : Type u) [CommRing R] := DerivedCategory (ModuleCat.{u} R)

/-- Native integer-indexed cochain complexes. -/
abbrev Cpx (R : Type u) [CommRing R] := CochainComplex (ModuleCat.{u} R) ℤ

/-- Cohomology in the native module category. -/
abbrev H {R : Type u} [CommRing R] (i : ℤ) (C : Der R) :=
  (DerivedCategory.homologyFunctor (ModuleCat R) i).obj C

/-- A square finite presentation permits zero generators and does not require injectivity. -/
def HasSquarePresentation (S : Type*) [Ring S]
    (N : Type*) [AddCommGroup N] [Module S N] : Prop :=
  ∃ d : ℕ, ∃ f : (Fin d → S) →ₗ[S] (Fin d → S),
    ∃ g : (Fin d → S) →ₗ[S] N,
      Function.Surjective g ∧ LinearMap.range f = LinearMap.ker g

/-- Complex support is the union of the supports of its native cohomology modules. -/
def derivedSupport {R : Type u} [CommRing R] (C : Der R) : Set (PrimeSpectrum R) :=
  ⋃ i : ℤ, Module.support R (H i C)

/-- The finite Taylor–Wiles group ring at the positive level n + 1. -/
abbrev PatchingGroupRing (O : Type u) [CommRing O] (p q n : ℕ) :=
  MonoidAlgebra O (Multiplicative (Fin q → ZMod (p ^ (n + 1))))

/-- The cumulative length of PadicLocalLanglandsForGL2Qp §0.5, using I^(n+1); finiteness is a
separate hypothesis. -/
def hilbertSamuelFunction (I : Ideal A) (n : ℕ) : ℕ∞ :=
  Module.length A (M ⧸ (I ^ (n + 1) • (⊤ : Submodule A M)))

/-- Extract d! times coefficient d. On the eventual length polynomial this is the
dimension-normalized multiplicity of PadicLocalLanglandsForGL2Qp §0.5 at the bound d. -/
def multiplicityCoefficient (d : ℕ) (P : Polynomial ℚ) : ℚ :=
  (Nat.factorial d : ℚ) * P.coeff d

/-- Formal unmixedness tests all associated primes of the maximal-adic completion. -/
def FormallyUnmixed [IsLocalRing A] : Prop :=
  ∀ p ∈ associatedPrimes
    (AdicCompletion (maximalIdeal A) A) (AdicCompletion (maximalIdeal A) A),
    ringKrullDim ((AdicCompletion (maximalIdeal A) A) ⧸ p) = ringKrullDim A

/-- Minimality on native cochains applies to finite free and complete flat models, without bounds. -/
def IsMinimal {R : Type u} [CommRing R] [IsLocalRing R] (P : Cpx R) : Prop :=
  ∀ i : ℤ, LinearMap.range (P.d i (i + 1)).hom ≤
    maximalIdeal R • (⊤ : Submodule R (P.X (i + 1)))

/-- A complete flat complex has bounded terms, each flat, separated and maximal-adically complete. -/
def CompleteFlatComplex {R : Type u} [CommRing R] [IsLocalRing R] (P : Cpx R) : Prop :=
  (∃ a b : ℤ, ∀ i : ℤ, i < a ∨ b < i → IsZero (P.X i)) ∧
    ∀ i : ℤ, Module.Flat R (P.X i) ∧ IsAdicComplete (maximalIdeal R) (P.X i)

/-- Depth as the least degree of nonzero residue Ext, with value infinity if all vanish. -/
def residueExtDepth [IsLocalRing A] (N : Type u) [AddCommGroup N] [Module A N] : ℕ∞ :=
  ⨅ n : ℕ, ⨅ (_ : Nontrivial (CategoryTheory.Abelian.Ext
    (ModuleCat.of A (ResidueField A)) (ModuleCat.of A N) n)), (n : ℕ∞)

/-- The scalar relations at positive group level n + 1. -/
def patchingRelations (O : Type u) [CommRing O] (p r n : ℕ) :
    Ideal (MvPowerSeries (Fin r) O) :=
  Ideal.span (Set.range fun i : Fin r =>
    (1 + MvPowerSeries.X i : MvPowerSeries (Fin r) O) ^ (p ^ (n + 1)) - 1)

/-- The augmentation ideal of the formal scalar variables. -/
def patchingAugmentation (O : Type u) [CommRing O] (r : ℕ) :
    Ideal (MvPowerSeries (Fin r) O) :=
  Ideal.span (Set.range fun i : Fin r => (MvPowerSeries.X i : MvPowerSeries (Fin r) O))

/-- Native module length at a prime, before any finite-length conversion: the coefficient of the
module cycles of PadicLocalLanglandsForGL2Qp §0.5. -/
def localizedLength (p : PrimeSpectrum A) : ℕ∞ :=
  Module.length (Localization.AtPrime p.asIdeal) (LocalizedModule p.asIdeal.primeCompl M)

/-! ## Formal presentations and local algebra -/

/-- Cotangent generators and a surjective residue map make the chosen series map surjective. -/
theorem seriesPresentation_surjective
    [IsLocalRing A] [IsNoetherianRing A] [IsAdicComplete (maximalIdeal A) A]
    {B : Type u} [CommRing B] [IsLocalRing B] [IsNoetherianRing B]
    [IsAdicComplete (maximalIdeal B) B]
    (r : ℕ) (f : MvPowerSeries (Fin r) A →+* B) [IsLocalHom f]
    (hresidue : ∀ b : B, ∃ a : A, b - f (MvPowerSeries.C a) ∈ maximalIdeal B)
    (hcotangent : maximalIdeal B ≤
      (maximalIdeal B) ^ 2 ⊔ (maximalIdeal A).map (f.comp MvPowerSeries.C) ⊔
        Ideal.span (Set.range (fun i : Fin r => f (MvPowerSeries.X i)))) :
    Function.Surjective f := by
  sorry

/-- Flat scalar extension commutes with completion on finite modules over a Noetherian base. -/
theorem flatCompletion_finiteComparison
    [IsNoetherianRing A] [Module.Finite A M]
    {S : Type u} [CommRing S] [Algebra A S] [Module.Flat A S] (I : Ideal A) :
    ∃ e : (M ⊗[A] AdicCompletion I S) ≃ₗ[A] AdicCompletion I (M ⊗[A] S),
      ∀ (m : M) (s : S), e (m ⊗ₜ[A] AdicCompletion.of I S s) =
        AdicCompletion.of I (M ⊗[A] S) (m ⊗ₜ[A] s) := by
  sorry

/-- Auslander–Buchsbaum for every nonzero finite module of finite projective dimension. -/
theorem auslanderBuchsbaum [IsLocalRing A] [IsNoetherianRing A]
    (N : Type u) [AddCommGroup N] [Module A N] [Module.Finite A N] [Nontrivial N]
    (hpd : CategoryTheory.projectiveDimension (ModuleCat.of A N) < ⊤) :
    CategoryTheory.projectiveDimension (ModuleCat.of A N) +
      (residueExtDepth A N : WithBot ℕ∞) = (residueExtDepth A A : WithBot ℕ∞) := by
  sorry

/-- The finite-pd module version keeps nonzeroness and the quotient direction. -/
theorem lescot_module_regular_iff (N : Type u) [AddCommGroup N] [Module A N]
    [IsLocalRing A] [IsNoetherianRing A]
    [Module.Finite A N] [Nontrivial N]
    (hpd : CategoryTheory.projectiveDimension (ModuleCat.of A N) < ⊤) :
    IsRegularLocalRing A ↔ ∃ n : ℕ,
      ∃ x : CategoryTheory.Abelian.Ext
        (ModuleCat.of A (ResidueField A)) (ModuleCat.of A N) n,
      x.comp (CategoryTheory.Abelian.Ext.mk₀ (ModuleCat.ofHom
        ((maximalIdeal A • (⊤ : Submodule A N)).mkQ))) (Nat.add_zero n) ≠ 0 := by
  sorry

/-- A finite projective base module forces finiteness and faithfulness over an equal-dimensional domain. -/
theorem finiteProjectiveFaithful_of_equalDimensionDomains
    [IsNoetherianRing A] [IsDomain A]
    {D : Type u} [CommRing D] [IsNoetherianRing D] [IsDomain D] [Algebra A D]
    [Module D M] [IsScalarTower A D M] [Nontrivial M]
    [Module.Finite A M] [Module.Projective A M]
    (d : ℕ) (hA : ringKrullDim A = d) (hD : ringKrullDim D = d) :
    Module.Finite A D ∧ FaithfulSMul D M ∧
      (IsRegularRing A → IsRegularRing D → Module.Projective D M) := by
  sorry

/-- Top local cohomology of a nonzero finite module occurs exactly at its support dimension. -/
theorem localCohomology_top_nonzero
    (N : Type u) [AddCommGroup N] [Module A N]
    [IsLocalRing A] [IsNoetherianRing A] [Module.Finite A N] [Nontrivial N]
    (d : ℕ) (hd : Module.supportDim A N = (d : WithBot ℕ∞)) :
    (∀ i : ℕ, d < i → CategoryTheory.Limits.IsZero
      ((localCohomology (maximalIdeal A) i).obj (ModuleCat.of A N))) ∧
      ¬ CategoryTheory.Limits.IsZero
        ((localCohomology (maximalIdeal A) d).obj (ModuleCat.of A N)) := by
  sorry

/-- The unique eventual polynomial of PadicLocalLanglandsForGL2Qp §0.5 at the given ideal and
module has degree the support dimension, where its normalized coefficient is a positive integer. -/
theorem hilbertSamuel_polynomial
    [IsLocalRing A] [IsNoetherianRing A] [Module.Finite A M] [Nontrivial M]
    (I : Ideal A) (hI : I ≤ maximalIdeal A)
    (hfinite : Module.length A (M ⧸ (I • (⊤ : Submodule A M))) ≠ ⊤)
    (d : ℕ) (hd : Module.supportDim A M = (d : WithBot ℕ∞)) :
    ∃! P : Polynomial ℚ,
      (∃ N : ℕ, ∀ n : ℕ, N ≤ n →
        ∃ t : ℕ, hilbertSamuelFunction A M I n = t ∧ P.eval (n : ℚ) = (t : ℚ)) ∧
      P.natDegree = d ∧ ∃ e : ℕ, 0 < e ∧ multiplicityCoefficient d P = (e : ℚ) := by
  sorry

/-- An eventual cumulative polynomial fixes multiplicity in all characteristics. -/
theorem multiplicityOne_regular [IsLocalRing A] [IsNoetherianRing A]
    (d : ℕ) (hd : ringKrullDim A = d) (P : Polynomial ℚ)
    (hP : ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
      ∃ t : ℕ, hilbertSamuelFunction A A (maximalIdeal A) n = t ∧
        P.eval (n : ℚ) = (t : ℚ)) :
    IsRegularLocalRing A ↔ FormallyUnmixed A ∧ multiplicityCoefficient d P = 1 := by
  sorry

/-- A nonempty generic fibre has a point in a finite extension and its integral closure; characteristic zero ensures finite normalization. -/
theorem exists_integral_point_of_not_nilpotent
    {O K B Ω : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field K] [CharZero K] [Algebra O K] [IsFractionRing O K]
    [Field Ω] [Algebra K Ω] [Algebra O Ω] [IsScalarTower O K Ω] [IsAlgClosed Ω]
    [CommRing B] [IsLocalRing B] [Algebra O B] [Module.Finite O B]
    [IsLocalHom (algebraMap O B)] (π : O) (hπ : Irreducible π)
    (h : ¬ IsNilpotent (algebraMap O B π)) :
    ∃ E : IntermediateField K Ω, Module.Finite K E ∧
      (letI : Algebra O E := ((algebraMap K E).comp (algebraMap O K)).toAlgebra;
       Module.Finite O (integralClosure O E) ∧
         ∃ f : B →ₐ[O] integralClosure O E, IsLocalHom f.toRingHom) := by
  sorry

/-! ## Module patching -/

/-- Balanced finite-level modules with compatible scalar images and augmentation give a free
specialized module over the deformation quotient. -/
theorem balanced_module_patching
    (p q : ℕ) [Fact p.Prime] (hp : 3 ≤ p) (hq : 1 ≤ q)
    (O R : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (maximalIdeal O) O] [Finite (ResidueField O)]
    [Algebra ℤ_[p] O] [Module.Finite ℤ_[p] O] [CharZero O]
    [CharP (ResidueField O) p]
    [CommRing R] [IsLocalRing R] [IsNoetherianRing R] [Algebra O R]
    [IsLocalHom (algebraMap O R)] [IsAdicComplete (maximalIdeal R) R]
    (H₀ : Type u) [AddCommGroup H₀] [Module O H₀] [Module R H₀]
    [IsScalarTower O R H₀] [Module.Finite O H₀] [Module.Finite R H₀]
    (X : ℕ → Type u) [∀ n, AddCommGroup (X n)]
    [∀ n, Module O (X n)] [∀ n, Module (PatchingGroupRing O p q n) (X n)]
    [∀ n, IsScalarTower O (PatchingGroupRing O p q n) (X n)]
    (hfinite : ∀ n, Module.Finite (PatchingGroupRing O p q n) (X n))
    (hbalanced : ∀ n, HasSquarePresentation (PatchingGroupRing O p q n) (X n))
    (φ : ℕ → MvPowerSeries (Fin (q - 1)) O →ₐ[O] R)
    (hφ : ∀ n, Function.Surjective (φ n))
    (hlocal : ∀ n, IsLocalHom (φ n).toRingHom)
    (α : ∀ n, MvPowerSeries (Fin (q - 1)) O →ₐ[O]
      Module.End (PatchingGroupRing O p q n) (X n))
    (ψ : ∀ n, X n →ₗ[O] H₀) (hψ : ∀ n, Function.Surjective (ψ n))
    (hequiv : ∀ n a x, ψ n (α n a x) = φ n a • ψ n x)
    (hcoinvariants : ∀ n, LinearMap.ker (ψ n) =
      ((RingHom.ker (MonoidAlgebra.lift O O
        (Multiplicative (Fin q → ZMod (p ^ (n + 1)))) 1).toRingHom) •
          (⊤ : Submodule (PatchingGroupRing O p q n) (X n))).restrictScalars O)
    (hscalar : ∀ n (s : PatchingGroupRing O p q n), ∃ a, ∀ x : X n,
      s • x = α n a x)
    (haugmentation : ∀ n (s : PatchingGroupRing O p q n),
      s ∈ RingHom.ker (MonoidAlgebra.lift O O
        (Multiplicative (Fin q → ZMod (p ^ (n + 1)))) 1).toRingHom →
      ∃ a ∈ RingHom.ker (φ n).toRingHom, ∀ x : X n, s • x = α n a x) :
    Module.Free R H₀ := by
  sorry

/-- Independent finite-level free modules identify the deformation quotient with its
faithful action image and give freeness and a complete-intersection presentation. -/
theorem patching_surjection_iso
    (p r s : ℕ) [Fact p.Prime] (hs : 0 < s)
    (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (maximalIdeal O) O] [Finite (ResidueField O)]
    [CharP (ResidueField O) p]
    (R T : Type u) [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (maximalIdeal R) R] [Algebra O R]
    [IsLocalHom (algebraMap O R)] [CommRing T] [Algebra O T]
    (f : R →ₐ[O] T) (hf : Function.Surjective f)
    (N : Type u) [AddCommGroup N] [Module O N] [Module R N] [Module T N]
    [IsScalarTower O R N] [IsScalarTower O T N]
    [Module.Finite O N] [Nontrivial N] [FaithfulSMul T N]
    (hcompat : ∀ a : R, ∀ x : N, a • x = f a • x)
    (X : ℕ → Type u) [∀ n, AddCommGroup (X n)]
    [∀ n, Module O (X n)] [∀ n, Module (MvPowerSeries (Fin r) O) (X n)]
    [∀ n, IsScalarTower O (MvPowerSeries (Fin r) O) (X n)]
    (hfinite : ∀ n, Module.Finite (MvPowerSeries (Fin r) O) (X n))
    (ι : ℕ → MvPowerSeries (Fin r) O →ₐ[O] MvPowerSeries (Fin r) O)
    (hι : ∀ n, IsLocalHom (ι n).toRingHom)
    (ψ : ℕ → MvPowerSeries (Fin r) O →ₐ[O] R)
    (hψ : ∀ n, Function.Surjective (ψ n))
    (hψlocal : ∀ n, IsLocalHom (ψ n).toRingHom)
    (hkill : ∀ n (i : Fin r), ψ n (ι n (MvPowerSeries.X i)) = 0)
    (e : ∀ n, X n ≃ₗ[O]
      (Fin s → MvPowerSeries (Fin r) O ⧸ patchingRelations O p r n))
    (he : ∀ n (a : MvPowerSeries (Fin r) O) (x : X n),
      e n (ι n a • x) = a • e n x)
    (η : ∀ n, X n →ₗ[O] N) (hη : ∀ n, Function.Surjective (η n))
    (hηlinear : ∀ n (a : MvPowerSeries (Fin r) O) (x : X n),
      η n (a • x) = ψ n a • η n x)
    (haugmentation : ∀ n, LinearMap.ker (η n) =
      (((patchingAugmentation O r).map (ι n).toRingHom) •
        (⊤ : Submodule (MvPowerSeries (Fin r) O) (X n))).restrictScalars O) :
    Function.Bijective f ∧ Module.Free R N ∧ FaithfulSMul R N ∧
      Module.Free T N ∧ Module.Finite O T ∧ Module.Free O T ∧
      Module.finrank O N = s ∧
      ∃ g : Fin r → MvPowerSeries (Fin r) O,
        (∀ i, g i ∈ maximalIdeal (MvPowerSeries (Fin r) O)) ∧
        RingTheory.Sequence.IsRegular (MvPowerSeries (Fin r) O) (List.ofFn g) ∧
        Nonempty (T ≃ₐ[O] (MvPowerSeries (Fin r) O ⧸ Ideal.span (Set.range g))) := by
  sorry

/-! ## Specialization cycles and parafactoriality -/

/-- The coefficientwise form, at each special generic point, of the agreement of
PadicLocalLanglandsForGL2Qp §0.5's uniformizer specialization of module cycles with the cycle of
the special fibre. The generic coefficients are lengths over local rings, including nonreduced
rings. -/
theorem moduleCycle_specialization_coeff
    [IsLocalRing A] [IsNoetherianRing A] [IsAdicComplete (maximalIdeal A) A]
    [Module.Finite A M]
    (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (maximalIdeal O) O]
    [Algebra O A] [IsLocalHom (algebraMap O A)] [Module.Flat O A]
    [Module O M] [IsScalarTower O A M] [Module.Flat O M]
    (π : O) (hπ : Irreducible π) (d : ℕ)
    (hequidim : ∀ p : PrimeSpectrum A, p.asIdeal ∈ minimalPrimes A →
      ringKrullDim (A ⧸ p.asIdeal) = (d + 1 : ℕ))
    (q : PrimeSpectrum A) (hπq : algebraMap O A π ∈ q.asIdeal)
    (hq : ringKrullDim (A ⧸ q.asIdeal) = d) :
    localizedLength A (QuotSMulTop (algebraMap O A π) M) q ≠ ⊤ ∧
      localizedLength A (QuotSMulTop (algebraMap O A π) M) q =
        ∑ᶠ p : {p : PrimeSpectrum A // p.asIdeal ∈ minimalPrimes A},
          localizedLength A M p.1 *
            localizedLength A
              (QuotSMulTop (algebraMap O A π) (A ⧸ p.1.asIdeal)) q := by
  sorry

/-- Every line bundle on the punctured spectrum of a local complete intersection
of dimension at least four is trivial. The completion presentation is explicit. -/
theorem localCI_parafactorial [IsLocalRing A] [IsNoetherianRing A]
    (Q : Type u) [CommRing Q] [IsRegularLocalRing Q]
    (xs : List Q) (hxs : RingTheory.Sequence.IsRegular Q xs)
    (e : AdicCompletion (maximalIdeal A) A ≃+* Q ⧸ Ideal.ofList xs)
    (hdim : 4 ≤ ringKrullDim A)
    (U : (AlgebraicGeometry.Spec (CommRingCat.of A)).Opens)
    (hU : ∀ x : PrimeSpectrum A, x ∈ U ↔ x.asIdeal ≠ maximalIdeal A)
    (L : TauCeti.AlgebraicGeometry.InvertibleSheaf (U : AlgebraicGeometry.Scheme)) :
    Nonempty (L ≅ TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial
      (U : AlgebraicGeometry.Scheme)) := by
  sorry

/-! ## Minimal representatives -/

/-- A bounded-above finite free complex admits a minimal finite free homotopy representative. -/
theorem minimal_finiteFree_representative
    {R : Type u} [CommRing R] [IsLocalRing R] (P : Cpx R)
    (hfinite : ∀ i : ℤ, Module.Finite R (P.X i) ∧ Module.Free R (P.X i))
    (b : ℤ) (hbound : ∀ i : ℤ, b < i → IsZero (P.X i)) :
    ∃ Q : Cpx R, IsMinimal Q ∧
      (∀ i : ℤ, Module.Finite R (Q.X i) ∧ Module.Free R (Q.X i)) ∧
      (∀ i : ℤ, b < i → IsZero (Q.X i)) ∧ Nonempty (HomotopyEquiv P Q) := by
  sorry

/-- A bounded complete flat complex admits a minimal deformation retract in the same term interval. -/
theorem completeFlat_minimal_retract
    {R : Type u} [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (maximalIdeal R) R] (P : Cpx R) (hP : CompleteFlatComplex P)
    (a b : ℤ) (hbound : ∀ j : ℤ, j < a ∨ b < j → IsZero (P.X j)) :
    ∃ (Q : Cpx R) (i : Q ⟶ P) (s : P ⟶ Q),
      CompleteFlatComplex Q ∧ IsMinimal Q ∧
      (∀ j : ℤ, j < a ∨ b < j → IsZero (Q.X j)) ∧
      i ≫ s = 𝟙 Q ∧ Nonempty (Homotopy (s ≫ i) (𝟙 P)) := by
  sorry

/-! ## Codimension, concentration and canonical duals -/

/-- Over a regular local ring, a nonzero finite-projective interval has support of codimension at most its width. -/
theorem codimension_amplitude_inequality
    {R : Type u} [CommRing R] [IsRegularLocalRing R]
    (C : Der R) (n l : ℕ) (a : ℤ)
    (hdim : ringKrullDim R = (n : WithBot ℕ∞)) (hl : l ≤ n)
    (hC : ¬ IsZero C) (P : Cpx R)
    (hbound : ∀ i, i < a ∨ a + l < i → IsZero (P.X i))
    (hfinite : ∀ i, Module.Finite R (P.X i) ∧ Module.Projective R (P.X i))
    (e : DerivedCategory.Q.obj P ≅ C) :
    ∃ p : PrimeSpectrum R, p ∈ derivedSupport C ∧
      (n - l : WithBot ℕ∞) ≤ ringKrullDim (R ⧸ p.asIdeal) := by
  sorry

/-- The matching support bound forces top-degree concentration with the predicted projective and support dimensions. -/
theorem balanced_dimension_concentration
    {R : Type u} [CommRing R] [IsRegularLocalRing R]
    (C : Der R) (n l : ℕ) (a : ℤ)
    (hdim : ringKrullDim R = (n : WithBot ℕ∞)) (hl : l ≤ n)
    (hC : ¬ IsZero C) (P : Cpx R)
    (hbound : ∀ i, i < a ∨ a + l < i → IsZero (P.X i))
    (hfinite : ∀ i, Module.Finite R (P.X i) ∧ Module.Projective R (P.X i))
    (e : DerivedCategory.Q.obj P ≅ C)
    (hsupport : ∀ p ∈ derivedSupport C,
      ringKrullDim (R ⧸ p.asIdeal) ≤ (n - l : WithBot ℕ∞)) :
    (∀ i : ℤ, i ≠ a + l → IsZero (H i C)) ∧ ¬ IsZero (H (a + l) C) ∧
      CategoryTheory.projectiveDimension (H (a + l) C) = l ∧
      Module.supportDim R (H (a + l) C) = (n - l : WithBot ℕ∞) ∧
      (∀ j : ℕ, j ≠ n - l → IsZero
        ((localCohomology (maximalIdeal R) j).obj (H (a + l) C))) ∧
      ¬ IsZero ((localCohomology (maximalIdeal R) (n - l)).obj (H (a + l) C)) := by
  sorry

/-- The Cohen–Macaulay base theorem retains a genuine scalar-compatible derived action;
the top cohomology is maximal Cohen–Macaulay over the acting local ring. -/
theorem cohenMacaulay_action_concentration
    (S R : Type u) [CommRing S] [IsLocalRing S] [IsNoetherianRing S]
    [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [Algebra S R] [IsLocalHom (algebraMap S R)]
    (d l : ℕ) (a : ℤ) (hl : l ≤ d)
    (hdim : ringKrullDim S = d) (hCM : residueExtDepth S S = d)
    (hR : ringKrullDim R ≤ (d - l : WithBot ℕ∞))
    (C : Der S) (hC : ¬ IsZero C) (P : Cpx S)
    (hbound : ∀ i, i < a ∨ a + l < i → IsZero (P.X i))
    (hfinite : ∀ i, Module.Finite S (P.X i) ∧ Module.Projective S (P.X i))
    (e : DerivedCategory.Q.obj P ≅ C) (ρ : R →ₐ[S] End C)
    (N : Type u) [AddCommGroup N] [Module S N] [Module R N] [IsScalarTower S R N]
    (eN : ModuleCat.of S N ≅ H (a + l) C)
    (hact : ∀ (r : R) (x : N), eN.hom.hom (r • x) =
      ((DerivedCategory.homologyFunctor (ModuleCat S) (a + l)).map (ρ r)).hom
        (eN.hom.hom x)) :
    (∀ i : ℤ, i ≠ a + l → IsZero (H i C)) ∧ Nontrivial N ∧
      Module.Finite S N ∧ Module.Finite R N ∧
      CategoryTheory.projectiveDimension (ModuleCat.of S N) = l ∧
      residueExtDepth S N = d - l ∧ residueExtDepth R N = d - l ∧
      Module.supportDim R N = (d - l : WithBot ℕ∞) ∧
      ringKrullDim R = (d - l : WithBot ℕ∞) := by
  sorry

/-- The signed dual of a balanced patched representative concentrates at the dual endpoint;
its remaining module is the canonical CM dual expressed as Ext over the regular base. -/
theorem patched_dual_concentration
    {R : Type u} [CommRing R] [IsRegularLocalRing R]
    (C : Der R) (n l : ℕ) (a : ℤ)
    (hdim : ringKrullDim R = (n : WithBot ℕ∞)) (hl : l ≤ n)
    (hC : ¬ IsZero C) (P : Cpx R)
    (hbound : ∀ i, i < a ∨ a + l < i → IsZero (P.X i))
    (hfinite : ∀ i, Module.Finite R (P.X i) ∧ Module.Projective R (P.X i))
    (e : DerivedCategory.Q.obj P ≅ C)
    (hsupport : ∀ p ∈ derivedSupport C,
      ringKrullDim (R ⧸ p.asIdeal) ≤ (n - l : WithBot ℕ∞)) :
    let D := TauCeti.linearHomComplex R P
      ((HomologicalComplex.single (ModuleCat R) (ComplexShape.up ℤ) 0).obj
        (ModuleCat.of R R))
    (∀ i : ℤ, i ≠ -a → IsZero (H i (DerivedCategory.Q.obj D))) ∧
      Nonempty (H (-a) (DerivedCategory.Q.obj D) ≅
        ModuleCat.of R (CategoryTheory.Abelian.Ext (H (a + l) C) (ModuleCat.of R R) l)) := by
  sorry

/-- Two complete regular coefficient sources compute the same canonical dual through
finite faithful action quotients, expressed as an additive equivalence of Ext groups. -/
theorem finiteActionCanonicalDuality_ext
    (S Q R : Type u) [CommRing S] [IsRegularLocalRing S]
    [IsAdicComplete (maximalIdeal S) S]
    [CommRing Q] [IsRegularLocalRing Q] [IsAdicComplete (maximalIdeal Q) Q]
    [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (maximalIdeal R) R]
    [Algebra S R] [IsLocalHom (algebraMap S R)]
    [Algebra Q R] [IsLocalHom (algebraMap Q R)]
    (N : Type u) [AddCommGroup N] [Module R N] [Module S N] [Module Q N]
    [IsScalarTower S R N] [IsScalarTower Q R N]
    [Module.Finite R N] [Module.Finite S N] [Module.Finite Q N]
    (d e r : ℕ) (hS : ringKrullDim S = d) (hQ : ringKrullDim Q = e)
    (hrS : r ≤ d) (hrQ : r ≤ e) :
    Nonempty (CategoryTheory.Abelian.Ext (ModuleCat.of S N) (ModuleCat.of S S) (d - r) ≃+
      CategoryTheory.Abelian.Ext (ModuleCat.of Q N) (ModuleCat.of Q Q) (e - r)) := by
  sorry

end TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra
