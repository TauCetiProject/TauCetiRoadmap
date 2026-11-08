import Mathlib
import TauCeti.RepresentationTheory.BaseChange
import TauCeti.RepresentationTheory.SymmetricPower
import TauCeti.RingTheory.LocalRing.RamificationGroup
import TauCeti.NumberTheory.LocalField.Unramified.Inertia.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois

/-!
# Arithmetic Galois representations and conductors: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
These statements suggest Lean forms for headline theorems; discharging them finishes neither
all the targets of a layer nor the roadmap. Section references are to `README.md`.

The statements cover coefficient-field and integral descent and Brauer–Nesbitt (Layer 1), odd
absolute irreducibility and Dickson's classification (Layer 4), Frobenius recognition, the
image-algebra descent obstruction and Carayol's lemma (Layer 5), the multiplicative residual
unramified criterion, finite Frattini detection and Serre's wild bound for a representation of a
finite Galois group (Layer 6), and projective lifting, the constituent-dimension adequacy bound,
tensor adequacy, and enormous symmetric-power and general-rank images (Layer 7).
Representations use Mathlib's `Representation`, with joint continuity imposed explicitly, or
continuous matrix homomorphisms. The small definitions below use native integral closures,
subrepresentations, cohomology and Tau Ceti's ramification groups of a group acting on a local
ring.

Grothendieck's monodromy theorem is stated by its owner, SmoothRepresentationsOfLocalGroups SR.5.2
*wd-complete-coefficients* (`grothendieck_quasiUnipotent_complete`, on Mathlib's
`Representation` with joint continuity and complete normed coefficients); its specialization in
§2.4 to Tau Ceti's `TauCeti.ContinuousRep` over a finite extension of `ℚ_ℓ` adds no headline
here. The full Weil–Deligne adapter and purity require the local Weil group and the normalized
Weil–Deligne parameter of the named suppliers, which have no Mathlib or Tau Ceti carrier; the
Gauss-sum character constants and their root-number product formula are definitions and
finite-sum identities, not headline theorems, and stay in the README. The conductors of a
continuous representation of the absolute Galois group whose inertia image may be infinite (an
`ℓ`-adic representation with nonzero monodromy), with their breaks, the integrality of §3.5 for
such representations, the induction formula of §3.5 for representations of `G_L` and the
reduction formulas of §3.6, use the absolute upper filtration of
RamificationOfCompleteDiscretelyValuedFields §4a.1 over complete discretely valued fields with
perfect residue field, as recorded in §3.0, and the break decomposition of §3.1; that absolute
filtration over a general perfect residue field has no Mathlib or Tau Ceti carrier. The
character-conductor comparison of §3.2 uses the unit-filtration reciprocity declared on
ClassFieldTheory as gap:unit-filtration-reciprocity, which has no carrier either. The lower
Artin and Swan conductors of a representation of a finite Galois group and their integrality are
AnalyticNumberTheoryPartI §2.2a's `lowerArtinConductor`, `lowerSwanConductor` and
`lowerConductors_integral`; that file is not imported here, so Serre's wild bound writes the lower
Swan sum out.
The general Tate-module, pairing, determinant and coefficient adapters require the geometric
abelian-scheme torsion and `AbelianTate` fibre; the elliptic Tate module alone does not supply them.
Function-field recognition requires closed-point Frobenius on the restricted-ramification
fundamental group. General reductive integral models, polarised and Taylor–Wiles verification
statements require reduced buildings, reductive quotient and complete-reducibility interfaces,
the CHT group and unitary comparison. These endpoints remain specified in the README, without substitute structures here.
-/

noncomputable section

namespace TauCetiRoadmap.ArithmeticGaloisRepresentations

open Matrix Polynomial NumberField IsDedekindDomain
open scoped TensorProduct ValuativeRel

/-! ## Layer 1: continuous representations and integral models -/

namespace ContinuousRep

/-- Coefficient-field descent (§1.5): one coefficient field contains the image and any prescribed
finite coefficient field (BHKT, proof of Theorem 4.8; CG, proof of Proposition 6.8). -/
theorem baire_descent {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CompactSpace Γ] [T2Space Γ] (ℓ : ℕ) [Fact ℓ.Prime] {n : ℕ}
    (ρ : Γ →ₜ* GL (Fin n) (PadicAlgCl ℓ))
    (K : IntermediateField ℚ_[ℓ] (PadicAlgCl ℓ)) [FiniteDimensional ℚ_[ℓ] K] :
    ∃ E : IntermediateField ℚ_[ℓ] (PadicAlgCl ℓ), K ≤ E ∧ FiniteDimensional ℚ_[ℓ] E ∧
      ∀ (g : Γ) (i j : Fin n), (ρ g : Matrix (Fin n) (Fin n) (PadicAlgCl ℓ)) i j ∈ E := by
  sorry

/-- Integral descent (§1.6): a compact action over the algebraic closure is conjugate into the
integers of one finite coefficient field (BHKT, Theorem 4.8(ii)). -/
theorem exists_integral_conj_GL {Γ : Type*} [Group Γ] [TopologicalSpace Γ]
    [IsTopologicalGroup Γ] [CompactSpace Γ] [T2Space Γ] (ℓ : ℕ) [Fact ℓ.Prime] {n : ℕ}
    (ρ : Γ →ₜ* GL (Fin n) (PadicAlgCl ℓ)) :
    ∃ (E : IntermediateField ℚ_[ℓ] (PadicAlgCl ℓ)) (P : GL (Fin n) (PadicAlgCl ℓ)),
      FiniteDimensional ℚ_[ℓ] E ∧ ∀ (g : Γ) (i j : Fin n),
        (P * ρ g * P⁻¹ : Matrix (Fin n) (Fin n) (PadicAlgCl ℓ)) i j ∈ E ∧
        ‖(P * ρ g * P⁻¹ : Matrix (Fin n) (Fin n) (PadicAlgCl ℓ)) i j‖ ≤ 1 := by
  sorry

/-- Brauer–Nesbitt (§1.8), in every characteristic and for any monoid: semisimple representations
with identical characteristic polynomials are isomorphic (DDT, Proposition 2.6). -/
theorem iso_of_charpoly_eq {k Γ V W : Type*} [Field k] [Monoid Γ]
    [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    [AddCommGroup W] [Module k W] [FiniteDimensional k W]
    (ρ : Representation k Γ V) (σ : Representation k Γ W)
    (hρ : ρ.IsSemisimpleRepresentation) (hσ : σ.IsSemisimpleRepresentation)
    (h : ∀ g, (ρ g).charpoly = (σ g).charpoly) : Nonempty (ρ.Equiv σ) := by
  sorry

end ContinuousRep

/-! ## Layer 2: decomposition groups, inertia and Weil–Deligne representations -/

namespace GaloisRep

/-- The native integral-closure action used to specify arithmetic Frobenius (§2.1). -/
def toIntegralClosure (F : Type*) [Field F] [NumberField F] (σ : Field.absoluteGaloisGroup F) :
    integralClosure (𝓞 F) (AlgebraicClosure F) ≃ₐ[𝓞 F]
      integralClosure (𝓞 F) (AlgebraicClosure F) :=
  ((show AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F from σ).restrictScalars (𝓞 F)).mapIntegralClosure

/-- Arithmetic Frobenius on the actual integral closure (§2.1). -/
def IsArithFrobAtIntegralPrime {F : Type*} [Field F] [NumberField F]
    (σ : Field.absoluteGaloisGroup F) (Q : Ideal (integralClosure (𝓞 F) (AlgebraicClosure F))) : Prop :=
  (toIntegralClosure F σ).toAlgHom.IsArithFrobAt Q

/-- All arithmetic lifts above a set of finite places (§5.1). -/
def frobeniusSet {F : Type*} [Field F] [NumberField F]
    (Pl : Set (HeightOneSpectrum (𝓞 F))) : Set (Field.absoluteGaloisGroup F) :=
  {σ | ∃ Q : Ideal (integralClosure (𝓞 F) (AlgebraicClosure F)), Q.IsMaximal ∧
    (∃ v ∈ Pl, Q.under (𝓞 F) = v.asIdeal) ∧ IsArithFrobAtIntegralPrime σ Q}

end GaloisRep

/-! ## Layer 4: residual images and oddness -/

namespace GaloisRep

/-- Complex conjugation at an infinite place, using embeddings of the actual algebraic closure
(§4.1). -/
def IsComplexConjugation {F : Type*} [Field F] [NumberField F]
    (v : InfinitePlace F) (c : Field.absoluteGaloisGroup F) : Prop :=
  ∃ ι : AlgebraicClosure F →+* ℂ, InfinitePlace.mk (ι.comp (algebraMap F (AlgebraicClosure F))) = v ∧
    ∀ x, ι ((show AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F from c) x) = starRingEnd ℂ (ι x)

/-- Odd irreducible planes are absolutely irreducible (§4.1): in characteristic not two `ρ(c)` has
the distinct eigenvalues `1` and `−1` (Serre 1987, §3.3); in characteristic two a nontrivial `ρ(c)`
is a nonscalar unipotent involution, and a nonscalar element with split characteristic polynomial
makes every stable line rational. -/
theorem isAbsolutelyIrreducible_of_isOddAt {F k V : Type*} [Field F] [NumberField F] [Field k]
    [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    (ρ : Representation k (Field.absoluteGaloisGroup F) V) (hdim : Module.finrank k V = 2)
    (hirr : ρ.IsIrreducible) (v : InfinitePlace F) (hv : v.IsReal)
    (hodd : ∀ c, IsComplexConjugation v c →
      ((2 : k) ≠ 0 ∧ LinearMap.det (ρ c) = -1) ∨ ((2 : k) = 0 ∧ ρ c ≠ 1)) :
    (ρ.baseChange (AlgebraicClosure k)).IsIrreducible := by
  sorry

end GaloisRep

namespace GL2Subgroup

/-- Dickson's classification (§4.4): the list of projective images is DDT, Theorem 2.47(b) and
KW (I), §6, p. 9. The field of a standard image is the trace-ratio field: `tr(g)² / det g` is
unchanged by scalars and conjugation, so it lies in the field of the image, and the squares of
the traces of `SL₂(F′)` generate `F′`. -/
theorem dickson_projectiveImage {p : ℕ} [Fact p.Prime] {k : Type*} [Field k] [Finite k]
    [CharP k p] (G : Subgroup (GL (Fin 2) k))
    (hG : Submodule.span (AlgebraicClosure k)
      (Set.range fun g : G => ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k).map
        (algebraMap k (AlgebraicClosure k))) = ⊤) :
    let πG : Subgroup (ProjGenLinGroup (Fin 2) (AlgebraicClosure k)) :=
      (G.map (GeneralLinearGroup.map (algebraMap k (AlgebraicClosure k)))).map ProjGenLinGroup.mk
    let F₀ : Subfield k := Subfield.closure
      (Set.range fun g : G => (Matrix.trace ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k)) ^ 2 /
        Matrix.det ((g : GL (Fin 2) k) : Matrix (Fin 2) (Fin 2) k))
    let ι : F₀ →+* AlgebraicClosure k := (algebraMap k (AlgebraicClosure k)).comp F₀.subtype
    (∃ n : ℕ, 2 ≤ n ∧ ¬ p ∣ n ∧ Nonempty (πG ≃* DihedralGroup n)) ∨
      Nonempty (πG ≃* alternatingGroup (Fin 4)) ∨ Nonempty (πG ≃* Equiv.Perm (Fin 4)) ∨
      Nonempty (πG ≃* alternatingGroup (Fin 5)) ∨
      ∃ x : ProjGenLinGroup (Fin 2) (AlgebraicClosure k),
        πG = ((SpecialLinearGroup.map ι).range.map
            (ProjGenLinGroup.mk.comp SpecialLinearGroup.toGL)).map (MulAut.conj x).toMonoidHom ∨
        πG = ((GeneralLinearGroup.map ι).range.map ProjGenLinGroup.mk).map
            (MulAut.conj x).toMonoidHom := by
  sorry

end GL2Subgroup

/-! ## Layer 5: recognition by Frobenius polynomials -/

namespace GaloisRep

/-- Chebotarev recognition (§5.3) over different coefficient fields: comparison takes place in a
common Hausdorff field, with joint continuity on each original carrier. Agreement is at all
arithmetic lifts above a density-one set, without a finite ramification assumption
(DDT, Proposition 2.6(b); Deligne–Serre, Lemma 3.2). -/
theorem iso_of_frobenius_charpoly_eq {F E₁ E₂ E V₁ V₂ : Type*} [Field F] [NumberField F]
    [Field E₁] [TopologicalSpace E₁] [IsTopologicalRing E₁]
    [Field E₂] [TopologicalSpace E₂] [IsTopologicalRing E₂]
    [Field E] [TopologicalSpace E] [IsTopologicalRing E] [T2Space E]
    [Algebra E₁ E] [ContinuousSMul E₁ E] [Algebra E₂ E] [ContinuousSMul E₂ E]
    [AddCommGroup V₁] [Module E₁ V₁] [FiniteDimensional E₁ V₁]
    [TopologicalSpace V₁] [IsModuleTopology E₁ V₁]
    [AddCommGroup V₂] [Module E₂ V₂] [FiniteDimensional E₂ V₂]
    [TopologicalSpace V₂] [IsModuleTopology E₂ V₂]
    (ρ₁ : Representation E₁ (Field.absoluteGaloisGroup F) V₁)
    (ρ₂ : Representation E₂ (Field.absoluteGaloisGroup F) V₂)
    (hc₁ : Continuous fun p : Field.absoluteGaloisGroup F × V₁ => ρ₁ p.1 p.2)
    (hc₂ : Continuous fun p : Field.absoluteGaloisGroup F × V₂ => ρ₂ p.1 p.2)
    (h₁ : (ρ₁.baseChange E).IsSemisimpleRepresentation)
    (h₂ : (ρ₂.baseChange E).IsSemisimpleRepresentation)
    (Pl : Set (HeightOneSpectrum (𝓞 F))) (hPl : NumberField.Set.HasDirichletDensity Pl 1)
    (hchar : ∀ σ ∈ frobeniusSet Pl,
      (ρ₁ σ).charpoly.map (algebraMap E₁ E) = (ρ₂ σ).charpoly.map (algebraMap E₂ E)) :
    Nonempty ((ρ₁.baseChange E).Equiv (ρ₂.baseChange E)) := by
  sorry

section ImageAlgebra

variable {k K Γ : Type*} [Field k] [Field K] [Algebra k K] [Group Γ] {n : ℕ}

/-- Trace field (§5.5), on the native intermediate-field carrier. -/
def traceField (ρ : Γ →* GL (Fin n) K) : IntermediateField k K :=
  IntermediateField.adjoin k
    (Set.range fun γ => Matrix.trace ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K))

/-- The image algebra `B(ρ)`: the `k(ρ)`-subalgebra of `M_n(K)` generated by `ρ(Γ)`. -/
def imageAlgebra (ρ : Γ →* GL (Fin n) K) :
    Subalgebra (traceField (k := k) ρ) (Matrix (Fin n) (Fin n) K) :=
  Algebra.adjoin (traceField (k := k) ρ)
    (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K))

/-- For `ρ` absolutely irreducible (`ρ(Γ)` spans `M_n(K)`, `K` algebraically closed, `n ≥ 1`),
`B(ρ)` is central simple of dimension `n²` over `k(ρ)`, `K ⊗_{k(ρ)} B(ρ) ≅ M_n(K)` by
multiplication, and the characteristic polynomial of every `b ∈ B(ρ)` has coefficients in `k(ρ)`
(BLGGT 2014, proof of Lemma A.1.5; Chenevier 2008, Def.-Prop. 2.18). -/
theorem imageAlgebra_isCentralSimple [IsAlgClosed K] [NeZero n] (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K
      (Set.range fun γ => ((ρ γ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K)) = ⊤) :
    Algebra.IsCentral (traceField (k := k) ρ) (imageAlgebra (k := k) ρ) ∧
      IsSimpleRing (imageAlgebra (k := k) ρ) ∧
      FiniteDimensional (traceField (k := k) ρ) (imageAlgebra (k := k) ρ) ∧
      Module.finrank (traceField (k := k) ρ) (imageAlgebra (k := k) ρ) = n ^ 2 ∧
      (∃ e : K ⊗[traceField (k := k) ρ] imageAlgebra (k := k) ρ ≃ₐ[K] Matrix (Fin n) (Fin n) K,
        ∀ (c : K) (b : imageAlgebra (k := k) ρ),
          e (c ⊗ₜ[traceField (k := k) ρ] b) = c • (b : Matrix (Fin n) (Fin n) K)) ∧
      ∀ (b : imageAlgebra (k := k) ρ) (i : ℕ),
        (Matrix.charpoly (b : Matrix (Fin n) (Fin n) K)).coeff i ∈ traceField (k := k) ρ := by
  sorry


/-- The field-of-definition obstruction (§§5.5–5.6): descent is equivalent to splitting the
image algebra, in every characteristic (BLGGT, proof of Lemma A.1.5; Chenevier, §2). -/
theorem realizable_iff_imageAlgebra_split [IsAlgClosed K] [NeZero n]
    (ρ : Γ →* GL (Fin n) K)
    (hρ : Submodule.span K (Set.range fun g => (ρ g : Matrix (Fin n) (Fin n) K)) = ⊤)
    (L : IntermediateField (traceField (k := k) ρ) K) :
    (∃ g : GL (Fin n) K, ∀ γ i j,
      (g * ρ γ * g⁻¹ : Matrix (Fin n) (Fin n) K) i j ∈ L) ↔
    Nonempty (L ⊗[traceField (k := k) ρ] imageAlgebra (k := k) ρ ≃ₐ[L]
      Matrix (Fin n) (Fin n) L) := by
  sorry

end ImageAlgebra

/-- Finite-field realization (§5.7): a semisimple representation descends to every subfield
containing its characteristic-polynomial coefficients (Deligne–Serre, Lemma 6.13). -/
theorem realizable_of_charpoly_mem {Φ : Type*} [Group Φ] {k' : Type*} [Field k'] [Finite k']
    {n : ℕ} (φ : Φ →* GL (Fin n) k')
    (hss : IsSemisimpleModule (MonoidAlgebra k' Φ)
      (Representation.asModule ((Units.coeHom _).comp
        ((Matrix.GeneralLinearGroup.toLin : GL (Fin n) k' ≃* _).toMonoidHom.comp φ))))
    (k : Subfield k')
    (hk : ∀ s i, (Matrix.charpoly ((φ s : GL (Fin n) k') : Matrix (Fin n) (Fin n) k')).coeff i ∈ k) :
    ∃ g : GL (Fin n) k', ∀ s i j,
      ((g * φ s * g⁻¹ : GL (Fin n) k') : Matrix (Fin n) (Fin n) k') i j ∈ k := by
  sorry


/-- The trace-field descent criterion with a split regular element (§5.7)
(BLGGT, Lemma A.1.5). -/
theorem conj_into_of_trace_mem_of_distinct_eigenvalues {Γ : Type*} [Group Γ]
    {M : Type*} [Field M] [CharZero M] {Mbar : Type*} [Field Mbar] [Algebra M Mbar]
    [IsAlgClosure M Mbar] {n : ℕ} (r : Γ →* GL (Fin n) Mbar)
    (hss : IsSemisimpleModule (MonoidAlgebra Mbar Γ)
      (Representation.asModule ((Units.coeHom _).comp
        ((Matrix.GeneralLinearGroup.toLin : GL (Fin n) Mbar ≃* _).toMonoidHom.comp r))))
    (htr : ∀ γ, Matrix.trace ((r γ : GL (Fin n) Mbar) : Matrix (Fin n) (Fin n) Mbar) ∈
      (algebraMap M Mbar).range)
    (γ₀ : Γ) (a : Fin n → M) (ha : Function.Injective a)
    (hγ₀ : Matrix.charpoly ((r γ₀ : GL (Fin n) Mbar) : Matrix (Fin n) (Fin n) Mbar) =
      ∏ i, (X - C (algebraMap M Mbar (a i)))) :
    ∃ g : GL (Fin n) Mbar, ∀ γ i j,
      ((g * r γ * g⁻¹ : GL (Fin n) Mbar) : Matrix (Fin n) (Fin n) Mbar) i j ∈
        (algebraMap M Mbar).range := by
  sorry

/-- Carayol's strict-conjugacy theorem (§5.10), without a factorial-invertibility assumption
(Chenevier, Theorem 2.22(i)). -/
theorem carayol_conj_of_trace_eq {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
    [CompactSpace Γ] [TotallyDisconnectedSpace Γ]
    {R : Type*} [CommRing R] [IsLocalRing R] [IsNoetherianRing R]
    [IsAdicComplete (IsLocalRing.maximalIdeal R) R] [Finite (IsLocalRing.ResidueField R)]
    [TopologicalSpace R] [IsTopologicalRing R] (hadic : ∀ s : Set R, s ∈ nhds (0 : R) ↔
      ∃ m : ℕ, ((IsLocalRing.maximalIdeal R ^ m : Ideal R) : Set R) ⊆ s)
    {d : ℕ} [NeZero d] (r r' : Γ →* GL (Fin d) R)
    (hr : Continuous fun γ => ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R))
    (hr' : Continuous fun γ => ((r' γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R))
    (hres : ∀ γ, ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R) =
      ((r' γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R))
    (habs : Submodule.span (IsLocalRing.ResidueField R) (Set.range fun γ =>
      ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R)) = ⊤)
    (D : Set Γ) (hD : Dense D)
    (htr : ∀ γ ∈ D, Matrix.trace ((r γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R) =
      Matrix.trace ((r' γ : GL (Fin d) R) : Matrix (Fin d) (Fin d) R)) :
    ∃ g : GL (Fin d) R, ((g : Matrix (Fin d) (Fin d) R).map (IsLocalRing.residue R) = 1) ∧
      ∀ γ, r' γ = g * r γ * g⁻¹ := by
  sorry

end GaloisRep

/-! ## Layer 6: Tate modules of elliptic curves and abelian varieties -/

namespace TateModule

/-- The finite Frattini quotient of a compact matrix group detects its full closed image
(§6.4a; Masser–Zannier, proof of Lemma 5.1). -/
theorem compact_matrix_frattini_isOpen (ℓ : ℕ) [Fact ℓ.Prime]
    {E : Type*} [Field E] [Algebra ℚ_[ℓ] E] [FiniteDimensional ℚ_[ℓ] E]
    [TopologicalSpace E] [IsTopologicalRing E] [IsModuleTopology ℚ_[ℓ] E] {n : ℕ}
    (P : Subgroup (Matrix.GeneralLinearGroup (Fin n) E))
    (hP : IsCompact (P : Set (Matrix.GeneralLinearGroup (Fin n) E))) :
    IsOpen ((⨅ (M : OpenSubgroup P) (_ : IsCoatom M), M.toSubgroup) : Set P) := by
  sorry

/-- Multiplicative residual unramifiedness (§6.3) for split and nonsplit reduction, at every
prime different from the residue characteristic (DDT, Proposition 2.12). The integer exponent
of the native normalized multiplicative valuation is the negative additive valuation. -/
theorem multiplicative_residual_unramified_iff (K : Type*) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] (W : WeierstrassCurve K)
    [DecidableEq (AlgebraicClosure K)] [W.IsElliptic] [W.HasMultiplicativeReduction 𝒪[K]]
    (p : ℕ) [Fact p.Prime] (hp : p ≠ ringChar 𝓀[K]) :
    (∀ σ ∈ TauCeti.inertiaSubgroup K,
      W.torsionGaloisAction (K := AlgebraicClosure K) p
        (show AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K from σ) = 1) ↔
    ∃ m : ℤ, IsNonarchimedeanLocalField.valueGroupWithZeroIsoInt K
        (ValuativeRel.valuation K W.j) = (↑(Multiplicative.ofAdd m : Multiplicative ℤ) : WithZero (Multiplicative ℤ)) ∧
      (p : ℤ) ∣ m := by
  sorry

end TateModule

namespace Conductor

/-- Serre's wild bound (§6.6): for `G` finite acting faithfully on a complete discrete valuation
ring `B` of characteristic zero with perfect residue field of characteristic `p`, a
representation of dimension `N` over a field of characteristic `≠ p` and `|G_1| = p^c`, the
Swan conductor is at most `N e_K (c + 1/(p − 1))`, where `e_K = v_L(p) / |G_0|` is the absolute
ramification index of the fixed field (Serre 1987, §4.9, Prop. 9, p. 215). The left side is the
lower Swan sum `Σ_{i ≥ 1} (|G_i| / |G_0|) · codim W^{G_i}`, AnalyticNumberTheoryPartI §2.2a's
`lowerSwanConductor G B ρ`. -/
theorem lowerSwanConductor_le {G B : Type*} [Group G] [Finite G] [CommRing B] [IsDomain B]
    [IsDiscreteValuationRing B] [IsAdicComplete (IsLocalRing.maximalIdeal B) B] [CharZero B]
    [PerfectField (IsLocalRing.ResidueField B)] [MulSemiringAction G B] [FaithfulSMul G B]
    (p : ℕ) [Fact p.Prime] [CharP (IsLocalRing.ResidueField B) p]
    {C W : Type*} [Field C] [AddCommGroup W] [Module C W] [FiniteDimensional C W]
    (hC : ringChar C ≠ p) (ρ : Representation C G W) (c : ℕ)
    (hc : Nat.card (TauCeti.IsLocalRing.ramificationGroup G B 1) = p ^ c) :
    ∑ᶠ i : ℕ, ((Nat.card (TauCeti.IsLocalRing.ramificationGroup G B (i + 1 : ℕ)) : ℚ) /
        Nat.card (TauCeti.IsLocalRing.ramificationGroup G B 0)) *
      Module.finrank C (W ⧸ Representation.invariants
        (ρ.comp (TauCeti.IsLocalRing.ramificationGroup G B (i + 1 : ℕ)).subtype)) ≤
      Module.finrank C W *
      (((IsDiscreteValuationRing.addVal B (p : B)).toNat : ℚ) /
        Nat.card (TauCeti.IsLocalRing.ramificationGroup G B 0)) * (c + 1 / ((p : ℚ) - 1)) := by
  sorry

end Conductor

/-! ## Layer 7: dimension-general arithmetic API -/

namespace ResidualImage

/-- The native matrix representation, needed for residual-image cohomology (§7.9). -/
def matrixRep {G : Type*} [Monoid G] {k : Type*} [CommRing k] {n : Type*} [Fintype n]
    [DecidableEq n] (r : G →* GL n k) : Representation k G (n → k) :=
  (Matrix.toLinAlgEquiv' : Matrix n n k ≃ₐ[k] Module.End k (n → k)).toRingEquiv.toMonoidHom.comp
    ((Units.coeHom (Matrix n n k)).comp r)

variable {k : Type} [Field k] {n : Type} [Fintype n] [DecidableEq n]

/-- Trace-zero adjoint on Mathlib's actual trace kernel (§7.9). -/
def adZeroRep {G : Type} [Group G] (r : G →* GL n k) :
    Representation k G (LinearMap.ker (LinearMap.trace k (n → k))) :=
  (Representation.linHom (matrixRep r) (matrixRep r)).subrepresentation _ (by
    intro g x hx
    change LinearMap.trace k (n → k) ((matrixRep r) g * x * (matrixRep r) g⁻¹) = 0
    rw [LinearMap.trace_mul_cycle, ← map_mul, inv_mul_cancel, map_one, one_mul]
    exact hx)

/-- Adequacy for finite images in positive characteristic (§7.9), in the equivalent semisimple
spanning form: `H¹(k) = H⁰(ad⁰) = H¹(ad⁰) = 0` and semisimple elements span all matrices. -/
def IsAdequate (H : Subgroup (GL n k)) : Prop :=
  Nonempty n ∧ Subsingleton (groupCohomology (Rep.of (Representation.trivial k H k)) 1) ∧
    Subsingleton (groupCohomology (Rep.of (X := LinearMap.ker (LinearMap.trace k (n → k))) (adZeroRep H.subtype)) 0) ∧
    Subsingleton (groupCohomology (Rep.of (X := LinearMap.ker (LinearMap.trace k (n → k))) (adZeroRep H.subtype)) 1) ∧
    Submodule.span k {X : Matrix n n k | ∃ h ∈ H,
      (minpoly k (h : Matrix n n k)).Separable ∧ X = (h : Matrix n n k)} = ⊤

/-- Enormity (§7.10) on native simple subrepresentations of the trace-zero adjoint, with the
finite-image no-`p`-quotient condition expressed as vanishing of `H¹(H,k)`. -/
def IsEnormous (H : Subgroup (GL n k)) : Prop :=
  Nonempty n ∧ (matrixRep H.subtype |>.baseChange (AlgebraicClosure k)).IsIrreducible ∧
    Subsingleton (groupCohomology (Rep.of (Representation.trivial k H k)) 1) ∧
    Subsingleton (groupCohomology (Rep.of (X := LinearMap.ker (LinearMap.trace k (n → k))) (adZeroRep H.subtype)) 0) ∧
    Subsingleton (groupCohomology (Rep.of (X := LinearMap.ker (LinearMap.trace k (n → k))) (adZeroRep H.subtype)) 1) ∧
    ∀ W : Subrepresentation (adZeroRep H.subtype), IsAtom W →
      ∃ h : H, (h.val : Matrix n n k).charpoly.Separable ∧
        ∃ w ∈ W, w ≠ 0 ∧ adZeroRep H.subtype h w = w

/-- The subgroup generated by elements of `p`-power order (§7.9). -/
def pGenerated (H : Subgroup (GL n k)) : Subgroup H :=
  Subgroup.closure {h | ∃ a : ℕ, h ^ (ringChar k) ^ a = 1}

/-- The dimension-general adequacy criterion (§7.9): finite absolutely irreducible images of
prime-to-`p` order or with `p ≥ 2(d+1)`, where `d` bounds the dimensions of the simple
constituents for the subgroup generated by `p`-elements, are adequate
(BLGG, Remark A.1.2; GHTT, Theorem 9). -/
theorem isAdequate_of_coprime_or_large [Nonempty n] (H : Subgroup (GL n k)) [Finite H]
    (hp : (ringChar k).Prime)
    (hirr : (matrixRep H.subtype |>.baseChange (AlgebraicClosure k)).IsIrreducible)
    (h : ¬ ringChar k ∣ Nat.card H ∨ ∃ d : ℕ, 2 * (d + 1) ≤ ringChar k ∧
      ∀ W : Subrepresentation
        (Representation.baseChange (AlgebraicClosure k)
          ((matrixRep H.subtype).comp (pGenerated H).subtype)),
        IsAtom W → Module.finrank (AlgebraicClosure k) W.toSubmodule ≤ d) :
    IsAdequate H := by
  sorry

/-- Tensoring adequate images with a prime-to-characteristic factor (§7.9), with absolute
irreducibility on the first factor's kernel (BLGG, Lemma A.3.1). -/
theorem isAdequate_tensor {Γ : Type} [Group Γ] {m : Type} [Fintype m] [DecidableEq m]
    [Nonempty n] [Nonempty m] (r₁ : Γ →* GL n k) (r₂ : Γ →* GL m k)
    (r : Γ →* GL (n × m) k) [Finite r₁.range] [Finite r₂.range]
    (hp : (ringChar k).Prime) (h₁ : IsAdequate r₁.range)
    (h₂ : (matrixRep (r₂.comp r₁.ker.subtype) |>.baseChange (AlgebraicClosure k)).IsIrreducible)
    (horder : ¬ ringChar k ∣ Nat.card r₂.range)
    (htensor : ∀ g, r g = (r₁ g).kronecker (r₂ g)) : IsAdequate r.range := by
  sorry

/-- Rank-two enormous images are exactly the adequate images (§7.10), over every algebraic
extension of the prime field of odd characteristic (GN, Lemma 3.2.3). -/
theorem isEnormous_iff_isAdequate_rankTwo (p : ℕ) [Fact p.Prime] (hp : p ≠ 2)
    [Algebra (ZMod p) k] [Algebra.IsAlgebraic (ZMod p) k]
    (H : Subgroup (GL (Fin 2) k)) [Finite H]
    (hirr : (matrixRep H.subtype |>.baseChange (AlgebraicClosure k)).IsIrreducible) :
    IsEnormous H ↔ IsAdequate H := by
  sorry

/-- The general-rank enormous-image criterion (§7.10): finite subfield special linear groups
with only scalar and general linear enlargement (GN, Lemma 3.2.4). -/
theorem isEnormous_of_contains_SL [Finite k] (H : Subgroup (GL n k)) (k' : Subfield k)
    (hn : 2 < Fintype.card n) (hp : Fintype.card n < ringChar k)
    (hSL : ((SpecialLinearGroup.map k'.subtype).range.map SpecialLinearGroup.toGL) ≤ H)
    (hH : H ≤ (GeneralLinearGroup.scalar n).range ⊔ (GeneralLinearGroup.map k'.subtype).range) :
    IsEnormous H := by
  sorry

/-- Image of the native symmetric-power representation in a chosen basis (§7.10). -/
def symPowerImage {G : Type} [Group G] (r : G →* GL (Fin 2) k) (d : ℕ)
    {ι : Type} [Fintype ι] [DecidableEq ι]
    (b : Module.Basis ι k (Sym[k]^d (Fin 2 → k))) : Subgroup (GL ι k) :=
  ((Units.map (LinearMap.toMatrixAlgEquiv b).toMonoidHom).comp
    ((matrixRep r).symmetricPower d).asGroupHom).range

/-- Enormous symmetric-power images (§7.10), between the symmetric powers of a finite subfield's
special and general linear groups, allowing scalar enlargement (GN, Lemma 3.2.5; CHT,
Corollary 2.5.4). -/
theorem isEnormous_symPower [Finite k] (n : ℕ) (H : Subgroup (GL (Fin n) k))
    (k' : Subfield k) (hn : 2 ≤ n) (hp : 2 * n + 1 < ringChar k)
    (b : Module.Basis (Fin n) k (Sym[k]^(n - 1) (Fin 2 → k)))
    (hSL : symPowerImage ((GeneralLinearGroup.map k'.subtype).comp
      SpecialLinearGroup.toGL) (n - 1) b ≤ H)
    (hH : H ≤ (GeneralLinearGroup.scalar (Fin n)).range ⊔
      symPowerImage (GeneralLinearGroup.map k'.subtype) (n - 1) b) :
    IsEnormous H := by
  sorry

end ResidualImage

namespace GaloisRep

/-- Quotient topology on Mathlib's projective general linear group (§7.6). -/
abbrev projectiveTopology (n : ℕ) (k : Type*) [Field k] [TopologicalSpace k] :
    TopologicalSpace (ProjGenLinGroup (Fin n) k) :=
  .coinduced (ProjGenLinGroup.mk : GL (Fin n) k → ProjGenLinGroup (Fin n) k) inferInstance

/-- Tate's projective lifting theorem for `GL_n → PGL_n` (§7.6), with the quotient topology
(Patrikis, Theorem 2.1.1 and Proposition 2.1.4). -/
theorem exists_linear_lift {F : Type*} [Field F] [NumberField F]
    (ℓ : ℕ) [Fact ℓ.Prime] (n : ℕ) (hn : 0 < n)
    (P : Field.absoluteGaloisGroup F →* ProjGenLinGroup (Fin n) (PadicAlgCl ℓ))
    (hP : @Continuous _ _ inferInstance (projectiveTopology n (PadicAlgCl ℓ)) P) :
    ∃ r : Field.absoluteGaloisGroup F →ₜ* GL (Fin n) (PadicAlgCl ℓ),
      ∀ g, ProjGenLinGroup.mk (r g) = P g := by
  sorry

end GaloisRep

end TauCetiRoadmap.ArithmeticGaloisRepresentations
