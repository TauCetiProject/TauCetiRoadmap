import Mathlib

/-!
# Solid spectral analytic coefficients: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. For every universe u, §1.3's internal
projectivity and §1.5's abelian solidification, countable integer-product compact
projective generator, closed symmetric monoidal reflection and ordinary
derived-category reflection are stated below on light modules over ULift.{u} ℤ.
Compactness means preservation by Hom of filtered colimits indexed in Lean
universe u+1, the hom universe of the native category. Their proofs use §1.3's
marked-diagram universe transport.

The remaining headlines are not statable at the pins, for the indicated missing
carriers.

* Layer 1, §1.2: the fully faithful symmetric monoidal discrete spectral
  embedding, left adjoint to point evaluation, lacks the concrete stable
  spectrum carrier and the enhanced category of light spectral hypersheaves.
* Layer 1, §1.5: the enhanced derived comparison and derived product-tensor
  theorem need the enhanced light solid category and its monoidal structure;
  the pinned ordinary DerivedCategory has no derived tensor.
* Layer 2, §2.1: solidity detected on every homotopy sheaf and the complete
  homotopy t-structure lack light spectral hypersheaves, their null object
  and homotopy sheaves.
* Layer 2, §2.2: connective symmetric monoidal solidification and the free
  spectral measure formula lack the enhanced light solid spectral category,
  its reflection and its spectral internal Hom.
* Layer 2, §2.3: the symmetric monoidal HZ-linear derived comparison and
  bounded-below integer detection lack solid spectra, spectral HZ-modules
  and the enhanced derived light solid abelian category.
* Layer 2, §2.4: the countable sphere-product compact generator and its
  module versions lack spectra, solid spectral tensor and enhanced spectral
  module categories.
* Layer 3, §3.1: the countable product solid tensor comparison lacks the
  sphere and solid spectral tensor.
* Layer 3, §3.3: the independent split-tower tensor and diagonal comparisons
  lack coherent spectral towers and solid spectral tensor.
* Layer 3, §3.4: balancing on solid spectral modules and dualizable scalar
  change through limits lack enhanced spectral algebra/module categories
  and relative solid tensor. The generic bar formalism is supplied by
  EnhancedDerivedSheaves rather than constructed here.
* Layer 4, §4.1: countable limits commuting with omega-one-filtered colimits
  on light spectral sheaves and fixed-algebra modules lack these enhanced
  carriers and their coherent diagram categories.
* Layer 5, §§5.3–5.4: the completed block-sum spectral null-family theorem,
  in every homotopy degree and natural for finite-output block maps, lacks
  connective solid spectral algebras, their marked cofiber towers and
  coherent spectral module completion. A proper-profile predicate alone
  cannot state this theorem.
* Layer 6, §6.1: uniformly bounded-below free solid resolutions lack solid
  spectral module categories, their compact generator and realizations.
* Layer 6, §6.2: the sharp connectivity bound for general scalar quotient
  completion lacks solid spectral modules, spectral homotopy groups and
  coherent cofiber-tower limits.
* Layer 6, §6.3: uniformly bounded-below realization commuting with quotient
  completion, with the skeletal tail bound, lacks the same enhanced module
  and simplicial realization carriers.
* Layer 6, §6.4: the prime-power null-family theorem (with marked spectral
  fibers), the fully faithful prime-completed embedding, bounded-below
  tensor closure and completed-sphere monoidal comparison lack ordinary
  spectra, light solid spectra and coherent derived prime completions.
* Layer 7, §7.2: completed tensor, scalar-extension adjunction and commuting-
  square comparisons lack spectral analytic structures as reflective full
  enhanced module subcategories and their relative solid tensors.
* Layer 7, §7.3: spectral summability localization as an analytic structure,
  including connective preservation, lacks the solid spectral generator,
  spectral analytic structures and enhanced localization functors.
* Layer 7, §7.4: the integer-measure spectral comparison on the specified
  common light presentation diagrams
  lacks the supplier's enhanced analytic-measure module category, the light
  HZ-linear spectral realization and coherent site/cutoff comparisons.

The native site and ordinary light sheaves are usable inputs. The remaining
headlines require more than simple definitions on those carriers.
The spectral, enhanced derived monoidal and analytic constructions themselves
are targets of this roadmap and its named suppliers.
-/

namespace TauCetiRoadmap.SolidAnalyticRings

universe u

open CategoryTheory Limits MonoidalCategory LightProfinite LightCondensed

noncomputable section

/-! ## Layer 1: Light spectral sheaves and the null-sequence test -/

/-- The convergent sequence in universe u, obtained by lifting its compact topology. -/
def liftedSequence : LightProfinite.{u} := by
  letI : SecondCountableTopology (ULift.{u} LightProfinite.NatUnionInfty) :=
    Homeomorph.ulift.secondCountableTopology
  letI : TotallyDisconnectedSpace (ULift.{u} LightProfinite.NatUnionInfty) :=
    Homeomorph.ulift.symm.totallyDisconnectedSpace
  exact LightProfinite.of (ULift.{u} LightProfinite.NatUnionInfty)

/-- On the lifted marked sequence, shift each natural number up by one and fix infinity. -/
def natShift : liftedSequence.{u} ⟶ liftedSequence.{u} :=
  ⟨TopCat.ofHom ⟨ULift.map (OnePoint.map (· + 1)),
    continuous_uliftMap _ (OnePoint.continuous_map continuous_of_discreteTopology
      (by simpa [Filter.coclosedCompact_eq_cocompact, Filter.cocompact_eq_cofinite,
        Nat.cofinite_eq_atTop] using Filter.tendsto_add_atTop_nat 1))⟩⟩

/-- The inclusion of the marked limit point into the lifted convergent sequence. -/
def inftyPoint : LightProfinite.of (ULift.{u} PUnit.{1}) ⟶ liftedSequence.{u} :=
  ⟨TopCat.ofHom (ContinuousMap.const _ (ULift.up OnePoint.infty))⟩

/-- The free light module over the lifted integers on a null sequence, with its limit killed. -/
abbrev nullSeq : LightCondMod (ULift.{u} ℤ) :=
  cokernel ((free (ULift.{u} ℤ)).map (lightProfiniteToLightCondSet.map inftyPoint.{u}))

/-- The endomorphism of the lifted integer null-sequence object induced by the marked shift. -/
def nullShift : nullSeq.{u} ⟶ nullSeq.{u} :=
  cokernel.desc _ ((free (ULift.{u} ℤ)).map
    (lightProfiniteToLightCondSet.map natShift.{u}) ≫ cokernel.π _) (by
    have h : inftyPoint.{u} ≫ natShift.{u} = inftyPoint.{u} := by ext x; rfl
    rw [← Category.assoc, ← Functor.map_comp, ← Functor.map_comp, h]
    exact cokernel.condition _)

/-- The free light module over lifted integers on the convergent sequence is internally
projective in every universe (RC Theorem 2.3.3(3), pp.12–13). -/
theorem internallyProjective_free_liftedSequence :
    InternallyProjective ((free (ULift.{u} ℤ)).obj
      (lightProfiniteToLightCondSet.obj liftedSequence.{u})) := by
  sorry

/-- A light module over lifted integers is solid when one minus shift-precomposition is
invertible on its internal Hom from the null-sequence object (RC Definition 3.2.1, p.16). -/
def IsLightSolid : ObjectProperty (LightCondMod (ULift.{u} ℤ)) := fun B =>
  IsIso (𝟙 ((ihom nullSeq.{u}).obj B) - (MonoidalClosed.pre nullShift.{u}).app B)

/-- The light solid inclusion has a left adjoint, and the countable product of discrete
lifted integers is a solid compact projective generator, with filtered index categories in
Lean universe u+1 (RC Theorem 3.2.4(2),(12), p.17). -/
theorem isLightSolid_reflective_and_generator :
    IsLightSolid.{u}.ι.IsRightAdjoint ∧
      ∃ h : IsLightSolid.{u} (∏ᶜ fun _ : ℕ =>
          (discrete (ModuleCat (ULift.{u} ℤ))).obj (ModuleCat.of (ULift.{u} ℤ) (ULift.{u} ℤ))),
        Projective (⟨_, h⟩ : IsLightSolid.{u}.FullSubcategory) ∧
        IsFinitelyPresentable.{u+1} (⟨_, h⟩ : IsLightSolid.{u}.FullSubcategory) ∧
        IsSeparator (⟨_, h⟩ : IsLightSolid.{u}.FullSubcategory) := by
  sorry

/-- The light solid full subcategory admits a closed symmetric monoidal structure for
which its left-adjoint reflection is symmetric monoidal (RC Theorem 3.2.4(3), p.17). -/
theorem isLightSolid_closed_monoidal_reflection :
    ∃ m : MonoidalCategory IsLightSolid.{u}.FullSubcategory,
      letI := m
      ∃ s : SymmetricCategory IsLightSolid.{u}.FullSubcategory,
        letI := s
        Nonempty (MonoidalClosed IsLightSolid.{u}.FullSubcategory) ∧
          ∃ L : LightCondMod (ULift.{u} ℤ) ⥤ IsLightSolid.{u}.FullSubcategory,
            Nonempty (L ⊣ IsLightSolid.{u}.ι) ∧ Nonempty L.Braided := by
  sorry

/-- For any chosen ordinary derived category of light modules over lifted integers, the
full subcategory with solid cohomology has a left-adjoint reflection
(RC Theorem 3.2.4(5)–(6), p.17). -/
theorem derivedLightSolid_isRightAdjoint [HasDerivedCategory (LightCondMod (ULift.{u} ℤ))] :
    (ObjectProperty.ι (fun K : DerivedCategory (LightCondMod (ULift.{u} ℤ)) =>
      ∀ n : ℤ, IsLightSolid.{u}
        ((DerivedCategory.homologyFunctor (LightCondMod (ULift.{u} ℤ)) n).obj K))).IsRightAdjoint := by
  sorry

end

end TauCetiRoadmap.SolidAnalyticRings
