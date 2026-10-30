# Roadmap: étale duality and perverse sheaves, part II: quasi-excellent finiteness, affine Lefschetz and excellent duality

**Summary.** Extend étale duality from finite-type schemes over fields and excellent regular bases of dimension at most one to noetherian quasi-excellent and excellent schemes. Build the alteration topologies, Cohen–Gabber structure and partial algebraization, weak and prime-to-ℓ local uniformization, and oriented cohomological descent. Use these to prove Gabber's finiteness and affine Lefschetz theorems, the cohomological-dimension bound for arbitrary strictly local noetherian schemes, and existence, biduality and local duality for pinned dualizing complexes on excellent schemes. The local Lefschetz theorem and algebraic tilting of étale cohomology of henselian perfectoid pairs give the concluding applications.

## Scope and ownership

EtaleCohomologyFoundations §§F.0–F.8 and EtaleDualityAndPerverseSheaves §§0.1–0.2, 2.1–2.11 are the base of this Part II. Their constructible categories, six operations, smooth purity, finite-type finiteness and field-base middle perversity are inputs. The extension here treats arbitrary noetherian quasi-excellent bases, dimension functions defined by étale immediate specialization, arbitrary monotone pointwise perversities, and dualizing complexes on excellent schemes admitting a global dimension function. The base stops at separated finite-type schemes over a field and its specified excellent one-dimensional bases; it does not supply these general-base theorems.

Ownership is by mathematical object:

- SchemeAndStackFoundations §§0.12–0.16, 0.20–0.21, 2.12, 2.15–2.16 and 4.16–4.20 own henselization, Elkik's smooth lifting, Popescu, excellence, normalization, Nisnevich covers, ordinary proper descent, alterations, snc divisors and ordinary curve-family alterations. AlgebraicModuliForArithmeticGeometry §§6.0–6.1 own polynomial Artin approximation. Section 0.5 adds the higher-graded comparison of finite-type schemes, with controlled loss of approximation order. ClassicalAdicEtaleCohomology §5.4 owns the marked stable-extension, flattening, marked-section, simultaneous-translate equivariance and nodal-quotient steps of the curve step of its plurinodal alteration theorem (DJ97, Corollary 5.10, p. 618); §2.1 states the single-curve theorem with the étale marking divisor, the exceptional base locus, the control of the boundary Z, generically étale alterations and the birational quotient conclusion over arbitrary excellent integral bases.

- AdicCoefficientsAndComparisonsPartII §§PA.0.2–PA.0.8, PA.0.11, PA.1.2–PA.1.4, PA.4.1–PA.4.8 and PA.5.1–PA.5.4 own maximally dominating morphisms, alterations and their degree conditions, flattening, snc supports, excellent-surface resolution, Riemann–Zariski spaces, logarithmic modifications and stable modifications. Here the new objects are the alteration sites and the quasi-excellent uniformization theorems.

- LefschetzPencilsAndVanishingCycles §0.10 owns absolute cohomological purity, including the closed-point and sheafified cycle-class forms. Both local-purity statements of Česnavičius–Scholze are applications of that theorem, not additional theorem targets. Their perfectoid proof uses §8.6; its arithmetic and geometric examples appear in Layer 7. Sections 0.2–0.5 of the supplier own the trait-oriented product. The trait affine Lefschetz theorem is assigned to its trait-perversity section 6.2 by the exact supplier contract below; §5.5 proves its strict-local consequence. ClassicalAdicEtaleCohomology §5.4 owns the general-base oriented product of small étale topoi of schemes, its site, projections and scheme-point specialization formula. Section 3.1 extends to arbitrary topoi presented by the stated finite-limit sites; its scheme specialization is the supplied construction, identified by the universal property.

- EtaleCohomologyFoundations §§F.0–F.1, 0.7, F.2.1–F.2.2, F.5–F.6 and EnhancedDerivedSheaves §§0.1–0.4 own derived sheaves, tensor–Hom, localization, proper and smooth base change, exceptional inverse image and smooth purity. EtaleDualityAndPerverseSheaves §0.1 owns coefficient duality and §0.2 its all-constructible finite-type extension. The self-injectivity of ℤ/n is supplied by Tau Ceti as `Module.Baer.zmod_self`. The general noetherian dualizing predicate here extends the geometric domain of those duality statements.

- SchemeAndStackFoundations §0.7 and EtaleCohomologyFoundations §F.8 supply finite-type field dimension and middle perversity. Section 5.1 develops étale dimension functions on general locally noetherian schemes. Section 6.5 supplies a t-structure for every monotone perversity on a noetherian scheme; EtaleDualityAndPerverseSheaves §2.11 states only the finite-type-field nonconstructible conditions.

- ArcTopologyAndDescent §§3.6, 8.3, 8.6–8.9, 11.1–11.2, 11.5 and 12.6 own valuation-product components, henselian completion, formal glueing and complete arc descent; §11.2 also owns the splitting of every étale cover of a quasi-compact open in the spectrum of a product of valuation rings with algebraically closed fraction fields. PerfectoidQuotients §§0.4–0.6 own integral perfectoid operations and p-integral closure. PerfectoidQuotientsPartII §§Q5.1–Q5.3, Q6.2 and Q6.3–Q6.7 own the integral multiplicative tilt, product tilts, sharp quotients, completeness transfer under tilting and valuation tilting. Section 8.2 adds the multiplicative identification after inverting ϖ; §8.4 uses the supplied product objects and split-cover theorem to compare their cohomology.

Flat cohomology, virtual dimension and finite flat group schemes belong to PurityForFlatCohomology; there is no dependency on that consumer.

## Conventions

Rings are commutative with identity. A local ring is nonzero, as in Mathlib's `IsLocalRing`. All scheme statements use the native `AlgebraicGeometry.Scheme`; no separatedness is imposed unless stated. Noetherianity is not replaced by finite Krull dimension. Quasi-excellence and excellence have the definitions of SchemeAndStackFoundations §0.21. Coherent topoi and coherent morphisms have the finite-limit and quasi-compactness conventions of AdicEtaleGeometry §§A1.14–A1.15. Sites, diagrams and coefficient modules live in fixed universes; one enlarges the sheaf universe when forming a topos, rather than postulating a set of all schemes or topoi.

For finite cohomology coefficients, n ≥ 1 is invertible on the base and Λ = ℤ/n; q in R^q is a nonnegative integer. Layer 6 uses n ≥ 2, as in ILO XVII, so that the coefficient ring is nonzero. The n = 1 cohomology and all its support groups are zero. Every ℓ-cohomological-dimension statement assumes ℓ prime and invertible on its base. Layer 3 treats torsion abelian coefficients only. Torsion groups in Layer 8 include characteristic-primary torsion. Algebraic tilting allows ℓ = p.

Complexes are cohomologically graded: H^i(K[a]) = Hⁱ⁺ᵃ(K). A discrete module shifted by [2] is in degree −2. Tate twists use EtaleCohomologyFoundations §F.0.3. For a strictly henselian trait, the Kummer boundary of a uniformizer sends 1 to the generator of H²_s(Λ(1)); on a regular surface the two successive codimension-one classes give the generator in degree 4 with twist 2. These witnesses fix the transition direction, shift and twist throughout Layers 3, 5, 6 and 7 (ILO14, XVII §§1–3, pp. 260–280; ILO14 line 12339).

A geometric specialization ȳ ⇝ x̄ means an X-map X_(ȳ) → X_(x̄) of strict henselizations; its codimension is the dimension of the closure of its image in X_(x̄). Write RΓ_x̄(K) for cohomology supported at the closed point of X_(x̄); RΓ_x(K) retains the residue-field étale topos before taking a geometric stalk. A dimension function drops by one under an immediate specialization. On a universally catenary strictly local noetherian scheme it is normalized by δ(t) = dim closure{t}, hence δ(closed point) = 0. A perversity increases under specialization; −2δ is the one used for potential dualizing complexes. Suprema of support dimensions lie in ℤ ∪ {−∞,+∞}; the zero sheaf has value −∞ (ILO14, XIV §§2.1–2.4; ILO14 line 9873).

The symbol ℓ in alteration topologies also admits the formal values 1 and ∞. The allowed degrees are all positive integers for 1, positive integers prime to the prime ℓ, and {1} for ∞. The alteration topology is the case 1. In prime-to-ℓ uniformization and its reductions, ℓ is a prime; the formal values 1 and ∞ only label the topology. A rare closed subset is a nowhere dense one. An snc support is the support of a strict normal crossings divisor on a regular scheme, including the empty divisor. Alteration categories use reductions; over a nonreduced base, the terminal object is its reduction and birational modifications in the standard forms are taken over that reduction (ILO14, II §§1–3; ILO14 line 1221).

In a power-series parametrization the coefficient field is chosen, not prescribed in advance. Generic étaleness of a finite map from a domain R means that the generic fibre over Frac R is a finite étale algebra; equivalently it is étale above some dense open of Spec R. Lower-dimensional components may disappear in the equivariant theorem. For complete local algebra, `IsAdicComplete` includes separatedness. In `PartialAlgebraization`, the base and finite-type model are in the universe of the completed ring; the ideal-index universe is independent. In `PrimeToEllLocalExtension`, the generic degree is the dimension of Frac A ⊗_A B over Frac A, rather than the degree of a residue-field extension (ILO14, IV 2.1.1–2.2.2, V 2.1.1; ILO14 lines 2276, 2419, 2884).

For perfectoid pairs fix a prime p and ϖ with ϖ^p dividing p. Henselianity is the global pair condition along (ϖ). Assume bounded ϖ-power torsion and a perfectoid ϖ-adic completion Â. The tilt A^♭ is the p-power inverse limit of A/ϖ, identified with the tilt of Â; choose ϖ^♭ with sharp a unit multiple of ϖ in Â. The sharp-quotient maps identify A^♭/(ϖ^♭)^p with Â/ϖ^p; Frobenius then gives the unpowered quotient A^♭/ϖ^♭ ≅ A/ϖ. Completion is displayed explicitly in root-power-series examples. A product of rank-one valuation rings can have higher-rank ultraproduct components (CS24 §§2.1.1–2.1.2, 2.2; CS24 lines 400, 827).

## Exact supplier contracts

### From Mathlib

Use the pins of the repository manifest. The native scheme and ring carriers below are the inputs; every additional geometric condition in the layer statements is explicit.

| Module | Declarations and consumed meaning |
| --- | --- |
| `Mathlib.AlgebraicGeometry.Morphisms.FiniteType`, `Proper`, `Etale`; `Mathlib.AlgebraicGeometry.Properties` | `AlgebraicGeometry.LocallyOfFiniteType`, `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.Etale`, `AlgebraicGeometry.IsReduced`; proper includes separatedness and universal closedness, while local finite type alone includes neither. |
| `Mathlib.AlgebraicGeometry.Sites.Etale` | `AlgebraicGeometry.Scheme.smallEtaleTopology`, on the small étale over-category; `Mathlib.AlgebraicGeometry.Sites.AffineEtale` supplies its `CategoryTheory.HasSheafify` instance. The cohomology signature tests torsion on objects of this site satisfying `AlgebraicGeometry.IsAffine` (`Mathlib.AlgebraicGeometry.AffineScheme`). |
| `Mathlib.RingTheory.LocalRing.Defs`, `LocalRing.ResidueField.Defs`, `LocalRing.ResidueField.Basic` | `IsLocalRing`, `IsLocalRing.maximalIdeal`, `IsLocalRing.ResidueField`, `IsLocalRing.residue`, `IsLocalRing.ResidueField.mapEquiv`; local rings are nonzero, and residue-field automorphisms retain the induced residue map. |
| `Mathlib.RingTheory.AdicCompletion.Basic`, `AdicCompletion.Algebra` | `IsAdicComplete`, `AdicCompletion` and its canonical algebra map; completeness means Hausdorffness and precompleteness. |
| `Mathlib.RingTheory.MvPowerSeries.Basic`, `Mathlib.RingTheory.Etale.Basic`, `Mathlib.RingTheory.Localization.FractionRing` | `MvPowerSeries`, `MvPowerSeries.constantCoeff`, `MvPowerSeries.map`, `FractionRing`, `Algebra.Etale`; the last means formal étaleness and finite presentation. |
| `Mathlib.RingTheory.Ideal.MinimalPrime.Basic`, `Mathlib.RingTheory.KrullDimension.Basic`, `Mathlib.Algebra.Module.Torsion.Free` | `minimalPrimes`, `ringKrullDim`, `Module.IsTorsionFree`; ring dimension takes values in extended natural numbers with a bottom value, and equidimensionality is tested on each quotient by a minimal prime. |
| `Mathlib.RingTheory.Henselian`, `RegularLocalRing.Defs`, `Valuation.ValuationRing`, `Perfection` | `HenselianRing`, `HenselianLocalRing`, `IsRegularLocalRing`, `ValuationRing`, `PreTilt`; `HenselianLocalRing` includes `IsLocalRing`; `IsSepClosed` in `Mathlib.FieldTheory.IsSepClosed` expresses separable closedness of its residue field. `HenselianRing` is a pair condition and `PreTilt` is the perfection of reduction modulo p. Perfectoidness and a sharp-quotient theorem are separate inputs. |
| `Mathlib.CategoryTheory.Triangulated.TStructure.Basic`, `Mathlib.CategoryTheory.Sites.SheafCohomology.Basic` | `CategoryTheory.Triangulated.TStructure` and `CategoryTheory.Sheaf.H`; the pointwise étale perversity and normalized scheme duality are the additional constructions in the layers below. |

The mixed-characteristic signature also uses `Algebra.IsEtaleAt` in `Mathlib.RingTheory.Etale.Locus`, `FixedPoints.subring` in `Mathlib.Algebra.Algebra.Subalgebra.Operations`, and `IsPGroup` in `Mathlib.GroupTheory.PGroup`. The first is formal étaleness of the source localization; combined with the stated finite-map hypothesis it detects étaleness at a source prime. The invariant subring is used with its native inclusion. It does not identify arbitrary group quotients with a scheme without a quotient theorem.

### From Tau Ceti

`TauCeti.Algebra.Module.ZMod.Injective`, `Module.Baer.zmod_self`, gives self-injectivity in Baer's form for `ZMod n` with n ≠ 0; Mathlib's `Module.Baer.injective` converts it to injectivity. The geometric all-constructible duality interface is EtaleDualityAndPerverseSheaves §0.1. No Tau Ceti module is needed by the headline signatures in `Suggested.lean`.

### From TauCetiRoadmap.SchemeAndStackFoundations

Sections 0.12–0.14 supply henselian pairs, their henselizations, finite étale invariance and Elkik's lifting of sections of smooth algebras. The finite-algebra completion contract below also includes Elkik's algebraization of finite algebras étale away from the ideal. Section 0.15 supplies Néron–Popescu for regular noetherian ring maps; §§0.16, 0.20–0.21 supply universal catenarity, finite normalization in the Nagata domain and excellent/quasi-excellent permanence under finite type and localization. Section 2.11 supplies the Artin–Schreier sequence used by the characteristic-primary negative control in Layer 4; §§2.12, 2.15–2.16 supply Nisnevich covers, torsion étale continuity, Hochschild–Serre and proper hypercover descent. Sections 4.16–4.20 supply alterations, snc divisors, ordinary nodal families and semistable alterations over traits. No purity theorem is inferred from the word “regular.”

The henselian quasi-excellence and universal catenarity contract at §0.21 includes the following: for every quasi-excellent noetherian local ring A, prove that its henselization and strict henselization are quasi-excellent, and that every henselian quasi-excellent local ring is universally catenary, hence excellent, with no reducedness, normality or finiteness assumption on A.

The sources are ILO14, I Théorème 8.1(iii)–(iv) and the paragraph after it, p. 16 (printed), for henselization and strict henselization (ILO14 line 850), and I Corollaire 6.3(ii), p. 14, with XIV Proposition 1.3.2, p. 209, for catenarity (ILO14 lines 768, 9860). Sections 0.6–0.7, 5.1–5.2, 5.4, 5.6 and 6.1 consume it, wherever a quasi-excellent or excellent scheme is replaced by a henselization or strict henselization; Nagata's catenary, not universally catenary local domain shows that quasi-excellence, not catenarity alone, is what the second clause uses.

The finite-algebra completion contract at §0.14 includes the following: for every noetherian henselian pair (A, I), base change to the I-adic completion Â is an equivalence of categories, on objects and on morphisms, from finite A-algebras étale over Spec A ∖ V(I) to finite Â-algebras étale over Spec Â ∖ V(IÂ).

This is Elkik's algebraization theorem as stated in ILO14, V Théorème 1.2.4, p. 64 (printed); ILO14 line 2877. Section 1.6 consumes its essential surjectivity along a Weierstrass polynomial, and §1.7 also its full faithfulness, to descend a finite-group action. The smooth lifting of §0.14 does not give it: for A the henselization of k[t] at t, I = (t) and char k ≠ 2, the finite Â-algebra k⟦t⟧[z]/(z² − t) is étale away from t but not smooth at its closed point; the equivalence descends it to A[z]/(z² − t) and descends the involution z ↦ −z. Without henselianity it fails: for k[t]_(t) with char k ≠ 2, the connected finite étale algebra k[t]_(t)[z]/(z² − 1 − t) completes to k⟦t⟧ × k⟦t⟧, which has four idempotents instead of two.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

Sections 6.0–6.1 supply polynomial Artin approximation for henselian noetherian local G-rings and its pointed étale form. The equations are solved exactly and the prescribed agreement is modulo a chosen maximal-ideal power. §0.5 uses this for sections of smooth approximating models, and adds the comparison of all higher-graded pieces.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

Section 1.10 supplies strict Cohen rings, truncated formal smoothness and compatible coefficient maps into complete local targets with specified residue map. No perfection or finiteness of the residue field is assumed. The compatible lift can have kernel when the target has p-torsion.

The equicharacteristic coefficient-field contract at §1.10 includes the following: for every complete noetherian equicharacteristic local ring and every chosen lift of a p-basis of its residue field in positive characteristic, provide the compatible coefficient-field section and Cohen power-series presentation, without perfection or finiteness assumptions on that residue field (ILO14, IV 2.1.4, p. 50; ILO14 line 2292).

### From TauCetiRoadmap.AdicCoefficientsAndComparisonsPartII

Use §§PA.0.2–PA.0.8 for maximal dominance, alterations with degree controls, flattening and snc supports; §PA.0.11 for resolution of excellent surfaces; §§PA.1.2–PA.1.4 for Riemann–Zariski spaces and their compact valuative description; §§PA.4.1–PA.4.8 for the shared log-regular carrier, very tame quotients, monoidal desingularization and Gabber's equivariant modifications; and §§PA.5.1–PA.5.4 for stable modifications and equivariance. The uniformization proofs consume those statements, including their admissibility and tameness assumptions.

### From TauCetiRoadmap.AdicEtaleGeometry

Sections A1.14–A1.15 supply coherent-topos conventions, localizations and Deligne's enough-points theorem on small coherent sites in the enlarged sheaf universe. Layer 3 uses these for the pointwise proof of the tube comparison; this is a general coherent-topos input, independent of any analytic-space comparison.

### From TauCetiRoadmap.EnhancedDerivedSheaves

Sections 0.1–0.4 supply the enhancement of derived sheaves of modules on ringed sites, tensor–Hom, inverse and direct image, exact extension by zero and coherent adjunctions. Section E2 supplies bounded-below hypercover descent and totalizations. These operations retain their source and target sites; an abstract derived category is not identified with the constructible étale category merely by notation.

### From TauCetiRoadmap.EtaleCohomologyFoundations

Sections F.0.1–F.0.3, F.1 and 0.7 supply constructible sheaves and complexes, Tate twists and both localization triangles. Sections F.2.1–F.2.2 supply proper base change for torsion coefficients and smooth base change for invertible torsion. Section F.3 supplies proper constructibility, finite-type field/excellent-trait finiteness and affine Artin vanishing. Sections F.5–F.6 supply exceptional inverse image, smooth purity, Gysin maps and fundamental classes. Section F.8 supplies the finite-type-field middle perverse t-structure.

The general-base generic-constructibility contract at §F.3 includes the following: for a finite-type morphism of finite-type schemes over a noetherian base S and a constructible ℤ/n-sheaf with n invertible on S, provide a dense open V of S over which all higher direct images are constructible, eventually zero and compatible with every base change to V, without a properness assumption.

This is the generic-base statement of SGA4half [Th. finitude] 1.9(i)–(ii), p. 236, proof §2, pp. 238–241; SGA4half line 7774. In §4.1 the base is a test closed subscheme Z and the maps Z_p → Z are not necessarily proper.

Use §F.5 for f^! as right adjoint to Rf_! on the finite-cohomological-dimension domain of §F.2, with separated finite-type noetherian geometry as in §F.2.4. Composition is the adjoint of composition of Rf_!. Section 0.7 identifies closed-immersion f^! with the support functor, and §F.6 supplies smooth purity. These ambient operations do not assume a dualizing complex on the base.

### From TauCetiRoadmap.EtaleDualityAndPerverseSheaves

Sections 0.1–0.2 supply self-injective finite-coefficient duality, finite-module evaluation and the all-constructible duality extension over the supplier's finite-type base. Sections 1.1, 2.2, 2.4 and 2.11 supply supported classes, recollement and comparison with the finite-type middle-perversity conditions. A finite ℤ/n-module need not be projective or of finite Tor dimension.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

Sections 0.2–0.5 supply the trait-oriented product and its Milnor-tube stalk formula. Section 0.10 supplies the fundamental-class isomorphism i^!Λ ≅ Λ(−c)[−2c] for regular closed immersions of regular noetherian schemes with c pure codimension and n invertible. For an snc complement it supplies R¹j_*Λ as the sum of boundary Tate lines and R^qj_*Λ as its q-th exterior power. The local closed-point statement applies without excellence. Its sheafified form is concentrated in degree 2c; ordinary support cohomology can have higher terms from residue-field cohomology. A strict trait has H²_s(Λ(1)) = Λ and a strict regular surface has H⁴_s(Λ(2)) = Λ, fixing the same normalization as Layer 6.

The trait affine-Lefschetz contract at §6.2 includes the following: for a trait S with δ_S(η) = 1 and δ_S(s) = 0, a finite-type S-scheme X, an affine finite-type f : Y → X, n invertible on S and a constructible ℤ/n-sheaf F on Y, prove δ_X(R^q f_*F) ≤ f^*δ_X(F) − q for every q, with δ_X induced from δ_S, independently of quasi-excellent affine Lefschetz.

The source is Ill03, Théorème 2.4 (cited through ILO14), as recalled in ILO14, XV 1.1.3 and 3.3.2, pp. 219, 224; ILO14 lines 10337, 10557. Section 6.2 supplies the trait-perversity setting; the additional contract here is the independent affine support bound itself.

### From TauCetiRoadmap.ArcTopologyAndDescent

Section 3.6 supplies ultraproduct components of products of valuation rings, with no rank bound on the components. Sections 8.3 and 8.6–8.9 supply henselian rigidity, formal glueing and completion comparison for torsion étale cohomology, including support complexes. Sections 11.1–11.2 and 11.5 supply the I-complete arc topology, the product-of-complete-aic-valuations basis and complete/punctured étale hyperdescent for finitely generated I. In particular, §11.2 supplies that every étale cover of a quasi-compact open in the spectrum of a product of valuation rings with algebraically closed fraction fields has a section; this input needs neither perfectoidness nor a rank bound on the ultraproduct components (CS24, Lemma 2.2.4, pp. 19–20; CS24 lines 774–797). Section 12.6 supplies invariance of these covering conditions under tilting. In Layer 7 completion comparison is applied to cohomology with closed support before reducing to complete regular local rings; it is not an unrestricted assertion about every principal open of a merely local ring.

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

Section 5.4 supplies `OrientedEtaleProduct` for scheme maps X → S ← Y, its projections and specialization two-cell, the site including Cartesian refinements of the middle neighborhood, and its universal property. It also supplies the scheme-point and shred descriptions and the coherent qcqs case. §3.1 uses that scheme object and proves agreement with the oriented product for general finite-limit sites; §§3.2–3.6 add the coherent-topos tube theorem and alteration-diagram descent. The same section supplies the curve step of its plurinodal alteration theorem (DJ97, Corollary 5.10, p. 618; DJ97 line 699): marked stable extension of a generic pointed curve after alteration, flattening and marked sections, preservation of finite group actions by simultaneous translates, and nodality of quotients of projective nodal curves over normal excellent bases; §2.1 uses it and adds the boundary control, generic étaleness and birational quotient conclusion. No nearby-cycle constructibility theorem from this supplier is used to prove Gabber finiteness.

### From TauCetiRoadmap.PerfectoidQuotients

Sections 0.4–0.6 supply bounded torsion, the torsion-free quotient, p-integral closedness, completed ind-étale and henselian extensions, products and their tilts. The integral perfectoid predicate is the common one of PerfectoidSpaces §P1.24, as specified by this supplier. Layer 8 uses its ordinary ϖ-adic completions and does not identify them with derived completions without a comparison.

### From TauCetiRoadmap.PerfectoidQuotientsPartII

Sections Q5.1–Q5.3 supply the multiplicative p-power inverse limit, products, sharp quotients and completeness of the tilt. Section Q6.2 supplies the transfer of classical adic completeness along tilting, under its hypothesis that ϖ^♭ divides the image of ξ_0. Sections Q6.3–Q6.7 supply tilting of p-adically complete and perfectoid valuation rings, completeness of their localizations and preservation of algebraically closed fraction fields. The sharp quotient has exponent p before applying Frobenius. The induced equality of quotient spectra determines the closed complements used in Layer 8.

## How to read the build

Layer 0 builds the alteration sites and approximation, using polynomial Artin approximation as an input. Layer 1 builds Cohen–Gabber and partial algebraization. Together they feed Layer 2 uniformization. Layer 3 builds oriented descent, and Layer 4 combines it with uniformization for finiteness. Layer 5 proves regular base change before the regular-morphism transport rule, then affine Lefschetz and cohomological dimension. In Layer 6 first prove the formal open-immersion exchange in §6.8 from the supplied operations. Construct immediate transitions and regular pinned complexes before the joint top-class/higher-transition induction; that induction uses only the regular case of the pinned construction, not general existence or biduality. Next construct the pointwise perverse heart, glue potential dualizing complexes, and prove biduality and local duality. Layer 7 uses Layers 5–6 for local Lefschetz. Layer 8 is independent of the quasi-excellent build and supplies algebraic tilting. Each Needs clause distinguishes statement inputs from the inputs of the indicated proof route. The six headline signatures in `Suggested.lean` test Cohen–Gabber, partial algebraization and Gabber’s cohomological-dimension bound on native carriers; its module docstring identifies the geometric headlines whose carriers require the supplied library development.

## Layer 0: Topologies of alterations and approximation

Construct the alteration sites and the reductions from quasi-excellent schemes to complete local rings. The approximation comparison retains thickened normal cones, rather than only an isomorphism of closed fibres.

### 0.1 The category alt/S of maximally finite dominant schemes

Let S be a noetherian scheme and ℓ a prime, the integer 1 or the symbol ∞ (with ℓ′ the set of positive integers prime to ℓ, and ∞′ = {1}). A morphism f : X → Y is maximally dominant if it sends every maximal point (generic point of an irreducible component) of X to a maximal point of Y; it is maximally ℓ′-finite if for every maximal point η of X the extension κ(η)/κ(f(η)) is finite and every maximal point μ of Y in the image of f has a maximal point η above it with [κ(η) : κ(μ)] ∈ ℓ′ (maximally finite when ℓ = 1, where the second condition is empty). alt/S is the category whose objects are reduced S-schemes of finite type whose structure map is maximally finite and maximally dominant, with S-morphisms as morphisms. For X of finite type over S, X^md is the closure of the image of the generic fibre X ×_S η_S with its reduced structure (the union of the irreducible components of X dominating a component of S). Fibre products in alt/S are X ×^alt_S Y := (X ×_S Y)^md. (ILO14, Exposé II, §1, Definitions 1.1.2, 1.1.8 and 1.2.2, 1.2.5, Proposition 1.2.6, pp. 23–26 (printed); ILO14 line 1221).

S noetherian; objects reduced and of finite type over S. Maximal dominance is the notion of AdicCoefficientsAndComparisonsPartII §§PA.0.2–PA.0.8, PA.0.11; ℓ′-finiteness at maximal points refines its ℓ′-alterations to non-proper morphisms.

Its interface consists of the following facts.

- The category alt/S for a noetherian scheme S.

- The functor T ↦ T^md on finite-type S-schemes is right adjoint to the inclusion of reduced maximally dominant finite-type S-schemes. Its value lies in alt/S when T has finite generic fibres; no generic-finiteness assertion holds for arbitrary T (ILO II 1.2.5).

- alt/S has fibre products, computed as (X ×_S Y)^md.

- S_red is a final object of alt/S.

- For a flat S′ → S with S′ locally noetherian, X ↦ (X ×_S S′)_red defines a functor alt/S → alt/S′ (ILO II 1.2.3).

- The predicate of maximal ℓ′-finiteness of a morphism, stable under base change in alt (ILO II 1.2.7) and composition.

- For reduced maximally dominant U of finite type over S, every S-map U → T factors uniquely through T^md → T. This gives the fibre-product universal property after applying md to an ordinary product of objects of alt/S.

A proof route is as follows. Define the subcategory and the functor T ↦ T^md on finite-type S-schemes; T^md is right adjoint to the inclusion of reduced maximally dominant finite-type S-schemes (ILO II 1.2.5). Existence of fibre products in alt/S: apply (−)^md to the ordinary fibre product and use the adjunction (ILO II 1.2.6). Every morphism of alt/S is maximally finite dominant (ILO II 1.1.10), and S_red is final (ILO II 1.2.3).

*Needs:* AdicCoefficientsAndComparisonsPartII §§PA.0.2–PA.0.8, PA.0.11; Mathlib `AlgebraicGeometry.LocallyOfFiniteType`; Mathlib `AlgebraicGeometry.IsReduced`.

**Checks.**

- For S = Spec k with k a field, S is final in alt/S and every object is finite over k: it is reduced of finite type and its maximal points have residue fields finite over k, so it has dimension zero.

- For S = 𝔸²_k and X = Bl_0 𝔸², the ordinary fibre product X ×_S X has an irreducible component over the exceptional locus that does not dominate S; X ×^alt_S X is the closure of the diagonal generic part.

- For S = 𝔸¹_k, the inclusion of the origin is of finite type and reduced but not maximally dominant, so it is not an object of alt/S.

- For integral schemes X and S and a proper surjective morphism X → S, X is an object of alt/S exactly when X → S is an alteration (AdicCoefficientsAndComparisonsPartII §PA.0.3).

- For S = Spec k, T = 𝔸¹_k has T^md = T but is not in alt/S: its generic field k(t) is not finite over k. Taking the md part does not impose generic finiteness.

### 0.2 The topology of ℓ′-alterations

Let S be noetherian and ℓ as in §0.1. An étale covering (X_i → X) is ℓ′-decomposed if every point x of X lifts to a point x_i of some X_i with [κ(x_i) : κ(x)] ∈ ℓ′ (for ℓ = 1 an ordinary étale covering, for ℓ = ∞ a Nisnevich covering). The topology alt_ℓ′ of ℓ′-alterations on alt/S is the Grothendieck topology generated by (i) ℓ′-decomposed étale coverings and (ii) single morphisms that are proper, surjective and maximally ℓ′-finite. alt_1′ is the alteration topology alt. A hypercovering for alt_ℓ′ of X is a simplicial object X_• of alt/X with X_0 → X an alt_ℓ′-covering and whose maps Xₙ₊₁ → (cosk_n X_•)ₙ₊₁ are alt_ℓ′-coverings. (ILO14, Exposé II, §2.1 and Definition 2.3.1, Remark 2.3.2, 2.3.3–2.3.4, pp. 26–28 (printed); ILO14 line 1374).

The generating families are not closed under composition (ILO II 2.3.2); the topology is the one they generate. Condition (i) is imposed at every point, condition (ii) only at maximal points.

Its interface consists of the following facts.

- The Grothendieck topology alt_ℓ′ on alt/S, with alt = alt_1′.

- Every ℓ′-decomposed étale covering is alt_ℓ′-covering.

- Every proper surjective maximally ℓ′-finite morphism is alt_ℓ′-covering.

- Coverings pull back to coverings along flat S′ → S with S′ locally noetherian.

- alt_ℓ′ is coarser than alt: every alt_ℓ′-covering is an alt-covering; Nisnevich coverings are alt_ℓ′-coverings for every ℓ.

- An augmented simplicial object of alt/X with X_0 → X covering and every matching map Xₙ₊₁ → (cosk_n X_•)ₙ₊₁ covering, for n ≥ 0.

A proof route is as follows. Check that the families (i) and (ii) are stable under base change in alt/S (ILO II 1.2.7, 2.1.1) and define the generated topology (ILO II 2.3.1). Flat base change of coverings along S′ → S with S′ locally noetherian (ILO II 2.3.4). Hypercoverings are defined as for any site, using the hypercover construction of EnhancedDerivedSheaves §E2.

*Needs:* §0.1; Mathlib `AlgebraicGeometry.Etale`; Mathlib `AlgebraicGeometry.IsProper`; SchemeAndStackFoundations §§2.12, 2.15–2.16.

**Checks.**

- For ℓ odd, the finite flat map Spec ℤ[i] → Spec ℤ of generic degree 2 is proper, surjective and maximally ℓ′-finite, hence alt_ℓ′-covering.

- Spec ℤ[i] → Spec ℤ is not alt_2′-covering: every alt_2′-covering of Spec ℤ has, over the generic point, a point whose residue field has odd degree over ℚ, and no such field contains ℚ(i).

- For ℓ = 1 the condition on degrees is empty, so every proper surjective generically finite map of integral schemes is alt-covering (e.g. Frobenius of 𝔸¹ over 𝔽_p).

- The inclusion 𝔾_m → 𝔸¹ is not an alt-covering of 𝔸¹: the origin is not in the image of any refinement.

- For ℓ = ∞, condition (i) is the completely decomposed (Nisnevich) covering condition of SchemeAndStackFoundations §2.12.

### 0.3 Standard forms of alteration coverings

Let X be irreducible, noetherian and quasi-excellent, and let ℓ be a prime or 1; form the alteration category over X_red. (1) Every alt_ℓ′-covering family of X is refined by a family (V_i → Y → X)_i in which Y is integral, Y → X is proper, surjective, of generic degree prime to ℓ, and (V_i → Y)_i is a Nisnevich covering; for ℓ = 1 one may take (V_i → Y) a Zariski covering. (2) Every alt_ℓ′-covering family of X is refined by a family (W_i → V_i → Y → X)_i of irreducible schemes in which Y → X_red is a proper birational modification, followed by X_red → X, (V_i → Y) is a Nisnevich covering and each W_i → V_i is finite, flat and of degree prime to ℓ. For reducible X apply (2) to the disjoint union of the irreducible components. (ILO14, Exposé II, Proposition 3.1.1, Théorèmes 3.2.1 and 3.2.3, pp. 28–31 (printed); ILO14 line 1414).

X noetherian, irreducible, quasi-excellent (quasi-excellence is used for the reduction; ILO II 3.2.1 expects it to be superfluous).

A proof route is as follows. Étale case: an ℓ′-decomposed étale covering is dominated by a Nisnevich covering of a finite maximally ℓ′-finite surjective Y → X; pass to a normal limit with pro-ℓ absolute Galois group, where ℓ′-decomposed étale maps are completely decomposed (ILO II 3.1.1). Proper case and composition: combine (i) and (ii) using the exchange of a finite flat map of degree prime to ℓ with a Nisnevich covering after henselization (ILO II 3.2.1–3.2.3). Flatten Y → X by an admissible blow-up (Raynaud–Gruson; AdicCoefficientsAndComparisonsPartII §§PA.0.2–PA.0.8, PA.0.11) to obtain the birational-then-finite-flat form (2).

*Needs:* §0.2; SchemeAndStackFoundations §0.21; AdicCoefficientsAndComparisonsPartII §§PA.0.2–PA.0.8, PA.0.11; SchemeAndStackFoundations §§0.12–0.16, 0.21.

**Checks.**

- For X the spectrum of an integral henselian local ring and a covering by a single finite flat map with integral source and degree prime to ℓ, form (2) is the map itself with Y = X and V = X. The integrality assumptions put these schemes in the irreducible standard form.

- The standard form of a Zariski covering is itself (Y = X).

### 0.4 Valuative characterisation of alteration coverings

Let X be noetherian and Y → X an object of alt/X. Then Y → X is a covering for the alteration topology if and only if every maximally dominant morphism Spec V → X, with V a valuation ring whose fraction field is algebraically closed, lifts to a morphism Spec V → Y. For a prime ℓ, the analogue for alt_ℓ′ replaces the algebraically closed fraction field by a perfect field whose absolute Galois group is a pro-ℓ group (the quotient of the geometric generic point by an ℓ-Sylow subgroup). (ILO14, Exposé II, Théorème 4.2.1 and Remarque 4.2.2, p. 32 (printed); ILO14 line 1571; ILO-final-II, Théorème 4.2.1 and Remarque 4.2.2, pp. 33–34; ILO-final-II line 485).

X noetherian; V ranges over valuation rings with the stated fraction fields; the map Spec V → X is maximally dominant.

A proof route is as follows. Necessity: proper surjective generators lift over a valuation ring with algebraically closed fraction field by the valuative criterion and lifting of the generic point; an étale cover lifts because such a valuation ring is strictly henselian (ILO II 4.2.1). Sufficiency: normalize integral components, use the quasi-compact Riemann–Zariski space to select finitely many local lifts, and descend these lifts from the algebraic closure of the generic field to a finite extension and a proper modification. Their finite open covering gives an alteration refinement (published ILO II 4.2.1, pp. 33–34). This argument does not assume quasi-excellence. For the prime-to-ℓ variant use the fixed field of an ℓ-Sylow subgroup of the absolute Galois group and the same argument, as in II 4.2.2.

*Needs:* §0.2; AdicCoefficientsAndComparisonsPartII §§PA.1.2–PA.1.4; Mathlib `ValuationRing`.

**Checks.**

- The open immersion 𝔾_m → 𝔸¹ fails the criterion: a valuation ring centred at the origin does not lift; Spec ℤ[i] → Spec ℤ satisfies it for alt.

- For X the spectrum of an excellent DVR, the normalisation of X in any finite extension of its fraction field is finite and surjective, hence an alteration covering; the criterion reduces to extension of valuations (SchemeAndStackFoundations §§0.20–0.21).

- For the non-Japanese DVR of SchemeAndStackFoundations §0.22, a finite inseparable fraction-field extension has non-finite integral closure. This normalisation is not of finite type: an integral finite-type algebra is finite. It is not an object of alt/X, so the criterion has no such input.

### 0.5 Approximation of schemes over a complete local ring

Let A be an excellent henselian noetherian local ring with completion Â, S = Spec A, Ŝ = Spec Â, and write Ŝ = lim_α S_α with S_α smooth over S (Popescu). Let X be of finite type over Ŝ with a model X_(α0) over S_(α0). There are α1 ≥ α0 and integers n0 ≥ c > 0 such that for every n ≥ n0, α ≥ α1 and every section u of S_α → S that is (n+1)-close to the canonical map Ŝ → S_α, the pulled-back scheme X_u over S is (n+1−c)-isomorphic to X above the closed fibre (an approximation of order n − c). If X and Y are a-close at a point x of their common closed fibre, then (i) for a ≥ 1 they have the same dimension at x, and (ii) for a ≥ 2, X is regular at x iff Y is; (iii) if X is regular, every sufficiently fine approximation X_u is regular in an open neighbourhood of its closed fibre. (ILO14, Exposé III, Définition 4.2, Théorème 5.1, Définition 5.2 and Corollaire 5.4, pp. 39, 41–43 (printed); ILO14 line 1958).

A excellent henselian noetherian local. For a ≥ 1 and schemes X, Y over the same local base S (or Ŝ), let I, J be their closed-fibre ideals. An a-isomorphism consists of an isomorphism over the base φ : X_(a−1) ≅ Y_(a−1) of the infinitesimal fibres defined by I^a and J^a, together with an isomorphism φ⁻¹gr^a(O_Y) ≅ gr^a(O_X) of graded algebras over the base graded algebra gr^a(A) (respectively gr^a(Â)), compatible in degree zero with φ. Here gr^a_n = I^n/Iⁿ⁺ᵃ, respectively J^n/Jⁿ⁺ᵃ, for all integer n, with I^n = O and J^n = O for n ≤ 0 (ILO III 4.2, p. 39; ILO14 line 1887). Agreement of a truncated ordinary associated graded alone is insufficient.

Its interface consists of the following facts (ILO III 4.2, p. 39; ILO14 line 1887).

- For a ≥ 1, the identity of X_(a−1) and of gr^a(O_X) gives an a-isomorphism from X to itself over the base graded algebra.

- The inverse infinitesimal-fibre and graded-algebra maps of an a-isomorphism X → Y give an a-isomorphism Y → X, preserving the base structure and degree-zero compatibility.

- Composing the infinitesimal-fibre maps and the pulled-back graded-algebra maps of a-isomorphisms X → Y and Y → Z gives an a-isomorphism X → Z over the same base; this composition is associative and has the identity maps above as units.

A proof route is as follows. Popescu's theorem writes the regular map A → Â as a filtered colimit of smooth A-algebras (SchemeAndStackFoundations §0.15, Néron–Popescu desingularization). Artin approximation gives sections u of S_α → S close to the canonical map; compare graded pieces gr^n of X and X_u via the Tougeron–type estimate of ILO III Proposition 4.5 to obtain the (n+1−c)-isomorphism (ILO III 5.1). Dimension and regularity are read from the normal cone and the Zariski tangent space, which are determined by low-order graded pieces (ILO III Corollaire 5.4).

*Needs:* SchemeAndStackFoundations §§0.12–0.16, 0.21; Mathlib `IsAdicComplete`; AlgebraicModuliForArithmeticGeometry §§6.0–6.1.

**Checks.**

- For X = Ŝ itself with the model X_α = S_α, every approximation X_u is S, and the closed fibres agree to all orders.

- For X = Spec Â[t]/(t² − a) with a a unit and 2 invertible, the approximations Spec A[t]/(t² − a_u) with a_u close to a are étale over S. If A is also regular they are regular; étaleness alone does not make a singular base regular.

- Over S = Spec k⟦t⟧, take X = S and Y = Spec k. Their closed fibres both equal Spec k, but for a = 1 their degree-one graded pieces are (t)/(t²) ≅ k and 0. They are not 1-isomorphic. The identity of X gives k ≅ k in degree one; a definition retaining only the closed fibre would wrongly identify X and Y.

### 0.6 Reduction of uniformization to local henselian excellent normal schemes

Consider the uniformization statement U(X): for every nowhere dense closed Z ⊂ X there is a finite family (X_i → X) covering for alt (resp. alt_ℓ′, ℓ invertible on X) with each X_i regular and connected and each preimage of Z the support of a strict normal crossings divisor (possibly empty). If U(X) holds for every noetherian local henselian excellent normal scheme X (resp. of dimension ≤ d), then U(X) holds for every noetherian quasi-excellent scheme X (resp. of dimension ≤ d). (ILO14, Exposé II, Théorèmes 4.3.1–4.3.2 and Proposition 4.3.3, p. 33 (printed); ILO14 line 1626).

Z nowhere dense (rare) closed; snc supports in the sense of AdicCoefficientsAndComparisonsPartII §§PA.0.2–PA.0.8, PA.0.11.

A proof route is as follows. Normalisation is an alt_ℓ′-covering and preserves rareness of Z, so reduce to X normal integral. For x ∈ X the henselisation X_(x) is quasi-excellent and henselian, hence excellent (SchemeAndStackFoundations §0.21, the henselian quasi-excellence and universal catenarity contract), and normal because henselization is a regular map (SchemeAndStackFoundations §0.21), with Z_(x) rare; a uniformizing family over X_(x) is dominated by a standard covering (§0.3) which spreads out to an étale neighbourhood of x by limit arguments. Noetherian induction and quasi-compactness assemble the local families (ILO II 4.1.1–4.1.2, 4.3.3).

*Needs:* §0.3; SchemeAndStackFoundations §§0.12–0.14; SchemeAndStackFoundations §0.21, the henselian quasi-excellence and universal catenarity contract; AdicCoefficientsAndComparisonsPartII §§PA.0.2–PA.0.8, PA.0.11; SchemeAndStackFoundations §§0.12–0.16, 0.21.

**Checks.**

- For regular connected X and an snc support Z, the identity family witnesses the instance (X, Z) of U. For disconnected noetherian regular X, use the finitely many connected components; this checks the connected-source requirement without asserting U for every rare Z.

- For X empty, the only closed subset is Z = ∅ and the empty family is covering, since no point needs a lift; U(∅) holds with zero members. A definition demanding a nonempty family would fail here.

- For X = Spec k[x,y]/(xy) and Z its node, the identity family fails because X is not regular at the node. The normalisation, two copies of 𝔸¹_k mapping to the two branches, is finite, surjective and birational on each component, hence alt-covering; each line is regular and connected and the preimage of Z in each is one reduced point, an snc support. The witness has two members.

- For X = Spec(k × k), two points, and Z = ∅, no single connected source can cover both open-and-closed points, while the two inclusions of the points do. The connected-source requirement forces at least two members here, and the two inclusions attain that minimum; a family repeating the first inclusion alongside both inclusions has three members and is also covering, since covering families need not be minimal.

### 0.7 Reduction of uniformization to complete local rings

If the uniformization statement U(T) of §0.6 (for alt, resp. alt_ℓ′ with ℓ invertible) holds for every noetherian complete local scheme T, then it holds for every noetherian quasi-excellent scheme T. (ILO14, Exposé III, Théorème 6.1 and Proposition 6.2, p. 43 (printed); ILO14 line 2064).

Uniformization for complete local rings is assumed in the relevant topology; ℓ invertible for the prime-to-ℓ version.

A proof route is as follows. By §0.6 reduce to T local, excellent and henselian (a henselian quasi-excellent local scheme is excellent: SchemeAndStackFoundations §0.21, the henselian quasi-excellence and universal catenarity contract). Uniformize the completion T̂; approximate the finitely many regular schemes and snc divisors of the family by models over T using §0.5, keeping regularity near the closed fibre and keeping each branch equation part of a regular system of parameters, so that the approximated divisors remain snc with the same branches. Check the approximated family is still covering using the standard forms (§0.3) and the valuative criterion.

*Needs:* §0.6; §0.5; §0.3; §0.4; SchemeAndStackFoundations §0.21, the henselian quasi-excellence and universal catenarity contract.

**Checks.**

- For T complete the statement is the hypothesis itself.

- For T = Spec of the henselisation of 𝔸²_k at the origin and Z = V(xy(x − y)), the family produced from the blow-up of the completion descends to the blow-up of T.

### Examples

For S = Spec k, every alteration object is a finite reduced k-scheme. Over 𝔸²_k the two blow-ups at the origin have an extra ordinary-product component over the exceptional curve; taking the maximally dominant part discards it. Over the henselization of 𝔸² at the origin, the blow-up resolving the boundary xy(x − y) descends from the same blow-up over the completion. These examples distinguish generic finiteness, dominance and approximation (ILO14, II 1.2.4, III §6).

### Dependencies

SchemeAndStackFoundations §§0.12–0.16, 0.21, 2.12, 2.15; AlgebraicModuliForArithmeticGeometry §§6.0–6.1; AdicCoefficientsAndComparisonsPartII §§PA.0.2–PA.0.8, PA.1.2–PA.1.4.

## Layer 1: Cohen–Gabber structure and partial algebraization

Build finite generically étale power-series parametrizations, then algebraize complete local rings and finite families of ideals over smaller regular complete local bases. Finite extensions and coefficient choices remain visible.

### 1.1 The Cohen–Gabber theorem in characteristic p

Let A be a complete noetherian local ring of equal characteristic p > 0 that is reduced and equidimensional of dimension d, with residue field k. There is a subring A_0 ⊆ A isomorphic to k⟦t_1, …, t_d⟧ such that A is finite and torsion-free over A_0 and generically étale over it (étale over a dense open of Spec A_0), and A_0 → A induces an isomorphism on residue fields. The native signature is `cohenGabber_equalCharacteristic`: its coefficient field is the native residue field of A, its residue equation is residue composed with the power-series map equals constant coefficient, and generic étaleness is the finite étale algebra Frac(k⟦t⟧) ⊗_(k⟦t⟧) A. (ILO14, Exposé IV, Théorème 2.1.1 and its proof §§2.1.3–2.1.12, pp. 50–53 (printed); ILO14 line 2276).

Equal characteristic p > 0 (in characteristic 0 Cohen's theorem with separable Noether normalisation already gives the conclusion). Equidimensional: every minimal prime 𝔭 has dim A/𝔭 = d.

A proof route is as follows. Choose a p-basis of k and lift it; this determines a coefficient field κ ⊂ A (Cohen's structure theorem, DeformationAndDerivedPatchingAlgebra §1.10). Show that for a suitable choice of the lifts the completed module of differentials Ω̂¹_(A/κ) has generic rank d on every irreducible component (ILO IV 2.1.4–2.1.11). Choose parameters t_1, …, t_d whose differentials span generically; then A is finite over κ⟦t⟧ and generically étale (ILO IV 2.1.12).

*Needs:* DeformationAndDerivedPatchingAlgebra §1.10 and the coefficient-field contract; Mathlib `MvPowerSeries`; Mathlib `IsAdicComplete`; Mathlib `IsReduced`.

**Checks.**

- For A = k⟦x, y⟧/(y² − x³) with p ≠ 2, 3, A_0 = k⟦x⟧ works: A is free of rank 2 over it and étale where x ≠ 0.

- For A = 𝔽_p(s)⟦x⟧ with s transcendental, A_0 = A with t_1 = x; the naive choice k⟦x^p⟧ is finite but not generically étale.

- For p = 2 the parametrization t ↦ y of k⟦x,y⟧/(y² − x³) has generic equation x³ = y² with derivative x² ≠ 0 at the generic point, hence degree 3 is separable; for p = 3, t ↦ x has derivative 2y ≠ 0 and generic degree 2. The theorem includes both characteristics.

- In dimension 0 a reduced complete local ring is its residue field, and the zero-variable power-series parametrization has degree 1. The zero ring is excluded by local-ring nontriviality.

### 1.2 Equivariant Cohen–Gabber theorem

Let A be a complete noetherian local reduced ring of equal characteristic, of dimension d, with residue field κ, and let a finite group G act on A with |G| invertible in κ. There is a G-equivariant finite generically étale morphism κ⟦t_1, …, t_d⟧ → A, where κ → A lifts the identity of κ and G acts trivially on the t_i. Here generic étaleness means étaleness over a dense open of the power-series target; lower-dimensional components of Spec A can disappear over that open. The native signature `cohenGabber_equivariant` expresses equal characteristic by a field algebra F → A, allows the G-action to move that coefficient field, and uses the induced residue-field automorphisms coefficientwise on k⟦t⟧. The residue equation is again constant coefficient, and no torsion-freeness assertion is made in this nonequidimensional form. (ILO14, Exposé IV, Théorème 2.2.2 and §§2.2.3–2.2.6, pp. 53–55 (printed); ILO14 line 2419).

|G| invertible in κ; equal characteristic (A contains a field).

A proof route is as follows. Set B = A^G and λ = κ^G; B is complete local noetherian and A is finite over B (ILO IV 2.2.3). Its dimension is d, but B need not be equidimensional. Let I be the intersection of the minimal primes of B having dimension d. Apply the non-equivariant theorem to the reduced equidimensional quotient B/I (or Cohen structure in characteristic zero). Lift its coefficient field and parameters to B, as in IV 2.2.4–2.2.5, obtaining a finite parametrization generically étale over its target. Extend λ to the finite separable residue extension κ, lift this extension étale-locally with its G-action, and map κ⟦t_1,…,t_d⟧ equivariantly into A. The generic field extensions of A over the invariants are separable; the resulting parametrization is finite and étale over a dense target open (IV 2.2.6, pp. 54–55).

*Needs:* §1.1; DeformationAndDerivedPatchingAlgebra §1.10 and the coefficient-field contract.

**Checks.**

- For G trivial and A equidimensional in positive characteristic, this is the non-equivariant theorem; the general reduced case uses its maximal-dimensional quotient.

- For A = k⟦x⟧ with G = μ_2 acting by x ↦ −x (char k ≠ 2), one can take t = x²: the map k⟦t⟧ → A is finite, equivariant and étale where x ≠ 0.

- For a finite non-abelian group S₃ acting by permuting x₁,x₂,x₃ on k⟦x₁,x₂,x₃⟧ with char k not 2 or 3, the elementary symmetric functions are invariant parameters; the generic field extension has degree 6. This tests the theorem beyond cyclic actions.

- For char k = 2, the order-2 action on k⟦x⟧ given by x ↦ x/(1+x) has 2 = 0 noninvertible; the tame-order hypothesis does not hold even though the group action exists.

### 1.3 Epp's theorem on eliminating wild ramification

Let T → S be a local dominant morphism of complete traits of residue characteristic p > 0, with residue fields κ_S perfect and the maximal perfect subfield of κ_T algebraic over κ_S. There is a finite extension of traits S′ → S such that the normalisation of the reduced fibre product, T′ = ((T ×_S S′)_red)^norm, has reduced special fibre over S′. In mixed characteristic T ×_S S′ is already reduced. (ILO14, Exposé IV, Théorème 3.1.2 and Remarque 3.1.3, p. 55 (printed), citing Epp 1973, Theorem 1.9; ILO14 line 2524; K10, pp. 1–3, correction to the equal-characteristic case of Epp’s Theorem 1.3; K10 line 88).

Complete traits; κ_S perfect; the perfect part of κ_T algebraic over κ_S.

A proof route separates residue-field stability from ramification elimination. Prove that the maximal perfect subfield commutes with separable closure, that the Epp residue-field condition is transitive and stable under finite extensions, and that fraction fields of complete local coefficient algebras satisfy it (ILO IV 3.2.2–3.2.3, pp. 55–56; ILO14 lines 2545, 2569). These reductions control the residue extensions in Epp's complete-DVR argument (Epp73, §§0–1, Theorems 1.3 and 1.9, cited through ILO14 and K10). For its equal-characteristic p-cyclic step, use Cohen coefficient presentations and an Artin–Schreier equation with a finite negative Laurent part. After a finite ramified base extension and changes z ↦ z − d, combine all terms with equal exponents before testing their coefficients for p-th powers. Repetition strictly reduces the finite set of offending coefficients when cancellation occurs; the final case can have a separable Artin–Schreier residue extension (K10, pp. 1–3; K10 lines 23, 30, 90–113). In mixed characteristic the fibre product is already reduced: flatness over S′ and separability of the characteristic-zero generic fibre give this directly (ILO IV 3.1.3; ILO14 line 2531).

*Needs:* DeformationAndDerivedPatchingAlgebra §1.10 and the coefficient-field contract; SchemeAndStackFoundations §§0.12–0.16, 0.21.

**Checks.**

- If T → S is unramified with separable residue field extension, S′ = S works.

- In mixed characteristic T ×_S S′ is reduced, so only normalisation is needed (ILO IV Remarque 3.1.3).

- In characteristic 2 take K = 𝔽₂ and L = 𝔽₂(u). In z² − z = u²π⁻² + uπ⁻¹, replacing z by z − uπ⁻¹ gives z² − z = 0. The negative part cancels completely, so the transformed algebra splits; a rule demanding a non-p-th-power leading coefficient in every nonempty original negative part would fail (K10 lines 90–109).

### 1.4 The Cohen–Gabber theorem in mixed characteristic, prime to ℓ

Let X = Spec A be a complete noetherian local normal scheme of dimension d ≥ 2 with residue field k of characteristic p > 0 and generic point of characteristic 0. (1) There are a finite surjective X′ → X with X′ normal integral of residue field k′, and a finite surjective X′ → Spec V⟦t_1, …, t_(d−1)⟧ with V a discrete valuation ring of residue field k′, étale over a p-dense open (an open meeting the fibre over p densely). (2) For a prime ℓ ≠ p there are a normal integral local Y with an action of a finite ℓ-group H and an H-equivariant finite surjective Y → X with Y/H → X of generic degree prime to ℓ, a complete mixed-characteristic discrete valuation ring V with residue field that of Y and a compatible H-action, and an H-equivariant local finite morphism Y → Spec V⟦t_1, …, t_(d−1)⟧, étale over a p-dense open, with H acting trivially on the t_i. (ILO14, Exposé IV, Théorèmes 4.2.2 and 4.3.1, pp. 58–60 (printed); ILO14 line 2677).

d ≥ 2; mixed characteristic (0, p); ℓ ≠ p in (2).

A proof route is as follows. Use Cohen rings and Cohen's structure theorem to map X to Spec W(k_0) with k_0 the maximal perfect subfield of k (ILO IV 4.1.7–4.1.8, 4.2.3). At each generic point of the fibre over p, eliminate wild ramification with Epp's theorem (§1.3) after a finite base change. Choose parameters giving a finite map to V⟦t_1, …, t_(d−1)⟧ that is étale over a p-dense open (ILO IV 4.2.2); for (2) replace the base extension by its Galois closure and descend along an ℓ-Sylow subgroup (ILO IV 4.3.1).

*Needs:* §1.3; §1.1; DeformationAndDerivedPatchingAlgebra §1.10 and the coefficient-field contract.

**Checks.**

- For X = Spec ℤ_p⟦x⟧ (d = 2), V = ℤ_p and t_1 = x with X′ = X work in (1).

- In (2) with H trivial, Y → X itself must have generic degree prime to ℓ.

The native signature `cohenGabber_mixedCharacteristic` states the prime-to-ℓ presentation on actual rings. Define `MixedCohenGabberPresentation` to bundle the complete normal local extension B, the complete mixed-characteristic DVR V, the finite local injection V⟦t₁,…,t_(d−1)⟧ → B, its residue-field equivalence and the finite ℓ-group actions. Its dimension parameter satisfies d ≥ 2. The p-dense condition says that for every prime of B lying over a minimal prime of (p) in the power-series ring, the parametrization is étale at that prime. For a finite map between these noetherian rings, openness of the étale locus and closedness of finite images make this equivalent to étaleness above a p-dense target open. The invariant map A → B^H is the actual map whose composite with the invariant-subring inclusion is A → B, and its generic degree is prime to ℓ (ILO14, IV 4.3.1, pp. 59–60; ILO14 line 2729).

Its interface retains the following facts.

- Both structural maps A → B and V⟦t⟧ → B are finite injective local maps; the chosen residue-field equivalence agrees with the coefficient map V → B.

- The group fixes the image of A, acts on the coefficient DVR, and fixes every formal variable; equivariance is an equality on every series.

- Generic degree is imposed on the finite invariant extension A → B^H. The étale condition is imposed on V⟦t⟧ → B before taking invariants.

**Checks.**

- For A = ℤ_p⟦x⟧, d = 2, take B = A, V = ℤ_p and the trivial group. Both finite maps are identities, the residue equivalence is the identity and the invariant degree is 1, with gcd(1,ℓ) = 1.

- The finite map V⟦t⟧ → V⟦x⟧, t ↦ x^p, has derivative p x^(p−1). It is generically étale in characteristic zero, but at the generic point of the p-fibre x is a unit and p x^(p−1) is a nonunit. It fails the p-dense condition; generic étaleness alone does not determine this bundle.

- Let k be algebraically closed of characteristic p, W = W(k), ℓ ≠ p, V = W[π]/(π^ℓ−p), A = W⟦x⟧ and B = V⟦x⟧. The group of ℓ-th roots of unity acts on π and fixes x. Then [Frac B:Frac A] = ℓ, B^H = A and the invariant generic degree is 1. Requiring the degree of B over A to be prime to ℓ would reject this valid model, including (p,ℓ) = (2,3) and (3,2). With p = 3 and ℓ = 2 one may also let Q₈ act trivially on the identity model: all element orders are 1, 2 or 4 and the invariant degree is 1. The group S₃ fails to be a 2-group because a 3-cycle has order 3.

### 1.5 Partially algebraizable complete local rings

Let A be a complete noetherian local ring and (I_e)_(e∈E) a family of ideals of A. Define `PartialAlgebraization` to bundle such presentations; the pair (A, (I_e)) is partially algebraizable if there exist a complete noetherian local ring B with dim B < dim A, a B-algebra C of finite type, a maximal ideal 𝔫 of C above the maximal ideal of B, and an isomorphism A ≅ Ĉ_𝔫 (completion of the localisation) under which every I_e is the extension of an ideal of C_𝔫. (ILO14, Exposé V, §2.1.1, p. 64 (printed); ILO14 line 2884).

A complete noetherian local; E arbitrary (in the theorems, finite).

Its interface consists of the following facts.

- The type of partial-algebraization presentations on a complete local ring with a family of ideals; partial algebraizability is its nonemptiness.

- Invariance under isomorphisms of complete local rings carrying the ideals.

- If the family (I_e) is partially algebraizable, so is the family enlarged by I_i ∩ I_j for any two indices, with the same presentation: completion of the noetherian local ring C_𝔫 is flat, so extension of ideals commutes with finite intersections. With primary decomposition this reduces families to primary ideals (ILO V 2.2.1).

- Every presentation has dim B < dim A.

- Equivalently Spec A is the completion at a closed point of the closed fibre of a finite-type scheme over a complete noetherian local base of smaller dimension, with each closed subscheme defined by I_e induced scheme-theoretically from a closed subscheme. Under the reduced equal-characteristic or normal mixed-characteristic hypotheses of V 3.1.3–3.1.4, the algebraization theorems give a regular base of dimension dim A − 1, after the stated finite prime-to-ℓ extension in mixed characteristic; regularity is an extra theorem, not part of this equivalence.

A proof route is as follows. Definition; closure under finite intersections of ideals (ILO V 2.2.1) and under primary decomposition is part of the API.

*Needs:* Mathlib `IsAdicComplete`; Mathlib `ringKrullDim`; Mathlib `IsLocalRing`.

**Checks.**

- A = k⟦x_1, …, x_d⟧ (d ≥ 1) with the ideals (x_1), …, (x_d) is partially algebraizable over B = k⟦x_1, …, x_(d−1)⟧, C = B[x_d], 𝔫 = (x_1, …, x_d).

- A field k with any family of ideals is not partially algebraizable, since no complete local B has dimension < 0.

- In A = k⟦x,y⟧ the ideal (y − x²) is extended from C_𝔫 for C = k⟦x⟧[y] and 𝔫 = (x,y). More generally the same presentation works for (y − f(x)) with any f(x) ∈ k⟦x⟧.

- The trivial presentation B = A, C = A is not allowed: it violates dim B < dim A.

- For A = k⟦x⟧, the ideals (x) and (x²) have the same closed support but their quotients have lengths 1 and 2. An algebraization of ideals must retain those lengths, rather than only their common support.

### 1.6 Partial algebraization in equal characteristic

Let A be a complete noetherian local reduced ring of equal characteristic which is not a field. Then for every finite family of ideals (I_e), the pair (A, (I_e)) is partially algebraizable. The base B can be chosen regular of dimension dim A − 1. The signature `partialAlgebraization_equalCharacteristic` states this regular-base form, with equal characteristic expressed by a field algebra F → A and positive dimension expressed before any subtraction (ILO V 3.1.4). (ILO14, Exposé V, Théorème 2.1.2 and §2.2, pp. 64–66 (printed); ILO14 line 2890).

A reduced, equal characteristic, dim A ≥ 1; finitely many ideals.

A proof route is as follows. Reduce to primary ideals (§1.5, intersection property). Use §1.1 (or §1.2 with G = 1 when A is not equidimensional) to get a finite generically étale X → X_0 = Spec k⟦t_1, …, t_d⟧. Minimal primes are handled by generic étaleness; lower-dimensional supports lie over V(g) for a g ∈ k⟦t⟧ − 0; choose f ∈ k⟦t⟧ − 0 with the ramification locus of X → X_0 inside V(f) and put h = gf. After a Weierstrass change of coordinates make h a Weierstrass polynomial in t_d and algebraize along k⟦t_1, …, t_(d−1)⟧[t_d] by Elkik's equivalence for finite algebras étale away from V(h), applied to the pair formed by the henselization of k⟦t_1, …, t_(d−1)⟧[t_d] at the origin and the ideal (h), which is henselian and has h-adic completion k⟦t_1, …, t_d⟧ (SchemeAndStackFoundations §0.14, the finite-algebra completion contract; ILO V 1.1.1, 1.1.3, 1.2.3–1.2.4, 2.2.3).

*Needs:* §1.5; §1.1; §1.2; SchemeAndStackFoundations §§0.12–0.16, 0.21; SchemeAndStackFoundations §0.14, the finite-algebra completion contract.

**Checks.**

- For A = k⟦x, y⟧/(xy) (dimension 1) and the ideals (x), (y), one may take B = k, C = k[x, y]/(xy) and 𝔫 = (x, y).

- The hypothesis 'not a field' is needed by §1.5's degenerate test.

### 1.7 Partial algebraization prime to ℓ in mixed characteristic

Let A be a complete noetherian local normal ring of mixed characteristic (0, p) and dimension d ≥ 2, and ℓ ≠ p a prime. There is a finite injective A → A′ of generic degree prime to ℓ with A′ normal integral such that every finite family of ideals of A′ is partially algebraizable. Geometrically: for a complete noetherian local normal X of mixed characteristic and dimension d ≥ 2, finitely many closed subsets Z_i ⊂ X and ℓ invertible on X, there are a complete regular local scheme S of mixed characteristic and dimension d − 1, a local normal X′ with a finite π : X′ → X of generic degree prime to ℓ, a finite-type f : Y → S and an isomorphism a of X′ with the completion of Y at a closed point of its special fibre, and closed F_i ⊂ Y with π⁻¹(Z_i) = a⁻¹(F_i). For X reduced of equal characteristic and not a field, the analogous presentation over a complete regular local base of dimension dim X − 1 holds with X′ = X (V 3.1.4). The signature `partialAlgebraization_mixedCharacteristic` chooses A′ once, before quantifying over all finite ideal families; for each family it supplies a regular mixed-characteristic base B with dim B + 1 = dim A. (ILO14, Exposé V, Théorème 3.1.1, Reformulation 3.1.3 and Remarque 3.1.4, p. 66 (printed); ILO14 line 2957).

Mixed characteristic (0, p), d ≥ 2, ℓ ≠ p; finitely many closed subsets.

A proof route is as follows. Apply §1.4 (2) to get B_0 = V⟦t_1, …, t_(d−1)⟧ → B with an ℓ-group H, and set A′ = B^H (ILO V 3.2.1). The invariant coefficient ring V^H is a complete mixed-characteristic DVR: its valuation has a nonzero discrete value subgroup containing the value of p, and its fixed subring is closed in the complete ring V. After the equivariant Weierstrass change of variables, descend B_0 → B to a finite algebra B̃ over the henselization of V⟦t_1, …, t_(d−2)⟧[t_(d−1)] at the origin of its closed fibre, together with the compatible H-action: essential surjectivity of Elkik's equivalence gives B̃, and its full faithfulness descends each automorphism of B over B_0 and their composition law (SchemeAndStackFoundations §0.14, the finite-algebra completion contract; ILO V 1.2.4, 3.2.3). Take Ã′ = B̃^H; its completion is A′, since averaging by the unit |H| makes invariants commute with completion. Descend the prescribed ideal family to Ã′ using finiteness for the lower-dimensional supports and symbolic powers for the vertical height-one primary ideals, then descend the algebra and ideals from the henselian polynomial algebra over V^H⟦t_1, …, t_(d−2)⟧ to a finite-type algebra over that complete base (ILO V 3.2.3–3.2.4, pp. 67–68; ILO14 lines 2999–3035). Thus take S = Spec V^H⟦t_1, …, t_(d−2)⟧ in the geometric reformulation; it is regular of dimension 1 + (d − 2) = d − 1. Remark 3.1.4 gives the equal-characteristic case from §1.6.

*Needs:* §1.5; §1.4; §1.6; SchemeAndStackFoundations §§0.12–0.16, 0.21; SchemeAndStackFoundations §0.14, the finite-algebra completion contract.

**Checks.**

- For A = ℤ_p⟦x⟧ and the ideal (x − p), A′ = A works with S = Spec ℤ_p and Y = 𝔸¹_S.

- For p = 3, ℓ = 2, W = W(𝔽̄₃), V = W[π]/(π² − 3) and B = V⟦x⟧, let H = C₂ negate π and fix x. Then V^H = W and A′ = B^H = W⟦x⟧. This A′ admits no unital V-algebra structure: the constant term b₀ of an image of π would satisfy b₀² = 3, forcing 2v₃(b₀) = 1 in W. Over the invariant base, C = W[x] and 𝔫 = (3,x) have completed localization A′, with dim W + 1 = 2, and (x − 3) descends literally. This is the ramified coefficient action of §1.4, where the invariant generic degree remains 1.

- The generic degree of A → A′ may be divisible by p but never by ℓ.

For a local domain A and a nonnegative integer ℓ, define `PrimeToEllLocalExtension` as the data of a complete noetherian normal local domain B, an injective finite local algebra map A → B, and coprimality of ℓ with dim_(Frac A)(Frac A ⊗_A B). This is a bundle of native rings, tensor products and dimensions used by the mixed-characteristic headline; it makes no choice of a residue field or fraction-field embedding. The theorem above uses ℓ prime and ℓ ≠ p. Its interface preserves the algebra map, its locality, its finite-module witness and the actual generic fibre under a specified isomorphism of extensions (ILO14, V 3.1.1, p. 66; ILO14 line 2957).

- The source and target of the structure map are A and B; injectivity and finiteness refer to that same map.

- Isomorphisms of B as an A-algebra preserve its generic degree and the prime-to-ℓ condition.

- For B = A complete normal local, the identity has generic degree 1; no nontrivial extension is required by the bundle.

**Checks.**

- For the identity on ℤ_p⟦x⟧, Frac A ⊗_A A = Frac A has dimension 1 and gcd(1,ℓ) = 1 for every prime ℓ. A residue-field degree would not determine this generic fibre in general.

- A quadratic finite extension has gcd(2,2) = 2 and gcd(2,3) = 1; it is excluded for ℓ = 2 and admitted for ℓ = 3, provided its local and normal hypotheses hold.

- The map ℤ_p⟦x⟧ → 𝔽_p⟦x⟧ kills p and is not an injective extension of domains; it is rejected even though the residue fields agree.

- The bundle asks normality of B only. For the cusp A = k⟦t²,t³⟧, which is not normal since t = t³/t² is integral over A but not in A, and its normalization B = k⟦t⟧, generated by 1 and t over A, the generic fibre is Frac A ⊗_A B = k((t)) of dimension 1, so the data exist for every ℓ, including ℓ = 0 because gcd(1,0) = 1; a degree-2 extension is rejected at ℓ = 0 since gcd(2,0) = 2. Normality of A and primality of ℓ are hypotheses of the theorem, not of the bundle.

### Examples

The cusp has a separable power-series parametrization even at p = 2 or 3 by changing the parameter as in §1.1. The node k⟦x,y⟧/(xy) with both branch ideals comes from k[x,y]/(xy) at (x,y). In mixed characteristic ℤ_p⟦x⟧ with (x−p) comes from the affine line over ℤ_p, with generic extension degree 1 (ILO14, IV 2.1.1, V 2.1.2, 3.1.3–3.1.4).

### Dependencies

SchemeAndStackFoundations §§0.14–0.15 and the finite-algebra completion contract; DeformationAndDerivedPatchingAlgebra §1.10 and the coefficient-field contract; Mathlib complete local rings, formal series, finite modules and étale algebras.

## Layer 2: Gabber's local uniformization

Combine the complete-local reductions, partial algebraization and equivariant curve alteration with the supplied logarithmic modifications. The result covers every noetherian quasi-excellent scheme in the required alteration topology.

### 2.1 de Jong's equivariant nodal-curve alteration over an excellent base

Let f : X → Y be a proper morphism of excellent integral noetherian schemes and Z ⊂ X a nowhere dense closed subscheme, with η the generic point of Y, such that X_η is smooth, geometrically irreducible and of dimension 1 and Z_η is étale over η. There are a finite group G, a commutative square of G-schemes with f′ : X′ → Y′ over f, alterations a : X′ → X and b : Y′ → Y, an effective G-equivariant divisor D ⊂ X′ and a nowhere dense G-stable closed T′ ⊂ Y′ such that: f′ is projective; G acts trivially on X and Y and freely on Y′ − T′; a and b are projective generically étale alterations and Y′/G → Y (resp. X′/G → X) is an isomorphism at η (resp. at the generic point of X_η); f′ is a nodal curve, smooth outside T′; D is étale over Y′ and contained in the smooth locus of f′; and a⁻¹(Z) ⊂ D ∪ f′⁻¹(T′). (DJ97, Theorem 2.4 and Remark 2.5, pp. 602–603; DJ97 line 139; ILO14, Exposé IX, Théorème 1.2, p. 131 (printed); ILO14 line 5896; ILO-final-IX, Théorème 1.2, p. 161; ILO-final-IX line 35).

Y excellent integral noetherian; X_η smooth geometrically irreducible of dimension 1; Z_η étale over η. A nodal curve is flat with geometrically connected one-dimensional fibres whose only singularities are ordinary double points.

A proof route is as follows. Apply de Jong's Theorem 2.4 to the triple (f, G = 1, Z): after an alteration of Y with group action and a stable-curve modification, the family becomes a projective semistable curve with disjoint sections through the smooth locus covering Z (DJ97, 2.4 (i)–(vii)(a)); the extra boundary is T′ (Remark 2.5) and the sections form D. The marked stable extension, flattening, marked-section construction, preservation of group actions by simultaneous translates and the nodal quotient are the curve step of the plurinodal alteration theorem of ClassicalAdicEtaleCohomology §5.4 (DJ97, Corollary 5.10, p. 618), which rests on the same Theorem 2.4 and Remark 2.5; they are used here, not rebuilt, and the stable modification is also available from AdicCoefficientsAndComparisonsPartII §§PA.5.1–PA.5.4. What this section adds is read off from Theorem 2.4 (iv)–(vi) under the stated hypotheses (ILO IX 1.2). Geometric irreducibility of X_η gives condition (2.1.5) and smoothness with Z_η étale gives (2.1.1), so the alteration satisfies (2.2.1) and (2.2.5): the invariant function field of Y′ is purely inseparable over that of Y by (2.2.1) and separable over it by (2.2.5), hence equal to it, and then (2.2.1) makes the invariant function field of X′ equal to that of X. This is the birational quotient conclusion; the supplier's plurinodal corollary records only a purely inseparable invariant extension.

*Needs:* ClassicalAdicEtaleCohomology §5.4, the curve step of its plurinodal alteration theorem; AdicCoefficientsAndComparisonsPartII §§PA.5.1–PA.5.4; AdicCoefficientsAndComparisonsPartII §§PA.0.2–PA.0.8, PA.0.11; SchemeAndStackFoundations §§4.16–4.20; SchemeAndStackFoundations §0.21.

**Checks.**

- If f is already a smooth projective curve with Z a union of disjoint sections, G trivial and a, b identities work.

- For Y a trait and X a regular model with nodal special fibre, T′ is the closed point after base change.

- The geometric hypothesis is necessary for the quotient conclusion: for a nontrivial finite separable extension L/K, ℙ¹_L → Spec K is smooth and irreducible but not geometrically irreducible. A nodal model with geometrically connected fibres has generic constants from its new base; compatibility with a birational quotient of ℙ¹_L would force the base quotient to have constants L, contradicting birationality over K.

### 2.2 Gabber's weak local uniformization theorem

Let X be a noetherian quasi-excellent scheme and Z ⊂ X a nowhere dense closed subset. There is a finite family (X_i → X)_(i∈I), covering for the alteration topology alt, such that each X_i is regular and connected and the preimage of Z in X_i is the support of a strict normal crossings divisor (possibly empty). (ILO14, Exposé VII, Théorème 1.1 and §§2–4, pp. 81–83 (printed); Exposé II, Théorème 4.3.1, p. 33; ILO14 line 3577).

X noetherian quasi-excellent (possibly of infinite dimension; the statement is local); Z nowhere dense.

A proof route is as follows. Reduce to X local, normal, complete of dimension d by §0.6 and §0.7; argue by induction on d, the case d = 1 being normalisation (ILO VII 2.1–2.3). Realise X (after a finite cover) as the completion of a finite-type relative curve X′ → S over a regular local S of dimension d − 1 at a closed point, with Z coming from a rare closed subset (§1.7, geometric form; §1.6). Apply §2.1, uniformize the base by induction, and note that the resulting pair is log regular (AdicCoefficientsAndComparisonsPartII §§PA.4.1–PA.4.8); resolve by Kato–Nizioł monoidal desingularization (AdicCoefficientsAndComparisonsPartII §PA.4.5; ILO VII 4.3).

*Needs:* §0.7; §0.6; §1.6; §1.7; §2.1; AdicCoefficientsAndComparisonsPartII §§PA.4.1–PA.4.8; §0.2.

**Checks.**

- For connected regular X and an snc support Z, the identity family works; for a disconnected noetherian regular X use its finitely many connected components.

- For X the cone k[x, y, z]/(xy − z²) and Z the vertex, the blow-up of the vertex is an alt-covering family with regular source and exceptional divisor a smooth conic.

### 2.3 Gabber's prime-to-ℓ local uniformization theorem

Let X be a noetherian quasi-excellent scheme, Z ⊂ X a nowhere dense closed subset and ℓ a prime invertible on X. There is a finite family (p_i : X_i → X)_(i∈I), covering for the topology alt_ℓ′ of ℓ′-alterations, such that each X_i is regular and connected and p_i⁻¹(Z) is the support of a strict normal crossings divisor. (ILO14, Exposé IX, Théorème 1.1 and §2 (Théorème 2.3), pp. 131–134 (printed); Exposé II, Théorème 4.3.2, p. 33; Exposé 0, Théorème 2; ILO14 line 5893).

X noetherian quasi-excellent; ℓ invertible on X; Z nowhere dense.

A proof route is as follows. Reduce to X complete local normal of dimension d by §0.6 and §0.7, by induction on d (ILO IX 1). Use the prime-to-ℓ partial algebraization (§1.7) and de Jong's equivariant nodal-curve alteration (§2.1) with a group G; apply the induction hypothesis to Y′/H with H an ℓ-Sylow of G and use Abhyankar's lemma, reaching G an ℓ-group acting on log regular pairs (ILO IX 1.2–2.1, VI 1.9, 2.1). Make the action very tame by Gabber's equivariant modification theorem (AdicCoefficientsAndComparisonsPartII §§PA.4.1–PA.4.8, ILO VIII 1.1), pass to the log regular quotient (AdicCoefficientsAndComparisonsPartII §PA.4.3) and resolve it by monoidal desingularization (AdicCoefficientsAndComparisonsPartII §PA.4.5) (ILO IX 2.3).

*Needs:* §0.7; §0.6; §1.7; §1.6; §2.1; §1.4; AdicCoefficientsAndComparisonsPartII §§PA.4.1–PA.4.8; §0.2.

**Checks.**

- A weak family whose refinement is a proper surjective maximally ℓ′-finite map followed by a Nisnevich cover is alt_ℓ′-covering. Prime-to-ℓ generic degrees of an arbitrary weak family alone do not ensure this: over R = 𝔽₃[t]_(t), the finite étale cubic x³+x²+2x+t has closed fibre 𝔽₃ × 𝔽₉. Delete the rational closed point. The remaining connected regular scheme still has generic degree 3, but its only point over t = 0 has degree 2, so for ℓ = 2 it is an alt-cover that is not alt_2′-covering.

- For X the quotient 𝔸²/μ_ℓ by (x, y) ↦ (ζx, ζ⁻¹y) over a field of characteristic ≠ ℓ, the quotient map of degree ℓ is not allowed; the minimal resolution of the A_(ℓ−1) singularity is an alt_ℓ′-covering modification.

### 2.4 Hypercoverings by regular schemes with snc boundary

Let X be a noetherian quasi-excellent scheme, Z ⊂ X a closed subset with dense complement U, and N ≥ 0. There is a hypercovering ε : X_• → X for the alteration topology (resp. for alt_ℓ′ with ℓ invertible on X) such that for every i ≤ N the scheme X_i is regular (a finite disjoint union of regular connected schemes) and the preimage of Z in X_i is the support of a strict normal crossings divisor, so that U_i = U ×_X X_i is the complement of an snc divisor. The X_i may be chosen affine. (ILO14, Exposé XIII, Théorème 2.2.2, p. 196 (printed); Exposé XV, 3.1.2, p. 222 (printed); ILO14 line 9331).

X noetherian quasi-excellent; Z rare; ℓ invertible on X for the alt_ℓ′ version; only the truncation in degrees ≤ N is controlled.

A proof route is as follows. Build a split hypercovering degree by degree, as in the hypercover construction of EnhancedDerivedSheaves §E2 (the classical split construction that ILO XIII 2.2.1 invokes; ILO14 line 9329). At stage n + 1 the matching object M = (cosk_n X_•)ₙ₊₁ is an object of alt/X: it is reduced, of finite type over the quasi-excellent X, and maximally dominant, so its maximal points lie over maximal points of X, which lie in the dense open U. Hence the preimage of Z in M is nowhere dense, and §2.2 (resp. §2.3) applied to M with boundary the preimage of Z alone gives the new nondegenerate summand N_(n+1), refined to finitely many affine regular connected pieces by a Zariski refinement. Set Xₙ₊₁ = N_(n+1) ⊔ (the degenerate summands forced by the degeneracy maps), each a copy of some N_k with k ≤ n, already regular with snc boundary. No degeneracy image is added to the boundary: it can be all of M, as for X = Spec k, Z = ∅, where X₀ ×_X X₀ = X (ILO XIII 2.2.2, XV 3.1.2).

*Needs:* §2.2; §2.3; §0.2; §0.1; EnhancedDerivedSheaves §E2.

**Checks.**

- For X regular with Z an snc support, the constant hypercovering X_• = X works.

- For X = Spec k and Z = ∅, the matching object at stage 1 is X₀ ×_X X₀; for X₀ = X it is a point whose degeneracy image is all of it. A construction that added degeneracy images to the boundary would ask §2.2 for a boundary equal to the whole scheme, which is not nowhere dense. The split construction takes the new summand and the forced degenerate summand to be points with empty boundary.

- The truncation bound N ≥ q + 1 suffices for the stated control in degree q: it uses levels 0 and 1 for q = 0, and levels 0, 1 and 2 for q = 1. The constant hypercover does not require this many levels to compute its own cohomology (ILO XIII 2.2.1–2.2.3).

### Examples

The quadratic cone xy=z² is resolved by blowing up its vertex, including in characteristic 2: the charts y=xz₁² and x=yz₂² are regular, and the exceptional conic xy=z² in ℙ² is smooth. A tame A_(ℓ−1) surface quotient is handled by its birational resolution rather than by accepting the degree-ℓ quotient map as a prime-to-ℓ cover (ILO14, II 4.3.1–4.3.2, IX §2).

### Dependencies

Layers 0–1; AdicCoefficientsAndComparisonsPartII §§PA.4.1–PA.4.8, PA.5.1–PA.5.4; SchemeAndStackFoundations §§4.16–4.20; ClassicalAdicEtaleCohomology §5.4 for the curve step; EnhancedDerivedSheaves §E2 for hypercovers.

## Layer 3: Oriented products and oriented cohomological descent

Construct general oriented products, their tube comparison and descent along alteration diagrams. Torsion abelian coefficients need no prime-to-residue-characteristic restriction.

### 3.1 Deligne's oriented product of topoi

Let f : X → S and g : Y → S be morphisms of topoi, with defining sites C_1, C_2, D having finite limits and f^*, g^* induced by continuous finite-limit-preserving functors. The oriented product X ←×_S Y is the topos of sheaves on the site C whose objects are triples (U → V ← W) with V ∈ D, U ∈ C_1, W ∈ C_2 and maps U → f^*V, g^*V ← W, with the topology generated by (a) coverings in the U variable, (b) coverings in the W variable, and (c) the maps (U → V′ ← W ×_V V′) → (U → V ← W) for V′ → V in D such that U → f^*V factors through f^*V′. It carries projections p_1 : X ←×_S Y → X, p_2 : X ←×_S Y → Y and a canonical 2-morphism τ : g p_2 ⇒ f p_1. For schemes, use the small-étale product of ClassicalAdicEtaleCohomology §5.4 and identify it with this general-topos product by the universal property. For S a henselian trait, compare X_s ←×_S η with LefschetzPencilsAndVanishingCycles §§0.2–0.5. (ILO14, Exposé XI, §1 (1.1–1.9, Définition 1.7), pp. 171–176 (printed); ILO14 line 7929).

Sites with finite projective limits; coverings given by pretopologies; f^*, g^* continuous and left exact on sites.

Its interface consists of the following facts.

- The oriented product topos X ←×_S Y.

- The projection p_1 to X.

- The projection p_2 to Y.

- The 2-morphism τ : g p_2 ⇒ f p_1.

- A morphism T → X ←×_S Y is a triple (a : T → X, b : T → Y, t : g b ⇒ f a); the induced morphism composes with the two projections and the two-cell to the given data, uniquely up to unique isomorphism.

- Functoriality in (f, g) over a morphism of bases, with identity and composition compatibility up to coherent isomorphism (ILO XI 1.9).

- If X, Y, S and f, g are coherent then so are the oriented product and its projections (ILO XI Lemme 2.5).

A proof route is as follows. Define the site and check the sheaf condition reduces to (a), (b) and bijectivity along (c) (ILO XI 1.1–1.2). Construct p_1, p_2, τ and the universal property: morphisms T → X ←×_S Y correspond to triples (a, b, t) with t : g b ⇒ f a (ILO XI 1.3–1.7). Points are triples (x, y, a specialization g(y) ⇝ f(x)); the scheme specialization comparison with ClassicalAdicEtaleCohomology §5.4 and the trait comparison with LefschetzPencilsAndVanishingCycles §§0.2–0.5 preserve that same arrow.

*Needs:* LefschetzPencilsAndVanishingCycles §§0.2–0.5; EtaleCohomologyFoundations §§F.0–F.1, 0.7; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`; AdicEtaleGeometry §§A1.14–A1.15; EnhancedDerivedSheaves §§0.1–0.4; ClassicalAdicEtaleCohomology §5.4 for the scheme specialization and comparison.

**Checks.**

- If S is the punctual topos, X ←×_S Y is the product topos X × Y and τ is the identity.

- For S a strictly henselian trait with closed point s and geometric generic point η̄, (X_s) ←×_S η̄ agrees with the oriented product of LefschetzPencilsAndVanishingCycles §§0.2–0.5, with the same stalk formula RΓ(X_(x) ×_(S_(f(x))) η̄, K).

- For X = Y = S = Spec of a strictly henselian trait, the points of X ←×_S S are pairs (x, y) with y specializing to x: three points (s, s), (η, η), (s, η).

- For X = Y = S = the étale topos of a strictly henselian trait, X ←×_S S is not S ×_S S = S: it has the extra point (s, η).

### 3.2 Base change for tubes of oriented products

Let f : X → S and g : Y → S be coherent morphisms of coherent topoi, T = X ←×_S Y with projections p_1, p_2 and τ : g p_2 ⇒ f p_1, and Λ a ring. For every F ∈ D⁺(Y, Λ) the base change map f^*Rg_*F → Rp_(1*)p_2^*F deduced from τ is an isomorphism in D⁺(X, Λ). (ILO14, Exposé XI, Théorème 2.4 and Lemme 2.5, pp. 178–179 (printed); ILO14 line 8381).

X, Y, S coherent topoi and f, g coherent morphisms .

A proof route is as follows. T is coherent and p_1, p_2 are coherent (ILO XI Lemme 2.5). Check the isomorphism on points of X; at a point x the stalk of Rp_(1*)p_2^*F is the cohomology of the tube over x, computed as a filtered colimit over neighbourhoods, which matches the stalk of f^*Rg_*F (ILO XI 2.4, proof).

*Needs:* §3.1; EtaleCohomologyFoundations §§F.0–F.1, 0.7; AdicEtaleGeometry §§A1.14–A1.15; EnhancedDerivedSheaves §§0.1–0.4.

**Checks.**

- For S a point, the statement is the Künneth-free identity f^*Rg_*F = Rp_(1*)p_2^*F for the product with a point.

- For schemes, at a geometric point x of X, the stalk is RΓ(Y ×_S S_(f(x)), F): cohomology of the 'Milnor tube' over the strict henselisation.

### 3.3 The oriented alteration topology on diagrams X → S ← Y

Fix a noetherian base S₀. Let B be the category of diagrams (X → S ← Y) of finite-type S₀-schemes, with morphisms the commutative S₀-ladders; finite limits and finite coproducts in B are computed termwise. The oriented alteration topology on B is generated by the families: (i) (X → S ← Y_i) → (X → S ← Y) for an alteration covering (Y_i → Y); (ii) (X_i → S ← Y) → (X → S ← Y) for an alteration covering (X_i → X); (iii) (X ×_S S_i → S_i ← Y ×_S S_i) → (X → S ← Y) for an alteration covering (S_i → S); (iv) (X → S′ ← Y ×_S S′) → (X → S ← Y) for S′ → S proper through which X → S factors; (v) (X ×_S S′ → S′ ← Y) → (X → S ← Y) for S′ → S étale through which Y → S factors (ILO XII 2.1.1–2.1.2). An oriented alteration hypercovering of (X → S ← Y) is a simplicial object (X_• → S_• ← Y_•) of B whose degree-zero augmentation and all positive-degree matching maps are coverings for this topology; its augmentation induces ←ε : Y_• ←×_(S_•) X_• → Y ←×_S X. (ILO14, Exposé XII, §2.1 (2.1.1–2.1.2), pp. 190–191 (printed); ILO14 line 9020).

All diagrams are finite type over a fixed noetherian S₀; covering families lie in this category. Each application may take S₀ to be its original base. Strict henselizations in stalk computations are handled by limits of étale neighbourhoods, not asserted to be objects of B.

Its interface consists of the following facts.

- The category B of finite-type S₀-diagrams X → S ← Y, for a fixed noetherian S₀, with the oriented alteration topology.

- An alt hypercovering S_• → S gives an oriented hypercovering (X ×_S S_• → S_• ← Y ×_S S_•).

- The induced morphism of oriented product topoi ←ε.

- Coverings are stable under base change in B.

A proof route is as follows. Restrict the diagram category and the five generating families of ILO XII 2.1.1–2.1.2 to finite-type S₀-schemes. Finite limits remain noetherian and the families remain stable under base change. Arbitrary products of noetherian schemes need not be noetherian. Define hypercoverings and the induced morphism of oriented products by functoriality (§3.1).

*Needs:* §3.1; §0.2.

**Checks.**

- The identity of (X → S ← Y) is a covering and the constant hypercovering has ←ε an equivalence.

- For S′ → S the blow-up of the origin of S = 𝔸²_k, X = S′ and Y = S, the map (S′ → S′ ← S′) → (S′ → S ← S) is of type (iv), hence covering, although S′ → S is not étale.

- A Zariski covering (Y_i → Y) is an alteration covering, so (X → S ← Y_i) → (X → S ← Y) is a covering family of type (i).

- Take S = X = Spec k with k algebraically closed, Y = 𝔸¹_k and Y′ = {0}. Then Y ←×_S X = Y_ét, and the single map (X → S ← Y′) → (X → S ← Y) is not covering: points over Y − {0} are missed.

- A diagram with S = X and Y = X proper over S: the topology restricted to (i) is the alteration topology of X.

- An alteration hypercovering S_• → S induces an oriented alteration hypercovering (X ×_S S_• → S_• ← Y ×_S S_•) (used in ILO XII 2.2.4).

### 3.4 Oriented acyclicity of proper morphisms

Let S be a coherent scheme, g : Y → S, π : S′ → S proper, a : X → S′ coherent, b = π a, Y′ = Y ×_S S′ with g′ : Y′ → S′ and ρ : Y′ → Y. The induced morphism ←ρ : Y′ ←×_(S′) X → Y ←×_S X of oriented products is acyclic for torsion sheaves: for every torsion abelian sheaf (more generally bounded below torsion complex) F on Y ←×_S X, F → R←ρ_* ←ρ^* F is an isomorphism. (ILO14, Exposé XII, Théorème 1.2.1 and §§1.3.1–1.3.3, pp. 189–191 (printed); ILO14 line 8936).

π proper; coefficients torsion; schemes coherent.

A proof route is as follows. Reduce by the tube base change theorem (§3.2) to a statement on strictly henselian local bases. Apply ordinary proper base change for torsion sheaves to the strictly local fibre and use the section determined by the lifted geometric point to identify the adjunction map (ILO XII 1.2.1, 1.3.1–1.3.3). Gabber’s affine proper base change is not needed for this step.

*Needs:* §3.2; §3.1; EtaleCohomologyFoundations §§F.0–F.1, 0.7.

**Checks.**

- For π an isomorphism, ←ρ is an equivalence.

- This generalizes invariance of the tubular neighbourhood under admissible blow-ups (ILO XI 1.7, 2.8).

### 3.5 Oriented cohomological descent

Let (X_• → S_• ← Y_•) → (X → S ← Y) be a hypercovering for the oriented alteration topology, with augmentation ←ε : T_• = Y_• ←×_(S_•) X_• → T = Y ←×_S X. For every bounded below torsion complex K on T, the adjunction K → R←ε_* ←ε^* K is an isomorphism. (ILO14, Exposé XII, Théorème 2.2.1 and §2.3, including §2.3.8, pp. 191–194 (printed); ILO14 line 9065).

Diagrams finite type over a fixed noetherian S₀ as in §3.3; torsion coefficients; bounded below complexes.

A proof route is as follows. By bounded-below hypercover descent (EnhancedDerivedSheaves §E2) reduce to 0-coskeleta of single covering families of types (i)–(v), and to Zariski coverings or proper surjections for the alteration coverings (ILO XII 2.3.1). Type (iv) is §3.4; types (i), (ii), (v) follow from proper and étale cohomological descent (SchemeAndStackFoundations §2.16) through the tube description; type (iii) combines them (ILO XII 2.3).

*Needs:* §3.3; §3.4; §3.2; SchemeAndStackFoundations §§2.12, 2.15–2.16.

**Checks.**

- For the constant hypercovering the statement is trivial.

- Let S = X be a separably closed point, keep S_• and X_• constant, and take Y_• → Y to be the Čech nerve of a proper surjection. Then Y ←×_S X = Y and the theorem is ordinary proper cohomological descent on Y. Taking X = Y = S over a general base instead gives descent on the self-oriented product, which is not the ordinary base topos.

### 3.6 Base change formula for alteration hypercoverings

Let X —f→ S ←g— Y be finite-type morphisms of noetherian schemes and ε : S_• → S an alteration hypercovering, with f_• : X_• = X ×_S S_• → S_•, g_• : Y_• = Y ×_S S_• → S_• and ε_Y : Y_• → Y. For every bounded below torsion complex K on X, the natural map g^*Rf_*K → Rε_(Y*)(g_•^*Rf_(•*)(K|X_•)) is an isomorphism. (ILO14, Exposé XII, Théorème 2.2.4 and §2.4, pp. 192–194 (printed); ILO14 line 9093).

S noetherian, X and Y of finite type over S; torsion coefficients. The noetherian source theorem is used here in this finite-type scope, which suffices for the applications to open and closed immersions.

A proof route is as follows. Express both sides through oriented products with §3.2 and apply §3.5 to the induced oriented hypercovering (§3.3) (ILO XII 2.4). Typical use: Y = Z a closed subscheme of the base, so the restriction of Rj_* to Z is computed from the restrictions over a hypercovering (ILO XIII 2.2.3, XV 2.2.2).

*Needs:* §3.5; §3.2; §3.3.

**Checks.**

- For S_• constant the map is the identity.

- For X = U ⊂ S open, g : Z → S the closed complement and S_• regular with snc preimage of Z, the right side is computed from Rj_(•*)Λ, which absolute purity describes.

### Examples

A strict trait contributes the three underlying point pairs (s,s), (η,η), (s,η) to its self-oriented product; the reversed pair is absent. Over a separably closed point, the oriented product with a point recovers the other topos. The constant hypercover gives the identity adjunction in every degree (ILO14, XI §§1–2, XII 2.2.1).

### Dependencies

Layer 0; AdicEtaleGeometry §§A1.14–A1.15; ClassicalAdicEtaleCohomology §5.4 for the scheme-oriented product; EnhancedDerivedSheaves §§0.1–0.4, E2; EtaleCohomologyFoundations §§F.1, F.2.1; SchemeAndStackFoundations §§2.15–2.16; LefschetzPencilsAndVanishingCycles §§0.2–0.5 for the trait comparison.

## Layer 4: Gabber's finiteness theorem

Separate the proof of constructibility using weak uniformization from the proof of global boundedness using prime-to-ℓ uniformization. The base may have infinite Krull dimension.

### 4.1 Constructibility of direct images via weak uniformization

Let X be a noetherian quasi-excellent scheme, f : Y → X a morphism of finite type, n ≥ 1 invertible on X and F a constructible sheaf of ℤ/n-modules on Y. Then every R^q f_*F is constructible. (ILO14, Exposé XIII, §2 (2.1–2.2, Théorème 2.2.2), pp. 195–197 (printed); ILO14 line 9294; SGA4half, [Th. finitude] Théorème 1.9(i), p. 236; proof §2, pp. 238–241; SGA4half line 7774).

X noetherian quasi-excellent; n invertible on X; f of finite type; F constructible.

A proof route is as follows. Classical reductions : to F = ℤ/ℓ constant and to f an open immersion j : U → X (ILO XIII 2.1.1–2.1.2). By the constructibility criterion of ILO XIII §2.2 it suffices that for every closed immersion g : Z → X, g^*R^q j_*ℤ/ℓ is constructible over a dense open of Z. Take an alteration hypercover X_• → X regular with snc preimage of the boundary X − U in degrees ≤ q + 1 (§2.4). Absolute purity makes Rj_(p*)ℤ/ℓ constructible on X_p, hence so is its restriction to Z_p = Z ×_X X_p; no snc condition on the test-closed subset Z is required. Apply Deligne’s generic constructibility over the noetherian base Z (SGA 4½ [Th. finitude] 1.9(i), p. 236) to the finite-type maps ε_p : Z_p → Z and the finitely many constructible cohomology sheaves needed in total degree q. These maps need not be proper. A common dense open of Z works, and oriented hypercover base change identifies the truncated descent complex with g^*Rj_*ℤ/ℓ (ILO XIII 2.2.3). Use the general-base generic-constructibility contract of EtaleCohomologyFoundations §F.3.

*Needs:* §2.4; §3.6; §2.2; LefschetzPencilsAndVanishingCycles §0.10; EtaleCohomologyFoundations §§F.0–F.1, 0.7; EtaleCohomologyFoundations §F.3, the general-base generic-constructibility contract.

**Checks.**

- For X of finite type over a field this recovers Deligne's finiteness theorem of SGA 4½ for open immersions.

- ILO XIX 2.2 gives a noetherian non-quasi-excellent example with geometric stalk dimensions 2 at infinitely many boundary points and 1 at the boundary generic point; R¹j_*ℤ/2 is not constructible (ILO14 line 17123).

### 4.2 Gabber's finiteness theorem

Let X be a noetherian quasi-excellent scheme, f : Y → X a morphism of finite type, n ≥ 1 invertible on X and F a constructible sheaf of ℤ/n-modules on Y. Then (i) every R^q f_*F is constructible, and (ii) there is an integer N with R^q f_*F = 0 for q ≥ N. Equivalently Rf_* : D⁺(Y_ét, ℤ/n) → D⁺(X_ét, ℤ/n) carries D^b_c(Y_ét, ℤ/n) into D^b_c(X_ét, ℤ/n). (ILO14, Exposé XIII, Théorème 1.1.1, 1.1.2 and §3, pp. 195 and 198–204 (printed); Exposé 0, Théorème 1; ILO14 line 9260).

X noetherian quasi-excellent (possibly of infinite Krull dimension); n invertible on X.

A proof route is as follows. Part (i) is §4.1; the proof of both parts at once proceeds by induction on c of the statement (P_c): for an open immersion j : U → X and K ∈ D^b_c(U), Rj_*K is constructible and bounded outside a closed subset of codimension > c (ILO XIII 3.1). Inductive step: by prime-to-ℓ uniformization (§2.3) in the standard form of §0.3 (proper birational, Nisnevich, finite flat of degree prime to ℓ), compare the defect complexes ψ along the three kinds of maps; the finite flat step is split by the trace since the degree is prime to ℓ (ILO XIII 3.2–3.5). On the regular schemes with snc boundary at the top, Rj_*Λ is constructible and bounded by absolute purity (ILO XIII 3.6.2); reduce from K to constant coefficients (ILO XIII 3.7).

*Needs:* §4.1; §2.3; §0.3; §2.4; LefschetzPencilsAndVanishingCycles §0.10; EtaleCohomologyFoundations §§F.0–F.1, 0.7.

**Checks.**

- For proper f, constructibility requires no quasi-excellence assumption; noetherianity and the stated coefficient hypotheses remain in force.

- For X = Spec of a strictly henselian regular local ring of dimension d and j the complement of an snc divisor with r branches, Rj_*ℤ/n has cohomology in degrees 0, …, r only (exterior algebra), in accordance with (ii).

- In characteristic p, H¹(𝔸¹_k, ℤ/p) for algebraically closed k contains independent Artin–Schreier classes t^m for positive m not divisible by p and is infinite; it is not a constructible sheaf on Spec k. Invertibility of n cannot be omitted (SchemeAndStackFoundations §2.11, Artin–Schreier sequence).

### Examples

At an snc point with r branches, R^qj_*Λ has stalk the q-th exterior power of Λ(−1)^r. For r = 0,1,2 its ranks are respectively (1), (1,1), (1,2,1), with all later terms zero. This verifies boundedness and the boundary twist simultaneously (ILO14, XIII §§2–3; LefschetzPencilsAndVanishingCycles §0.10).

### Dependencies

§0.3, Layers 2–3; LefschetzPencilsAndVanishingCycles §0.10; EtaleCohomologyFoundations §§F.0–F.3, including the general-base generic-constructibility contract.

## Layer 5: Dimension functions, affine Lefschetz and cohomological dimension

Use dimension functions compatible with étale specialization, regular base change and the trait affine Lefschetz theorem to prove the quasi-excellent affine bound. Completion and a Čech argument then give the bound for arbitrary strictly local noetherian schemes.

### 5.1 Dimension functions

Let X be a locally noetherian scheme. For points x, y of X with geometric points x̄, ȳ, a specialization x̄ ⇝ ȳ is an X-morphism X_(x̄) → X_(ȳ) of strict henselizations (equivalently an X-morphism x̄ → X_(ȳ)); it has codimension r if the closure in X_(ȳ) of the image of x̄ has dimension r. y is an étale immediate specialization of x if some x̄ ⇝ ȳ has codimension 1. A dimension function on X is a map δ : X → ℤ such that δ(y) = δ(x) − 1 whenever y is an étale immediate specialization of x. For a sheaf G on X, δ(G) = sup{δ(x) : G_x̄ ≠ 0} (−∞ for G = 0). (ILO14, Exposé XIV, Définitions 2.1.1–2.1.2 and 2.1.8, Remarque 2.2.3, Corollaire 2.4.5, pp. 209–216 (printed); Exposé XVII, Définition 2.1.1, p. 263; ILO14 line 9864).

X locally noetherian; the notion depends only on X_red. Sign convention: generizations have larger δ (as in ILO XIV 2.1.8 and XVII 2.1.1).

Its interface consists of the following facts.

- The set of dimension functions on X, as functions X → ℤ.

- Composition with an étale U → X gives a dimension function on U; dimension functions on étale X-schemes form an étale sheaf.

- The difference of two dimension functions is locally constant; dimension functions form a torsor under locally constant ℤ-valued functions wherever one exists.

- For X strictly local, noetherian and universally catenary, δ(t) = dim closure{t} is the normalized dimension function with δ(closed point) = 0 (ILO XIV 2.4.5). This applies to strictly local quasi-excellent schemes, which are universally catenary by the supplied henselian quasi-excellence and universal catenarity contract (ILO XIV Proposition 1.3.2; ILO14 line 9860).

- On an integral universally catenary X, x ↦ −dim O_(X,x) is a dimension function (ILO XIV 2.2.2).

- On X of finite type over ℤ, or local universally catenary, x ↦ dim of the closure of x is a dimension function (ILO XIV 2.4.5); use the supplied finite-type-field dimension function for that comparison.

- δ(G) for a sheaf G, with δ(G) ≤ δ(H) when G is a subquotient of H.

A proof route is as follows. Definition (ILO XIV 2.1.1–2.1.2, 2.1.8); étale immediate specializations are detected on strict henselizations of the closure (ILO XIV 2.1.3) and, for quasi-excellent X, on the completion (ILO XIV 2.1.7).

*Needs:* SchemeAndStackFoundations §§0.12–0.14; SchemeAndStackFoundations §§0.12–0.16, 0.21, the henselian quasi-excellence and universal catenarity contract; Mathlib `ringKrullDim`; EtaleCohomologyFoundations §F.8; EtaleDualityAndPerverseSheaves §§2.4, 2.11.

**Checks.**

- On a strictly henselian trait S with closed point s and generic point η, δ(s) = 0 and δ(η) = 1 define a dimension function, and every dimension function is δ + c for an integer c.

- On Spec k every function is a dimension function (there are no immediate specializations).

- On 𝔸¹_R over a trait R, x ↦ dim of the closure of x is not a dimension function: the closed point (πt − 1) has dimension 0 while the generic point has dimension 2 although the specialization is immediate; x ↦ −dim O_(X,x) is one.

- For X the union of a line and a plane meeting at a point, x ↦ −dim O_(X,x) is not a dimension function (ILO XIV 2.2.3).

- For X of finite type over a field, x ↦ dim of the closure of x is a dimension function and agrees with EtaleCohomologyFoundations §F.8.

### 5.2 Existence of dimension functions

(1) (Gabber) A noetherian scheme is universally catenary if and only if it admits a dimension function Zariski-locally. (2) (Gabber) Every quasi-excellent scheme admits dimension functions étale-locally, and they form an étale torsor under the sheaf of locally constant ℤ-valued functions. (3) On a normal quasi-excellent scheme, x ↦ −dim O_(X,x) is a dimension function. (ILO14, Exposé XIV, Théorèmes 2.2.1 and 2.3.1, Propositions 2.2.2, 2.2.6, 2.3.3, pp. 212–214 (printed); ILO14 line 9995).

Noetherian (1); quasi-excellent (2), (3).

A proof route is as follows. (1) ⇒: on an integral universally catenary scheme −dim O is a dimension function, and the local choices on components glue on an open neighbourhood (ILO XIV 2.2.2, 2.2.4). ⇐: a dimension function forces catenarity (ILO XIV 2.2.5), and then Ratliff's theorem on formal catenarity of henselian local rings gives universal catenarity (ILO XIV 1.2.2, 1.3.1, 2.2.6). (3) for normal quasi-excellent X: the henselisation is quasi-excellent and universally catenary by the supplied henselian quasi-excellence and universal catenarity contract (ILO XIV 1.3.2) and unibranch, so Zariski and étale immediate specializations agree (ILO XIV 2.3.3). (2) glue over irreducible components étale-locally (ILO XIV 2.3.2) and reduce to normal integral X via the normalisation (ILO XIV 2.3.4–2.3.5).

*Needs:* §5.1; SchemeAndStackFoundations §0.21, the henselian quasi-excellence and universal catenarity contract; SchemeAndStackFoundations §§0.12–0.14; SchemeAndStackFoundations §§0.12–0.16, 0.21.

**Checks.**

- Nagata's catenary but not universally catenary local domain (ILO XIV 2.6) has no dimension function Zariski-locally, by (1).

- A strictly henselian trait has the global dimension function δ(η) = 1, δ(s) = 0; this computation does not imply that the trait is excellent.

### 5.3 Base change along regular morphisms

Consider a cartesian square T′ = T ×_S S′ with f : T → S quasi-compact and quasi-separated, g : S′ → S a regular morphism of noetherian schemes, f′ : T′ → S′ and g′ : T′ → T. For n invertible on S and every sheaf F of ℤ/n-modules on T, the base change map g^*Rf_*F → Rf′_*g′^*F is an isomorphism. (ILO14, Exposé XIV, Lemme 2.5.3, pp. 216–217 (printed); ILO14 line 10216).

g regular between noetherian schemes; f qcqs; n invertible on S.

A proof route is as follows. Popescu: write S′ as a filtered limit of smooth S-schemes S_i (SchemeAndStackFoundations §0.15). Smooth base change along each S_i → S and passage to the limit in étale cohomology (ILO XIV 2.5.3).

*Needs:* SchemeAndStackFoundations §§0.12–0.16, 0.21; SchemeAndStackFoundations §§2.12, 2.15–2.16; EtaleCohomologyFoundations §§F.0–F.1, 0.7, F.2.2 for smooth base change.

**Checks.**

- For A strictly henselian excellent local and an open U ⊆ Spec A, regular base change evaluated at the closed point identifies H^q(U,F) with H^q(U ×_A Â,F). Strict locality is needed for this global-cohomology deduction (ILO XV 1.2.5).

- For g smooth this is smooth base change.

- Without henselianity global cohomology can change: over A = k[t]_(t), char k ≠ 2, the étale cover z² = 1+t has no section over A but has a section over k⟦t⟧. The regular-base-change sheaf assertion is unaffected.

### 5.4 Dimension functions induced along finite-type and regular morphisms

Let δ_X be a dimension function on a noetherian scheme X. (1) For f : Y → X of finite type, δ_Y(y) = δ_X(f(y)) + trdeg(κ(y)/κ(f(y))) is a dimension function on Y (written f^*δ_X). (2) For f : Y → X a regular morphism of excellent schemes, δ_Y(y) = δ_X(f(y)) − dim O_(Y_(f(y)), y) is a dimension function on Y. (ILO14, Exposé XIV, Proposition 2.5.1, Corollaire 2.5.2 and Proposition 2.5.4, pp. 216–218 (printed); Exposé XVII, Propositions 4.1.1–4.1.2, p. 280; ILO14 line 10198).

(1) f of finite type, X noetherian with a dimension function; (2) f regular (flat with geometrically regular fibres) between excellent schemes.

A proof route is as follows. (1) Reduce to X, Y integral and f dominant; X is universally catenary by §5.2, so δ_X = −dim O_X + const, and the dimension formula gives δ_Y = −dim O_Y + trdeg(κ(Y)/κ(X)) + const (ILO XIV 2.5.1–2.5.2). (2) Reduce to a local regular map between strictly local excellent schemes. The regular fibres are universally catenary. On each fibre the difference between the displayed function and an existing dimension function is locally constant; regular base change on H⁰ shows that these fibres are connected in this strictly local situation. The difference therefore descends to X, where the Hauptidealsatz makes it constant along immediate specializations (ILO XIV 2.5.3–2.5.4, pp. 217–218).

*Needs:* §5.1; §5.2; §5.3; SchemeAndStackFoundations §0.21, the henselian quasi-excellence and universal catenarity contract.

**Checks.**

- For f : 𝔸¹_k → Spec k with δ = 0 on the base, (1) gives δ(η) = 1 and δ(closed point) = 0.

- For the completion map Spec Â → Spec A of an excellent local ring with δ(closed point) = 0, (2) gives the dimension function of Spec Â vanishing at its closed point.

- For f : 𝔸¹_k → Spec k with base dimension function 0, the regular transport (2) gives values 0 at the generic point and −1 at a closed point. These differ by the constant 1 from the finite-type transport (1), which gives 1 and 0; conflating the two rules loses the smooth relative-dimension shift.

### 5.5 Strict-local consequence of trait affine Lefschetz

Let S be a trait, X′ a strictly local scheme essentially of finite type over S of dimension d, U ⊂ X′ an affine open and n invertible on S. Prove H^q(U, ℤ/n) = 0 for q > d. (ILO14, Exposé XV, §3.3.2, p. 224 (printed), using the trait theorem recalled in Remarque 1.1.3, p. 219; ILO14 lines 10337, 10552).

A proof route applies the affine support bound supplied by LefschetzPencilsAndVanishingCycles §6.2 (the trait affine-Lefschetz contract) to finite-type trait models. Étale continuity and the approximation in ILO XV 3.3.2 pass the bound to strict localizations and then to X′. This reduction uses the supplied trait bound, independently of §5.6.

*Needs:* §5.4; LefschetzPencilsAndVanishingCycles §6.2, the trait affine-Lefschetz contract; SchemeAndStackFoundations §2.15 for torsion étale continuity.

**Checks.**

- For X′ = Spec k with k separably closed and U = X′, d = 0, H⁰(U,ℤ/n) = ℤ/n and H^q(U,ℤ/n) = 0 for q > 0.

- For X′ = S a strictly henselian trait and U = η, d = 1, H¹(U,ℤ/n) = ℤ/n(−1) and H^q(U,ℤ/n) = 0 for q > 1. In the supplied support bound, R¹j_*ℤ/n has δ = 0 = δ(η) − 1, so the normalization is sharp.

### 5.6 Gabber's affine Lefschetz theorem

Let X be a quasi-excellent scheme with a dimension function δ_X, f : Y → X an affine morphism of finite type and n invertible on X. For every constructible sheaf F of ℤ/n-modules on Y and every q, δ_X(R^q f_*F) ≤ f^*δ_X(F) − q, where f^*δ_X is the induced dimension function of §5.4. Equivalently, for X strictly local quasi-excellent with δ_X(t) = dim of the closure of t, H^q(Y, F) = 0 for q > f^*δ_X(F). (ILO14, Exposé XV, Théorème 1.1.2 and §§1.2–3, pp. 219–224 (printed); Exposé 0, Théorème 7; ILO14 line 10333).

X quasi-excellent with a dimension function; f affine of finite type; n invertible on X; F constructible.

A proof route is as follows. Reformulate stalkwise at geometric points and reduce to the strictly local statement; reduce to an affine open immersion and constant coefficients by the coefficient and open-immersion reductions of ILO XV 1.2.1–1.2.4. Reduce to X complete by regular base change along the completion (§5.3, ILO XV 1.2.5). Take an alteration hypercovering X_• with regular terms and snc boundary in degrees ≤ N (§2.4). By oriented descent (§3.6) and the branch comparison below, H^q(U, ℤ/n) for q ≤ N is unchanged along a local morphism of strictly local schemes X′ → X whenever, for every level q ≤ N + 1, the boundary of X_q and of its base change X′_q have the same combinatorics along the closed fibre (ILO XV 2.2.2–2.2.4, pp. 221–222). Approximate X_• over the henselisation of an affine space over a Cohen ring by Popescu (§0.5), choosing the approximation fine enough that each level stays regular near the closed fibre and the images of the branch equations stay linearly independent in m/m², which gives the same-combinatorics hypothesis at every geometric point of the closed fibre; specialise along a section close to the identity to a scheme essentially of finite type over a trait, and conclude by §5.5 (ILO XV 3).

Branch comparison. Let g : X′ → X be a morphism of schemes, j : U → X an open immersion with closed complement Z, j′ : U′ = g⁻¹(U) → X′ its base change with complement Z′, and F ⊆ Z a closed subset with preimage F′. Say that (Z ⊂ X) and (Z′ ⊂ X′) have the same combinatorics along F if for every geometric point z′ of F′ with image z: the strict henselizations X_(z) and X′_(z′) are regular; Z_(z) is a strict normal crossings divisor with branch equations f₁, …, f_r forming part of a regular system of parameters; and the images of g*f₁, …, g*f_r in m/m², for m the maximal ideal of X′_(z′), are linearly independent over the residue field. Then Z′_(z′) is a strict normal crossings divisor with branches V(g*f_i), of the same codimension as Z_(z). Prove that, under this hypothesis, for every n invertible on X the base-change map g*(Rj_*ℤ/n)|F′ → (Rj′_*ℤ/n)|F′ is an isomorphism (ILO14, Exposé XV, Définition 2.1.4, 2.1.5 and Proposition 2.1.7, pp. 220–221 (printed); ILO14 line 10400; in 2.1.4(iii) the maximal ideal is that of X′_(z′), since every g*f_i vanishes on Z′_(z′)). Route: localize at z′ and z to a local morphism of strictly local schemes; by absolute purity (LefschetzPencilsAndVanishingCycles §0.10) both RΓ(U, ℤ/n) and RΓ(U′, ℤ/n) are exterior algebras on their H¹, which are free on the Kummer classes of the branches; the Kummer class of V(f_i) restricts to the Kummer class of V(g*f_i), a branch of Z′_(z′) by the cotangent condition, so the map on H¹, hence on every H^q, is an isomorphism.

*Needs:* §5.5; §5.4; §5.3; §2.4; §3.6; §0.5; §0.3; LefschetzPencilsAndVanishingCycles §0.10; EtaleCohomologyFoundations §§F.0–F.1, 0.7; SchemeAndStackFoundations §0.21, the henselian quasi-excellence and universal catenarity contract.

**Checks.**

- For X = Spec k (k separably closed) this is Artin vanishing H^q(Y, F) = 0 for q > dim Supp F on affine Y.

- For X a strictly henselian regular local scheme of dimension 2 and U = X − V(f), H^q(U, ℤ/n) = 0 for q > 2.

- Branch comparison, negative control: let X and X′ be strictly henselian traits with uniformizers t and u, ℓ a prime invertible on both, g given by t ↦ u^ℓ, Z and Z′ the closed points and F = Z. Both boundaries have exactly one branch, but g*t = u^ℓ lies in m², so its image in m/m² is zero and the cotangent condition fails. Indeed H¹(U, ℤ/ℓ(1)) = ℤ/ℓ is generated by the Kummer class of t, which pulls back to the class of u^ℓ, that is ℓ times the generator, which is 0: the comparison map on H¹ is zero. Equal numbers of branches do not suffice.

- Branch comparison, positive case: for g given by t ↦ v·u with v a unit, g*t has nonzero image in m/m², and the Kummer class of t pulls back to that of u plus the class of the unit v, which is 0 because a unit of a strictly henselian ring is an ℓ-th power; the map on H¹ is the identity of ℤ/ℓ.

- Branch comparison, two branches exchanged: let k be separably closed with ℓ invertible in k, X = Spec k⟦x,y⟧, X′ = Spec k⟦u,v⟧, Z = V(xy), F the closed point, and g given by x ↦ v, y ↦ u. The images of g*x = v and g*y = u in m/m² are independent, so the hypothesis holds. In the Kummer bases ([x], [y]) of H¹(U, ℤ/ℓ(1)) and ([u], [v]) of H¹(U′, ℤ/ℓ(1)) the comparison map is the transposition matrix, and on H²(−, ℤ/ℓ(2)) = ∧²H¹ it sends [x]∪[y] to [v]∪[u] = −[u]∪[v]: multiplication by −1, which is 1 modulo 2 and 2 modulo 3. The comparison is an isomorphism that need not preserve an ordering of the branches, so a definition matching the i-th branch of Z with the i-th branch of Z′ would reject this g.

### 5.7 Local form of the affine Lefschetz theorem

Let X be a strictly local quasi-excellent scheme of dimension d, U ⊂ X an affine open and n invertible on X. Then H^q(U, ℤ/n) = 0 for q > d. More generally, for X henselian local quasi-excellent of dimension d with residue field k and ℓ invertible on X, cd_ℓ(U) ≤ d + cd_ℓ(k) for every affine open U; if X is integral with fraction field K, cd_ℓ(K) = d + cd_ℓ(k). (ILO14, Exposé XV, Corollaire 1.2.2 and Corollaire 1.2.4, p. 220 (printed); Exposé 0, Corollaire 8, p. 5; ILO14 line 10350).

X quasi-excellent; strictly local (first statement) or henselian local (second).

A proof route is as follows. Equivalent to §5.6 for open immersions and constant coefficients (ILO XV 1.2.3–1.2.4). For henselian X combine with the Hochschild–Serre spectral sequence over the residue field (SchemeAndStackFoundations §2.15); the lower bound for K is the dimension bound recalled in ILO Exposé 0, Corollaire 8.

*Needs:* §5.6; §5.1; SchemeAndStackFoundations §§2.12, 2.15–2.16.

**Checks.**

- For X = Spec of a strictly henselian trait and U = η, H^q(η, ℤ/n) = 0 for q > 1 (the tame inertia is ℓ-cohomologically of dimension 1).

- For X = Spec W(k̄)⟦x⟧ with k̄ algebraically closed (d = 2) and U = X[1/p], H^q(U, ℤ/ℓ) = 0 for q > 2.

### 5.8 Gabber's bound on cohomological dimension

Let X be a strictly local noetherian scheme of dimension d > 0 and ℓ a prime invertible on X. For every open U ⊂ X, cd_ℓ(U) ≤ 2d − 1. Consequently, if X is integral with fraction field K then cd_ℓ(K) ≤ 2d − 1; and for f : X′ → Y of finite type with Y noetherian of finite dimension and ℓ invertible on Y, Rf_* has finite ℓ-cohomological dimension. (ILO14, Exposé XVIII-A, Théorème 1.1, Corollaires 1.2 and 1.4, Lemmes 2.1–2.2, pp. 331–334 (printed); ILO14 line 16193).

X noetherian strictly local, not necessarily quasi-excellent; ℓ invertible.

The native headline `cohomologicalDimension_le_of_strictlyLocal` states the open-subscheme bound for every abelian étale sheaf F of ℓ-primary torsion: H^q(U,F) = 0 for 2d ≤ q. Strict locality is expressed by `HenselianLocalRing` and a separably closed residue field; no excellence or regularity is assumed. The sectionwise torsion hypothesis is tested on affine étale objects. These form a quasi-compact basis, so local annihilation of every germ yields a single ℓ-power killing any section on each basis object. This is equivalent to F being an ℓ-primary torsion sheaf; it imposes no uniform exponent on F or on sections over arbitrary non-quasi-compact objects (ILO14, XVIII-A 1.1; ILO14 lines 16193–16199).

A proof route is as follows. Punctured spectrum: by Gabber's formal base change (ArcTopologyAndDescent §§8.6–8.9) pass to the completion, which is excellent; cover U = X − {x} by d principal opens X_(f_i) and use the Čech spectral sequence with §5.7 to get H^i(U, F) = 0 for i ≥ 2d (ILO XVIII-A Lemme 2.1). Coniveau spectral sequence: H^i_Y(X, F) = 0 for i > sup_(y∈Y)(cd_ℓ(κ(y)) + 2 dim O_(X,y)) (ILO XVIII-A Lemme 2.2). Induction on d using the restriction from U to dense opens V and the inductive bound for residue fields (ILO XVIII-A §2); the corollaries follow by limits and by the Čech reduction to affine f (ILO XVIII-A 1.2, 1.4).

*Needs:* §5.7; ArcTopologyAndDescent §§8.3, 8.6–8.9; SchemeAndStackFoundations §§2.12, 2.15–2.16.

**Checks.**

- For A = k⟦t⟧ with k separably closed and ℓ invertible, d = 1 and H¹(η,ℤ/ℓ) = ℤ/ℓ(−1) while H^q(η,F) = 0 for every ℓ-primary torsion F and q ≥ 2. This attains the bound and rejects replacing 2d − 1 by 0.

- A constant ℓ-primary group with elements of orders ℓ, ℓ², … is allowed. On an affine étale object every section is killed by some ℓ-power; on an infinite disjoint union the section taking a generator of order ℓ^r on component r has no global annihilating exponent. Testing all objects sectionwise would incorrectly exclude this sheaf.

- Infinite-dimensional noetherian bases are excluded from the finiteness of cd(Rf_*); for X of finite dimension the bound complements §4.2 (ii).

- For X = Spec k with k separably closed and d = 0, cd_ℓ(X) = 0 whereas 2d − 1 = −1; the condition d > 0 is essential. For the empty open every positive cohomology group is zero.

### Examples

A strict trait has normalized δ-values 1 and 0 and tame generic cohomology in degrees 0 and 1. On a strict regular surface the principal punctured open has no cohomology above 2, while the punctured spectrum can have nonzero H³ = Λ(−2). The affine d-bound and the general 2d−1 bound therefore have different equality cases (ILO14, XV 1.2.4, XVIII-A 1.1).

### Dependencies

Layers 0, 2–3; SchemeAndStackFoundations §§0.12–0.16, 0.21, 2.15–2.16, 4.20; EtaleCohomologyFoundations §§F.2.1–F.3, F.8; LefschetzPencilsAndVanishingCycles §0.10; ArcTopologyAndDescent §§8.3, 8.8–8.9.

## Layer 6: Dualizing complexes on excellent schemes and local duality

Throughout this layer n ≥ 2 is invertible and Λ = ℤ/n. Construct specialization transitions and pinned complexes before proving existence and biduality. The normalization is fixed at every point; uniqueness includes preservation of those pinnings.

### 6.1 Transition morphisms for specializations

Let n ≥ 2, Λ = ℤ/n and X be noetherian excellent over ℤ[1/n]. For K ∈ D⁺(X_ét,Λ), write RΓ_x̄(K) for cohomology on X_(x̄) with supports in its closed point. A specialization ȳ ⇝ x̄ of codimension c = 0 or 1 gives a natural map sp : RΓ_ȳ(K) → RΓ_x̄(K)(c)[2c] in D⁺(Λ). For c = 0 it is transport along the corresponding geometric-point isomorphism. On a strictly henselian trait, first project the generic stalk to its wild-inertia invariants K_η̄^S (averaging is available for the invertible torsion coefficients); the tame-inertia evaluation construction then gives the codimension-one map independently of the generator. For an integral one-dimensional strict localization, use its normalization and multiply the trait map by 1/[s̃:s], the inverse purely inseparable residue degree. Closed-support adjunction gives the map for every immediate specialization. Higher-codimension transitions will be constructed on cohomology groups in §6.2; no derived map in arbitrary codimension is asserted. (ILO14, Exposé XVII, §§1.2–1.4, especially Définitions 1.2.3.1, 1.3.1, 1.4.1 and Remarque 1.4.2, pp. 260–263 (printed); ILO14 line 12339).

X noetherian excellent over ℤ[1/n] (quasi-excellent suffices étale-locally, ILO XVII 3.1.3); Λ = ℤ/n.

Its interface consists of the following facts.

- The natural derived map RΓ_ȳ(K) → RΓ_x̄(K)(c)[2c] for codimension c = 0 or 1.

- Naturality in K ∈ D⁺(X_ét, Λ).

- Immediate and codimension-zero derived maps compose when the total codimension is at most one. For arbitrary total codimension the cohomology-group composition law is the joint theorem §6.2 (ILO XVII 3.1.2).

- For finite maps, compatibility of immediate transitions with the trace, including the inseparable residue-degree normalization (ILO XVII 3.3.1).

- On a strictly henselian trait first project to wild-inertia invariants, then apply tame-inertia evaluation; the result is independent of the tame generator.

- Compatibility with étale localisation (ILO XVII 2.2.1).

A proof route is as follows. On a strictly henselian trait compute RΓ_s(K) by the complex F(K) of XVII 1.2.2.1. The map from K_η̄(−1) first uses K_η̄ → K_η̄^S and then tame evaluation; the generator-change homotopy makes the induced derived map independent of the choice (1.2.3.1–1.2.3.2, pp. 260–262). For an integral strictly local excellent curve normalize to a strictly henselian trait and insert the factor 1/[s̃:s] (1.3.1, p. 262). For an immediate specialization on X use the closure of the generizing point and i^! (1.4.1). Codimension-zero transport and immediate maps compose when the total codimension is at most one (1.4.2, p. 263). The higher group maps and their general composition law belong to the joint induction of 3.1.1–3.1.2 in the joint top-class theorem.

*Needs:* EtaleCohomologyFoundations §F.5; EtaleDualityAndPerverseSheaves §§0.1–0.2; EtaleCohomologyFoundations §0.7 and EnhancedDerivedSheaves §§0.3–0.4 for open-immersion tensor–Hom exchange; EtaleCohomologyFoundations §§F.0–F.1, 0.7; LefschetzPencilsAndVanishingCycles §§0.2–0.5; §5.1; SchemeAndStackFoundations §0.21, the henselian quasi-excellence and universal catenarity contract.

**Checks.**

- On a strictly henselian trait, sp_(η̄→s)(Λ) : Λ → H²_s(X, Λ(1)) is an isomorphism, matching the Kummer boundary of a uniformizer.

- For the identity specialization (c = 0), sp is the identity of RΓ_x̄(K).

- On a trait with residue characteristic p ≠ ℓ, let a finite p-quotient of wild inertia act on an ℓ-primary generic stalk M with M^S = 0. The transition for j_!M vanishes. This detects omission of the averaging projection M → M^S.

- For K = i_(s*)Λ supported at the closed point of a trait, RΓ_η̄(K) = 0 so sp vanishes, although RΓ_s(K) = Λ ≠ 0.

- For a purely inseparable residue extension of degree p^r, the transition normalization multiplies the trace by p^(−r) in Λ. For p = 2 and Λ = ℤ/3, degree 2 has inverse 2, so 2·2 = 1; for p = 3 and Λ = ℤ/2 the degree-3 inverse is 1.

### 6.2 Higher transitions and top-degree local cohomology

Let X be a normal strictly henselian excellent local ℤ[1/n]-scheme of dimension d with closed point x. Then H^q_x(X, Λ(d)) = 0 for q > 2d, and there is an isomorphism [x] : Λ → H²ᵈ_x(X, Λ(d)) compatible with the transition morphisms of immediate specializations. Jointly, for every noetherian excellent ℤ[1/n]-scheme, K ∈ D⁺(X_ét,Λ) and specialization ȳ ⇝ x̄ of codimension c, there are natural group maps sp : H^i_ȳ(K) → Hⁱ⁺²ᶜ_x̄(K(c)), extending the codimension-zero and codimension-one derived transitions. They compose along specializations and commute with finite trace. These are maps of cohomology groups; the theorem makes no arbitrary-codimension derived-map assertion. (ILO14, Exposé XVII, Théorèmes 3.1.1–3.1.2 and §§3.2–3.6, pp. 268–280 (printed); ILO14 line 12855).

For the top class X is normal strictly local excellent of dimension d; for group transitions X is any noetherian excellent scheme. In both cases Λ = ℤ/n with n invertible.

A proof route is as follows. Use the affine Lefschetz cohomological bounds for vanishing above 2d (ILO XVII 3.2). Prove the top-class generator in dimension two by resolving an excellent surface and computing the exceptional-curve cohomology with absolute purity (ILO XVII §3.4). Construct arbitrary-codimension group transitions by chains of immediate specializations. The surface computation and connectedness arguments give independence of the chain and finite-map compatibility (ILO XVII §3.5). This is part of the simultaneous induction proving Theorems 3.1.1 and 3.1.2, rather than an invocation of the final top-class theorem in the immediate-transition construction. For higher-dimensional normal strict local X, coniveau and the lower-dimensional classes show that [x] generates H²ᵈ_x (ILO XVII §3.6.2). Formal base change reduces injectivity to complete X. Embed complete X in a regular complete local scheme using Cohen structure; exceptional pullback of the already constructed regular potential complex supplies the putative pinnings and their immediate compatibility (2.4.4.1). The normal-scheme lemma Λ ≅ τ_(≤0)K and the transition square force [x] to be injective (ILO XVII §3.6.3–3.6.4, pp. 279–280). This uses the regular case, not general existence of potential dualizing complexes.

*Needs:* §6.1; §5.7; AdicCoefficientsAndComparisonsPartII §§PA.0.2–PA.0.8, PA.0.11; LefschetzPencilsAndVanishingCycles §0.10; EtaleCohomologyFoundations §F.6; EtaleDualityAndPerverseSheaves §1.1; §6.4; ArcTopologyAndDescent §§8.3, 8.6–8.9; DeformationAndDerivedPatchingAlgebra §1.10 and the coefficient-field contract; EtaleCohomologyFoundations §F.5; EtaleDualityAndPerverseSheaves §§0.1–0.2; EtaleCohomologyFoundations §0.7 and EnhancedDerivedSheaves §§0.3–0.4 for open-immersion tensor–Hom exchange; EtaleCohomologyFoundations §0.7 for the closed-immersion support functor; the regular pinned construction in §6.4.

**Checks.**

- For X regular, [x] is the fundamental class of the closed point given by absolute purity.

- For d = 1 (a strictly henselian trait), [x] is the Kummer class Λ → H²_x(Λ(1)).

- For a regular strictly henselian surface and constant Λ, two successive immediate maps on cohomology give Λ → H⁴_x(Λ(2)), the absolute-purity isomorphism; different saturated chains give the same group map.

### 6.3 Putative and potential dualizing complexes

Let X be a noetherian excellent ℤ[1/n]-scheme with a dimension function δ. A putative dualizing complex is K ∈ D⁺(X_ét, Λ) together with, for every x ∈ X, an isomorphism (pinning) RΓ_x(K) ≅ Λ(δ(x))[2δ(x)] in D⁺(x_ét, Λ). It is a potential dualizing complex if for every immediate specialization ȳ → x̄ the pinnings at y and x are compatible with sp_(ȳ→x̄) : RΓ_ȳ(K) → RΓ_x̄(K)(1)[2] (§6.1), using δ(y) = δ(x) + 1. (ILO14, Exposé XVII, Définition 2.1.2 and §2.2–2.4, pp. 263–267 (printed); ILO14 line 12581).

X noetherian excellent over ℤ[1/n]; δ a dimension function; Λ = ℤ/n.

Its interface consists of the following facts.

- A complex K with pinnings RΓ_x(K) ≅ Λ(δ(x))[2δ(x)] compatible with transition morphisms.

- Restriction along étale U → X with the restricted dimension function.

- For an integer k, K(k)[2k] is a potential dualizing complex for δ + k.

Functoriality under regular pullback and finite-type exceptional pullback is the theorem of §6.7; existence, uniqueness and membership in the perverse heart for −2δ are the theorem of §6.6. Both are proved from this definition, not part of its interface.

A proof route is as follows. Definition (ILO XVII 2.1.2). Étale restriction and quasi-finite exceptional pullback transport putative structures (2.2.1, 2.4.3.1). For f finite surjective, a putative K is potential iff f^!K with its induced pinnings is potential (2.4.3.3). Finite pushforward does not preserve rank-one pinnings: two points over a point would give Λ².

*Needs:* §6.1; §5.1; EtaleCohomologyFoundations §§F.0–F.1, 0.7; EtaleCohomologyFoundations §F.5; EtaleDualityAndPerverseSheaves §§0.1–0.2; EtaleCohomologyFoundations §0.7 and EnhancedDerivedSheaves §§0.3–0.4 for open-immersion tensor–Hom exchange.

**Checks.**

- On Spec k with δ ≡ 0, K = Λ with the identity pinning is potential; with δ ≡ 1 it is Λ(1)[2].

- On a strictly henselian trait with δ(s) = 0, δ(η) = 1, K = Λ(1)[2]: RΓ_η̄(K) = Λ(1)[2] and RΓ_s(K) ≅ Λ by Kummer theory, compatibly with sp.

- On the same trait Λ is not putative: RΓ_η̄(Λ) = Λ in degree 0, not Λ(1)[2].

- On the empty scheme 0 is the unique potential dualizing complex.

- For X separated of finite type over a field with δ(x) = dim of the closure of x, a^!Λ (EtaleDualityAndPerverseSheaves §§0.1–0.2 and EtaleCohomologyFoundations §F.5) with its purity pinnings is potential.

### 6.4 The constant sheaf on a regular scheme is potentially dualizing

Let X be a regular excellent ℤ[1/n]-scheme with the dimension function δ = −codim. The constant sheaf Λ, with the pinnings RΓ_x(Λ) ≅ Λ(−c)[−2c] (c = codim x) given by absolute cohomological purity and the fundamental classes, is a potential dualizing complex. (ILO14, Exposé XVII, Propositions 2.4.1.1, 2.4.2.1 and 2.4.4.1, pp. 265–267 (printed); ILO14 lines 12669, 12682, 12835).

X regular excellent over ℤ[1/n]; δ(x) = −dim O_(X,x).

A proof route is as follows. The pinnings exist by absolute purity for the regular immersion of the closure of x near x (LefschetzPencilsAndVanishingCycles §0.10; ILO XVI 3.1.1). Compatibility with sp for an immediate specialization ȳ → x̄: work on X_(x̄); with C the closure of ȳ and C̃ its normalisation (a strictly henselian trait), reduce via i^! and the finite map C̃ → C to the trait case (ILO XVII 2.4.2.1, 2.4.3.3–2.4.3.4).

*Needs:* §6.3; §6.1; LefschetzPencilsAndVanishingCycles §0.10; EtaleCohomologyFoundations §F.6; EtaleDualityAndPerverseSheaves §1.1.

**Checks.**

- For X a strictly henselian trait, this is the Kummer pinning of Λ at the closed point and the trivial pinning at η.

- For X smooth over a field, the pinnings agree with the smooth-pair cycle classes of EtaleCohomologyFoundations §F.6.

- For a separably closed field, codimension is 0, and the regular potential complex is Λ in degree 0 with the identity pinning. On a strict regular surface the closed-point pinning is Λ(−2)[−4]; a convention with shift +4 would put its support in degree −4 instead of 4.

### 6.5 Gabber's perverse t-structures for a perversity function

Let X be a noetherian scheme and p : X → ℤ ∪ {+∞} a perversity function: p(x) ≥ p(y) for every specialization ȳ → x̄ of geometric points. The pair (`D^(<=p)`, `D^(>=p)`) with K ∈ `D^(<=p)`(X_ét, Λ) iff K|_x ∈ `D^(<=p(x))`(x_ét, Λ) for all x, and K ∈ `D^(>=p)` iff RΓ_x(K) ∈ `D^(>=p(x))`(x_ét, Λ) for all x, is a t-structure on D⁺(X_ét, Λ), with heart Perv^p(X, Λ). (ILO14, Exposé XVII, §5.2, p. 287 (printed); ILO14 line 13886; G04, §§1, 4–6, pp. 1, 3–8; §8, Théorème 8.2, pp. 10–12; G04 lines 26, 72, 139).

X noetherian; p monotone along specializations; Λ = ℤ/n.

Its interface consists of the following facts.

- The t-structure (`D^(<=p)`, `D^(>=p)`) on D⁺(X_ét, Λ) for a perversity p.

- K ∈ `D^(<=p)` iff K|_x ∈ `D^(<=p(x))` for every point x.

- K ∈ `D^(>=p)` iff RΓ_x(K) ∈ `D^(>=p(x))` for every point x.

- Étale pullback is t-exact for the restricted perversity.

- `D^(<=p+k)` = `D^(<=p)`[−k] and `D^(>=p+k)` = `D^(>=p)`[−k].

A proof route is as follows. Use Gabber’s weak-perversity construction, valid for noetherian X with p monotone under specialization. Iteratively modify a Godement resolution by the sheaf of sections with supports in the specialization-closed families determined by p; the depth estimates and truncation arguments give orthogonality and the truncation triangle (G04 §§4–6, pp. 3–8). This construction covers perversities that do not come from a finite constructible stratification. Stalk and local-support conditions are étale-local, so restriction is t-exact. Proposition 5.2.2 of ILO XVII adds that pullback along a pseudo-open immersion is t-exact and has a perverse right adjoint τ_(≤p)Rf_*. For the finite-type-field middle-perversity comparison use the owner’s EtaleCohomologyFoundations §F.8 contract. Constructibility requires its separate hypotheses; G04 §8, Théorème 8.2, pp. 10–12 treats the constructible restriction. No general constructibility assertion for an arbitrary p is made.

*Needs:* EtaleCohomologyFoundations §§F.0–F.1, 0.7; Mathlib `CategoryTheory.Triangulated.TStructure`; EtaleCohomologyFoundations §F.8; EtaleDualityAndPerverseSheaves §§2.4, 2.11.

**Checks.**

- For X = Spec of a separably closed field and p ≡ 0, the t-structure is the standard one on D⁺(Λ).

- On a strictly henselian trait with p = −2δ (p(s) = 0, p(η) = −2), K = Λ(1)[2] lies in the heart.

- On the same trait with p = −2δ, Λ is not in `D^(<=p)`: its restriction to η is concentrated in degree 0 > −2.

- For X separated of finite type over a field and p(x) = −dim of the closure of x, the t-structure restricted to D^b_c is the middle perverse t-structure of EtaleCohomologyFoundations §F.8.

### 6.6 Existence and uniqueness of potential dualizing complexes

Let X be an excellent ℤ[1/n]-scheme with a dimension function δ. Then (X, δ) admits a potential dualizing complex K_X, unique up to unique isomorphism preserving all pinnings, the canonical map Λ → τ_(≤0)RHom(K_X, K_X) is an isomorphism, and K_X ∈ `Perv^(-2*delta)`(X, Λ). (ILO14, Exposé XVII, Théorème 5.1.1 and §§5.3–5.4, pp. 287–293 (printed); ILO14 line 13878).

X noetherian excellent over ℤ[1/n] with a global dimension function.

A proof route is as follows. Uniqueness and the τ_(≤0) statement in the normal case: every potential dualizing complex K lies in Perv^φ and in `Perv^(-2*delta)`, the induced map K → T to the perverse extension below is an isomorphism compatible with pinnings, and Λ → τ_(≤0)RHom(K, K) is an isomorphism (ILO XVII 5.3.1(b)–(c), p. 288). In general, uniqueness on X̃, Z and X̃ ×_X Z gives uniqueness of the cone construction of XVII 5.4.1. For normal X, let j : U → X be a dense regular open. With the normalized generic dimension, use the perverse extension T = j_*^φΛ for φ(x) = max(0, 2 codim(x) − 2). The localization triangle and the top local class identify its stalks and local supports with the prescribed pinnings; compatibility with immediate transitions proves potentiality (ILO XVII 5.3.1). Twists and shifts handle other dimension functions. For general reduced X use finite normalization X̃ → X and a closed complement Z of the normal locus. Combine the potential complexes on X̃, Z and X̃ ×_X Z by the explicit cone construction of XVII 5.4.1; finite-surjective shriek detection verifies the pinnings and their compatibility. Nilpotents do not change the étale topos. This is not a claim that pushing a potential complex forward along normalization preserves it.

*Needs:* §6.3; §6.5; §6.2; §6.4; EtaleCohomologyFoundations §F.5; EtaleDualityAndPerverseSheaves §§0.1–0.2; EtaleCohomologyFoundations §0.7 and EnhancedDerivedSheaves §§0.3–0.4 for open-immersion tensor–Hom exchange.

**Checks.**

- For X regular with δ = −codim, K_X = Λ (§6.4).

- For X separated of finite type over a field with δ = dim of closure, K_X = a^!Λ.

### 6.7 Functoriality of potential dualizing complexes

Let X be a noetherian excellent ℤ[1/n]-scheme with a dimension function δ_X and K a putative (resp. potential) dualizing complex. (1) For f : Y → X a regular morphism of excellent schemes and δ_Y(y) = δ_X(f(y)) − codim_(f⁻¹(f(y)))(y), f^*K is naturally putative (resp. potential) on (Y, δ_Y). (2) For f : Y → X of finite type and compactifiable and δ_Y(y) = δ_X(f(y)) + trdeg(κ(y)/κ(f(y))), f^!K is naturally putative (resp. potential) on (Y, δ_Y). Both constructions are compatible with composition. (ILO14, Exposé XVII, Propositions 4.1.1–4.1.2, Remarque 4.1.3 and §4.2, pp. 280–284 (printed); ILO14 line 13512).

Excellent noetherian schemes over ℤ[1/n]; f regular in (1), compactifiable of finite type in (2).

A proof route is as follows. (1) Pinnings pull back by regular base change for local cohomology (§5.3) and absolute purity of the regular fibres (ILO XVII 4.2.1–4.2.3). (2) Reduce to f smooth (smooth purity, EtaleCohomologyFoundations §F.6) and f a closed immersion (quasi-finite i^!) (ILO XVII 4.1.2 and §4.3).

*Needs:* §6.3; §5.4; §5.3; LefschetzPencilsAndVanishingCycles §0.10; EtaleCohomologyFoundations §F.6; EtaleDualityAndPerverseSheaves §1.1; EtaleCohomologyFoundations §F.5; EtaleDualityAndPerverseSheaves §§0.1–0.2; EtaleCohomologyFoundations §0.7 and EnhancedDerivedSheaves §§0.3–0.4 for open-immersion tensor–Hom exchange.

**Checks.**

- For f étale, (1) and (2) both give the restriction of K with the restricted δ.

- For f : 𝔸¹_X → X, (2) gives f^!K = f^*K(1)[2] with δ_Y = δ_X + 1 at generic points of fibres.

### 6.8 Dualizing complexes on noetherian schemes

First prove the open-immersion tensor–Hom exchange, independently of dualizing objects. For j : U → X an open immersion of schemes, a commutative coefficient ring Λ, F ∈ D(U_ét,Λ) and K ∈ D(X_ét,Λ), there is a natural isomorphism RHom_X(j_!F,K) ≅ Rj_*RHom_U(F,j^*K), compatible with evaluation. For a test complex M on X, tensor compatibility gives M ⊗ᴸ j_!F ≅ j_!(j^*M ⊗ᴸ F); apply the two adjunctions and tensor–Hom adjunction, then Yoneda. The resulting map carries evaluation to evaluation by the adjunction counits (ILO XVII 7.6.3, p. 311, formal exchange used in the proof; ILO14 line 15192).

*Needs:* EtaleCohomologyFoundations §0.7 for j_! ⊣ j^* and tensor compatibility; EnhancedDerivedSheaves §§0.3–0.4 for derived tensor–Hom and coherent adjunctions.

**Checks.**

- For j the identity and F = Λ, both sides are K and the exchange is the identity.

- For U empty both sides are zero, even when K is nonzero.

- For the generic open j of a strictly henselian trait and F = K = Λ with n > 1 invertible, both sides are Rj_*Λ, with closed stalk H⁰ = Λ and H¹ = Λ(−1). Replacing Rj_* by j_! would give zero at that stalk and fail the exchange.

Let X be a noetherian ℤ[1/n]-scheme and Λ = ℤ/n. A dualizing complex on X is an object K ∈ D^b_c(X_ét, Λ) such that the duality functor D_K = RHom(−, K) preserves D^b_c(X_ét, Λ) and, for every L ∈ D^b_c(X_ét, Λ), the biduality morphism L → D_K D_K L is an isomorphism. (ILO14, Exposé XVII, Définition 0.8, p. 257 (printed); ILO14 line 12208; ILO14, Exposé XVII, Proposition 7.5.1.1, pp. 308–309; Proposition 7.6.3, p. 311; Propositions 9.1–9.2, pp. 323–324; ILO14 line 12208).

X noetherian over ℤ[1/n]; constructible bounded complexes.

Its interface consists of the following facts.

- The predicate on K ∈ D^b_c(X_ét, Λ).

- D_K = RHom(−, K) as a contravariant endofunctor of D^b_c(X_ét, Λ).

- L ≅ D_K D_K L for constructible L.

- For an open immersion j : U → X, j^*K is dualizing (ILO XVII 7.6.3, p. 311). Use the formal open-immersion exchange above and biduality; bounded constructibility is part of the dualizing condition.

- Two dualizing complexes differ by tensoring with an invertible object (ILO XVII 7.5.1.1). Étale-locally an invertible object has one rank-one shifted factor Λ_ℓ[k_ℓ] for each prime-power factor Λ_ℓ = ℤ/`ell^(v_ell(n))`; the shifts can differ with ℓ. A single local form Λ[k] is valid for prime-power n, not for arbitrary composite n (XVII 9.1–9.2).

- For a potential dualizing complex on a noetherian excellent scheme with dimension function, finite quasi-injective dimension holds iff X has finite Krull dimension; in that case it satisfies the stronger finite-quasi-injective-dimension convention (ILO XVII 6.1.1). This criterion is stated with those geometric hypotheses.

A proof route is as follows. Definition (ILO XVII 0.8). For two dualizing objects, comparison of the two duality equivalences makes their difference tensor-invertible (7.5.1.1, pp. 308–309). For Λ = ℤ/n apply self-injectivity and finite-module biduality to each prime-power factor and then the Chinese remainder decomposition.

*Needs:* EtaleCohomologyFoundations §§F.0–F.1, 0.7; EtaleCohomologyFoundations §F.5; EtaleDualityAndPerverseSheaves §§0.1–0.2; EtaleCohomologyFoundations §0.7 and EnhancedDerivedSheaves §§0.3–0.4 for open-immersion tensor–Hom exchange; EtaleDualityAndPerverseSheaves §0.1.

**Checks.**

- On Spec of a separably closed field, Λ = ℤ/n is dualizing: D_Λ is Λ-linear duality on finite complexes and Λ is self-injective.

- On the same point, Λ ⊕ Λ is not dualizing: D D Λ = Hom(Λ², Λ²) = Λ⁴ ≠ Λ.

- On the empty scheme 0 is dualizing.

- For X separated of finite type over a field, the complex a^!Λ of EtaleDualityAndPerverseSheaves §§0.1–0.2 and EtaleCohomologyFoundations §F.5 is dualizing in this sense.

- At a geometric point with Λ = ℤ/6, L = 𝔽₂ ⊕ 𝔽₃[1] is invertible with inverse 𝔽₂ ⊕ 𝔽₃[−1]. Tensoring a dualizing object with L remains dualizing, although L is not Λ[k] for a single k.

- The coefficient n = 1 would make Λ = Λ ⊕ Λ = 0, and would invalidate the non-example and the geometric dimension criterion; Layer 6 uses n ≥ 2. For Λ = ℤ/4, the module ℤ/2 has infinite Tor dimension but its Λ-linear double dual is still ℤ/2.

### 6.9 Biduality for potential dualizing complexes

Let X be a noetherian excellent ℤ[1/n]-scheme with a dimension function δ and K the potential dualizing complex of (X, δ). Then K ∈ D^b_ctf(X_ét, Λ); K has finite quasi-injective dimension iff X has finite Krull dimension; D_K = RHom(−, K) preserves D^b_c(X_ét, Λ); and for every M ∈ D^b_c(X_ét, Λ) the biduality morphism M → D_K D_K M is an isomorphism. Thus K is a dualizing complex. (ILO14, Exposé XVII, Théorème 6.1.1 and §§6.2–6.5, pp. 293–300 (printed); ILO14 line 14233).

X noetherian excellent over ℤ[1/n] with a dimension function.

A proof route is as follows. Constructibility, Tor-dimension and quasi-injective dimension of K and of D_K M from Gabber's finiteness theorem (§4.2) and change of coefficients (ILO XVII 6.2). Weak reflexivity M ≅ τ_(≤0) D D M for constructible sheaves (ILO XVII 6.3.1) and reduction to finite-type schemes over bases of smaller dimension, generalising SGA 4½ [Th. finitude] 4.3 (ILO XVII 6.4.2). Induction on dimension: reduce to M = j_!Λ for a dense open immersion of normal integral schemes and use the partial algebraization theorem (§1.7, geometric form V 3.1.3) to compare with the completion of a finite-type scheme over a regular base of smaller dimension (ILO XVII 6.5).

*Needs:* §6.6; §6.8; §4.2; §1.7; §1.6; EtaleCohomologyFoundations §F.5; EtaleDualityAndPerverseSheaves §§0.1–0.2; EtaleCohomologyFoundations §0.7 and EnhancedDerivedSheaves §§0.3–0.4 for open-immersion tensor–Hom exchange.

**Checks.**

- For X of finite type over a field or over the specified excellent regular base of dimension ≤ 1, the finite-Tor-dimension case is SGA 4½ [Th. finitude] 4.3, p. 250 (SGA4half line 8171). The all-bounded-constructible form uses the self-injective-coefficient extension of EtaleDualityAndPerverseSheaves §§0.1–0.2 and the one-dimensional dualizing-base theorem of EtaleCohomologyFoundations §F.5.

- For X = Spec of a strictly henselian regular local ring of dimension d, K = Λ(d)[2d] (δ(closed point) = 0) and biduality holds for j_!Λ with j the complement of a divisor.

### 6.10 Gabber's duality theorem on excellent schemes

Let X be a noetherian excellent ℤ[1/n]-scheme admitting a dimension function. Then X has a dualizing complex K, unique up to tensoring with an invertible object; K ∈ D^b_ctf(X_ét, Λ), and K has finite quasi-injective dimension iff X has finite Krull dimension. Moreover: if X is regular, Λ is a dualizing complex; if f : Y → X is flat with geometrically regular fibres and Y noetherian excellent, f^*K is dualizing; if f : Y → X is of finite type and compactifiable, f^!K is dualizing. (ILO14, Exposé XVII, Théorème 0.9, p. 257 (printed) (cited as Théorème 0.2 by Česnavičius–Scholze, following the Astérisque numbering); Exposé 0, (c), p. 6; ILO14 line 12220).

Assume X is noetherian excellent over ℤ[1/n] and admits a global dimension function. For finite-dimensional noetherian X, a dualizing complex in the stronger SGA 5 sense, with finite quasi-injective dimension, forces such a function: on any fixed prime-power coefficient factor its local shifts n_ℓ(x) satisfy n_ℓ(y) = n_ℓ(x) + 2 along immediate specializations, so δ(x) = ⌊−n_ℓ(x)/2⌋ is a dimension function (G04, §8, Lemma 8.1, pp. 10–11; G04 lines 441–464). This necessity assertion uses the stronger convention, not only the predicate of §6.8.

A proof route is as follows. Existence: the potential dualizing complex (§6.6) is dualizing (§6.9). Uniqueness up to invertible objects (ILO XVII 7.5.1.1, 9.2). Regular case: §6.4; functoriality: §6.7 with §6.9 on Y.

*Needs:* §6.9; §6.6; §6.4; §6.7; §6.8.

**Checks.**

- For X a strictly henselian regular local scheme, Λ and Λ(d)[2d] are both dualizing and differ by the invertible object Λ(d)[2d].

- For X of finite type over a field, K = a^!Λ up to an invertible object.

- On a strict trait with δ(η) = 1 and δ(s) = 0, take the normalized complex and tensor it by 𝔽₂ ⊕ 𝔽₃[1] for Λ = ℤ/6. Its factorwise shift indices n₂(η), n₂(s) are −2, 0 and n₃(η), n₃(s) are −3, −1. Both increase by 2, and ⌊−n_ℓ/2⌋ gives 1, 0 for either factor; a single common shift index does not exist.

### 6.11 The normalised dualizing complex of a regular local ring

Let R be a strictly henselian excellent regular local ring of dimension d with closed point x, ℓ a prime invertible in R, Λ = ℤ/ℓ, and δ(t) = dim of the closure of t. Then K = Λ(d)[2d], the d-fold tensor power of μ_ℓ shifted by [2d], is the potential dualizing complex of (Spec R, δ), pinned at x by RΓ_x(K) ≅ Λ through absolute purity; for every open immersion j : U → Spec R, j^!K = K|_U is dualizing on U, and Rj_* ∘ D_U ≅ D_X ∘ j_! on constructible complexes. (CS24, Proof of Lemma 3.2.3, p. 33; CS24 line 1367; ILO14, Exposé XVII, Théorème 0.9 and Proposition 2.4.4.1, pp. 257 and 267 (printed); Exposé XVI, Théorème 3.1.1; ILO14 lines 12220, 12835).

R strictly henselian, excellent, regular local; ℓ invertible.

A proof route is as follows. δ = d − codim, so the potential dualizing complex for δ is Λ(d)[2d] by §6.4 and the twist-and-shift rule; the pinning at x is H²ᵈ_x(Λ(d)) ≅ Λ by absolute purity (ILO XVI 3.1.1). It is dualizing by §6.9; restriction to an open is j^* = j^! (EtaleCohomologyFoundations §F.5), and Rj_* D_U = D_X j_! is the formal adjunction (CS24, proof of Lemma 3.2.3, CS24 lines 1367–1371; the open-immersion exchange proved in §6.8 from EtaleCohomologyFoundations §0.7 and EnhancedDerivedSheaves §§0.3–0.4).

*Needs:* §6.4; §6.6; §6.9; §6.3; LefschetzPencilsAndVanishingCycles §0.10; EtaleCohomologyFoundations §F.5; EtaleDualityAndPerverseSheaves §§0.1–0.2; EtaleCohomologyFoundations §0.7 and EnhancedDerivedSheaves §§0.3–0.4 for open-immersion tensor–Hom exchange.

**Checks.**

- For d = 1 (a strictly henselian DVR), K = Λ(1)[2] is the closed-point normalization of the unshifted dualizing Λ in EtaleDualityAndPerverseSheaves §0.2 and EtaleCohomologyFoundations §F.5: tensor by the invertible object Λ(1)[2].

- For d = 0 (a separably closed field), K = Λ.

- For a strictly henselian excellent regular local surface, the normalized complex is Λ(2)[4], with ordinary cohomology in degree −4 and closed support Λ in degree 0. The unshifted Λ has closed support in degree 4 and fails the normalization when d = 2.

### 6.12 Local duality on strictly local excellent schemes

Let X be a strictly local noetherian excellent ℤ[1/n]-scheme with closed point x, and K a dualizing complex on X pinned at x by RΓ_x(K) ≅ Λ (the potential dualizing complex for δ with δ(x) = 0). For every F ∈ D^b_c(X_ét, Λ) and every i there is a natural isomorphism H^i_x(X, F) ≅ Hom_Λ(H⁻ⁱ(D_K F)_x̄, Λ). (CS24, Proof of Lemma 3.2.3, p. 33; CS24 line 1367; ILO14, Exposé XVII, §6 (Le théorème de dualité locale), Théorème 6.1.1, p. 293 (printed); ILO14 line 14233).

X strictly local excellent; Λ = ℤ/n with n invertible; F constructible bounded.

A proof route is as follows. Biduality F ≅ D_K D_K F (§6.9). Apply i_x^!: RΓ_x(X, F) ≅ RΓ_x RHom(D_K F, K) ≅ RHom_Λ((D_K F)_x̄, i_x^!K) ≅ RHom_Λ((D_K F)_x̄, Λ), using i_x^! RHom(G, K) = RHom(i_x^*G, i_x^!K) and the pinning. Λ = ℤ/n is self-injective (EtaleDualityAndPerverseSheaves §§0.1–0.2 and EtaleCohomologyFoundations §F.5), so cohomology commutes with Hom into Λ (ILO XVII §6; CS24 proof of Lemma 3.2.3).

*Needs:* §6.9; §6.8; §6.3; EtaleDualityAndPerverseSheaves §0.1; EtaleCohomologyFoundations §F.5; EtaleDualityAndPerverseSheaves §§0.1–0.2; EtaleCohomologyFoundations §0.7 and EnhancedDerivedSheaves §§0.3–0.4 for open-immersion tensor–Hom exchange.

**Checks.**

- For X = Spec of a separably closed field this is linear duality of finite Λ-modules.

- For X a strictly henselian trait, F = Λ and K = Λ(1)[2]: H²_x(Λ) ≅ Hom(H⁻²(Λ(1)[2])_x̄, Λ) = Λ(−1), as Kummer theory predicts.

### Examples

On a strict regular trait, K=Λ(1)[2] has generic cohomology in degree −2 and closed support in degree 0. On a strict regular surface, K=Λ(2)[4] has closed support Λ in degree 0. With Λ=ℤ/6, the invertible complex 𝔽₂ ⊕ 𝔽₃[1] has inverse 𝔽₂ ⊕ 𝔽₃[−1]; different prime factors need not have a common shift (ILO14, XVII §§2, 6, 9).

### Dependencies

Layers 1, 4–5; LefschetzPencilsAndVanishingCycles §§0.2–0.5, 0.10; AdicCoefficientsAndComparisonsPartII §PA.0.11; EtaleCohomologyFoundations §§0.7, F.5–F.6, with exceptional pullback on the finite-cohomological-dimension domain of §F.2 and the separated finite-type noetherian geometry of §F.2.4; EtaleDualityAndPerverseSheaves §§0.1–0.2 for coefficient and finite-type duality; EnhancedDerivedSheaves §§0.1–0.4; ArcTopologyAndDescent §8.9; DeformationAndDerivedPatchingAlgebra §1.10. The open-immersion tensor–Hom exchange is §6.8, using EtaleCohomologyFoundations §0.7 and EnhancedDerivedSheaves §§0.3–0.4.

## Layer 7: Local Lefschetz and purity applications

Apply the closed-point purity input, affine Lefschetz and normalized local duality to restriction to a hypersurface. The regular local ring in the final statement need not be excellent.

### 7.1 Vanishing for principal punctured opens

Let R be a strictly henselian excellent regular local ring of dimension d, f ∈ 𝔪 and ℓ a prime invertible in R. Then H^i(Spec R[1/f], ℤ/ℓ) = 0 for i > d. (CS24, Proof of Lemma 3.2.3, equation (3.2.3.2), p. 33; Lemma 3.1.2, p. 30; CS24 line 1365).

R strictly henselian excellent regular local, dim R = d, f ∈ 𝔪 and ℓ invertible in R.

A proof route is as follows. Apply §5.7 directly to the affine open Spec R[1/f] of the excellent strictly local scheme Spec R. If f = 0 the open is empty and the conclusion is immediate. In CS24 Lemma 3.2.3 this bound is used after completion, when excellence is automatic; no comparison of this punctured-open cohomology for an arbitrary R with its maximal-ideal completion is asserted.

*Needs:* §5.7; ArcTopologyAndDescent §§8.3, 8.6–8.9; Mathlib `IsRegularLocalRing`.

**Checks.**

- For d = 1 and f a uniformizer, Spec R[1/f] is the generic point and H^i = 0 for i > 1.

- Outside the stated f ∈ 𝔪 domain, a unit f gives Spec R[1/f] = Spec R and H^i = 0 for i > 0. For f = 0, the admitted boundary case, the open is empty and all cohomology is zero.

### 7.2 Local cohomology of extension by zero from a principal open

Let R be a regular local ring of dimension d, f ∈ 𝔪, ℓ a prime invertible in R and j : Spec R[1/f] → Spec R. Then H^i_𝔪(R, j_!ℤ/ℓ) = 0 for i < d. (CS24, Proof of Lemma 3.2.3, equation (3.2.3.1), p. 33; CS24 line 1361).

R regular local; f ∈ 𝔪; ℓ invertible.

A proof route is as follows. Reduce to strictly henselian R and apply the supported clause of CS24 Lemma 3.1.2 to the constructible sheaf j_!ℤ/ℓ and the maximal-ideal completion. This compares H^i_𝔪(R,j_!ℤ/ℓ) with the same supported cohomology on the complete regular local ring; it does not first compare H^i(R[1/f],ℤ/ℓ). If f = 0 then j_!ℤ/ℓ = 0. Otherwise the complete ring is excellent and the remaining duality argument applies. With K = Λ(d)[2d] (§6.11), D(j_!Λ) = Rj_*(K|_U), whose stalk at the closed point is RΓ(R[1/f], Λ(d)[2d]); by §7.1, H⁻ⁱ(D(j_!Λ))_x̄ = 0 for −i + 2d > d, i.e. for i < d. Local duality (§6.12) gives H^i_𝔪(R, j_!Λ) ≅ Hom(H⁻ⁱ(D(j_!Λ))_x̄, Λ) = 0 for i < d.

*Needs:* §7.1; §6.11; §6.12; ArcTopologyAndDescent §§8.3, 8.6–8.9; EtaleCohomologyFoundations §§F.0–F.1, 0.7.

**Checks.**

- For d = 1 and f a uniformizer, H⁰_𝔪(R, j_!ℤ/ℓ) = 0.

- Outside the stated f ∈ 𝔪 domain, a unit f gives j_!ℤ/ℓ = ℤ/ℓ and low-degree vanishing follows from purity. Within the domain, f = 0 gives the zero sheaf and every support group is zero.

### 7.3 Lefschetz hyperplane theorem in local étale cohomology

Let (R, 𝔪) be a regular local ring, f ∈ 𝔪 and ℓ a prime invertible in R. The restriction map H^i_𝔪(R, ℤ/ℓ) → H^i_𝔪(R/(f), ℤ/ℓ) is bijective for i < dim R − 1 and injective for i = dim R − 1. (CS24, Lemma 3.2.3 and its proof, p. 33; CS24 line 1356).

R regular local of dimension d; f ∈ 𝔪 (R/(f) need not be regular); ℓ invertible.

A proof route is as follows. The exact sequence 0 → j_!ℤ/ℓ → ℤ/ℓ → i_*ℤ/ℓ → 0 for i : Spec R/(f) → Spec R gives a long exact sequence of local cohomology with H^i_𝔪(R, i_*ℤ/ℓ) = H^i_𝔪(R/(f), ℤ/ℓ). By §7.2, H^i_𝔪(R, j_!ℤ/ℓ) = 0 for i < d, which gives the bijectivity for i < d − 1 and injectivity for i = d − 1.

*Needs:* §7.2; LefschetzPencilsAndVanishingCycles §0.10; EtaleCohomologyFoundations §§F.0–F.1, 0.7.

**Checks.**

- For d = 1 (a DVR) and f a uniformizer, the statement is injectivity of H⁰_𝔪(R, ℤ/ℓ) = 0 → H⁰(R/(f), ℤ/ℓ) = ℤ/ℓ in degree 0 = d − 1.

- With LefschetzPencilsAndVanishingCycles §0.10, for R = R̃/(f) a hypersurface quotient of a regular R̃ of dimension d, H^i_𝔪(R, ℤ/ℓ) = 0 for i < d − 1 (the hypersurface case of CS24 3.2.4, consumed by PurityForFlatCohomology PF.1).

- For f = 0, R/(f) = R and restriction is the identity in every degree. For d = 0, the only f in the maximal ideal is 0; d − 1 = −1 is an integer degree and both negative-degree groups vanish.

### Examples

For a DVR, purity gives H⁰_𝔪=H¹_𝔪=0 and H²_𝔪(R,μ_n)=ℤ/n. If its residue field k has nonzero H¹(k,ℤ/n), purity instead gives H³_𝔪(R,μ_n)=H¹(k,ℤ/n), so higher ordinary support groups need not vanish. For k separably closed, k⟦x,y⟧ has H^i_𝔪(Λ)=0 below 4 and H⁴_𝔪(Λ)=Λ(−2). Sheafified local cohomology is concentrated in degree 2d and its class is Λ(−d); for d=1 it is the Kummer class. The alternative perfectoid proof uses tilting of support complexes in §8.6 to reduce these same purity assertions to equal characteristic. For R=R̃/(f) with R̃ regular of dimension d, local Lefschetz and purity give vanishing below d−1, including the hypersurface application (CS24 3.1.3–3.1.4, 3.2.3–3.2.4; CS24 lines 1219, 1257, 1356; LefschetzPencilsAndVanishingCycles §0.10).

### Dependencies

Layers 5–6; LefschetzPencilsAndVanishingCycles §0.10; EtaleCohomologyFoundations §0.7; ArcTopologyAndDescent §8.9. The alternative purity proof in Examples also uses Layer 8.

## Layer 8: Tilting étale cohomology of henselian perfectoid pairs

Match opens by their closed complements in the common special fibre, prove the idempotent comparison, and descend the valuation-product calculation to arbitrary henselian perfectoid pairs.

### 8.1 Matched punctured opens of a henselian perfectoid pair and its tilt

Let p be a prime, A a ring and ϖ ∈ A with ϖ^p | p such that A is ϖ-henselian with bounded ϖ^∞-torsion and its ϖ-adic completion Â is (integral) perfectoid. Put A^♭ = lim_(a ↦ a^p) A/ϖA (the tilt of Â) and choose ϖ^♭ ∈ A^♭ with (ϖ^♭)^♯ a unit multiple of ϖ. The isomorphism A^♭/ϖ^♭ ≅ Â/ϖ = A/ϖ (the unpowered consequence of CS24 (2.1.2.2)–(2.1.2.3)) identifies Spec(A/ϖ) with Spec(A^♭/ϖ^♭). A matched pair of punctured opens is a pair (U, U^♭) of opens Spec A[1/ϖ] ⊆ U ⊆ Spec A and Spec A^♭[1/ϖ^♭] ⊆ U^♭ ⊆ Spec A^♭ whose closed complements, subsets of V(ϖ) and V(ϖ^♭), correspond under this identification. U ↦ U^♭ is an order isomorphism between the two sets of such opens. (CS24, Theorem 2.2.7 (hypotheses), p. 21; §2.1.2, equations (2.1.2.2)–(2.1.2.3), pp. 10–11; CS24 line 827).

ϖ^p | p; A ϖ-henselian with bounded ϖ^∞-torsion; Â perfectoid; ϖ^♭ chosen with (ϖ^♭)^♯ a unit multiple of ϖ.

Its interface consists of the following facts.

- The bijection U ↦ U^♭ between opens of Spec A containing Spec A[1/ϖ] and opens of Spec A^♭ containing Spec A^♭[1/ϖ^♭].

- U ⊆ V iff U^♭ ⊆ V^♭; unions and finite intersections are preserved.

- (Spec A)^♭ = Spec A^♭.

- (Spec A[1/ϖ])^♭ = Spec A^♭[1/ϖ^♭].

- For b ∈ A whose image in A/ϖ is the image of b′ ∈ A^♭, (D(b) ∪ D(ϖ))^♭ = D(b′) ∪ D(ϖ^♭).

- Pullback along Spec Â → Spec A identifies the posets of opens containing D(ϖ), because their complements are closed subsets of the common quotient spectrum Spec A/ϖ. Corresponding opens need not be isomorphic schemes.

- Two matched pairs with the same A-open U have the same tilt-open U^♭; equivalently, equality of their closed complements in the common quotient spectrum determines the pair.

A proof route is as follows. The supplier Q5 gives A^♭/(ϖ^♭)^p ≅ Â/ϖ^p. Frobenius gives isomorphisms from Â/ϖ to Â/ϖ^p and from A^♭/ϖ^♭ to A^♭/(ϖ^♭)^p; composing the latter with the sharp-quotient map and the inverse of the former gives the unpowered quotient isomorphism (CS24 2.1.2.2–2.1.2.3). Bounded torsion gives Â/ϖ ≅ A/ϖ. The quotient spectra identify the closed subsets of V(ϖ) and V(ϖ^♭), and taking complements gives the order isomorphism.

*Needs:* PerfectoidQuotientsPartII §§Q5.1–Q5.3; PerfectoidQuotients §§0.4–0.6; Mathlib `PreTilt`; Mathlib `HenselianRing`.

**Checks.**

- For C an algebraically closed perfectoid field, A = 𝒪_C × 𝒪_C and ϖ = (ϖ₀, ϖ₀) with ϖ₀ a nonzero topologically nilpotent element of 𝒪_C and ϖ₀^p | p, Spec A has two closed points s₁, s₂ and V(ϖ) = {s₁, s₂}, so exactly four opens contain Spec A[1/ϖ], one for each subset of V(ϖ) as complement. The open U = Spec 𝒪_C ⊔ Spec C has complement {s₂} and is matched with Spec 𝒪_(C^♭) ⊔ Spec C^♭. The swapped open Spec C^♭ ⊔ Spec 𝒪_(C^♭) has complement the other closed point and is not the match; a matching that saw only the number of points in the complement, or exchanged the factors, would pair U with it. The two factors are henselian and torsion-free, and A is its own perfectoid ϖ-adic completion.

- In characteristic p the hypotheses also admit ϖ₀ = 0, since 0^p divides p = 0. For C algebraically closed perfectoid of characteristic p, A = 𝒪_C × 𝒪_C and ϖ = 0, the generic open Spec A[1/ϖ] is empty and V(ϖ) is all of Spec A. Each factor Spec 𝒪_C has the three opens ∅, {η}, {η, s}, so 3² = 9 opens contain Spec A[1/ϖ]. Here A is perfect, hence perfectoid (CS24 §2.1.2; CS24 line 404), A is ϖ-henselian with bounded ϖ^∞-torsion for ϖ = 0, A^♭ = A with ϖ^♭ = 0, and the matching is the identity on all nine. A count that assumed ϖ nonzero, giving four, would miss five of them.

- For k = 𝔽̄_p and the p-adically completed ring A = W(k)⟦`x^(1/p^infty)`⟧/(p − x), with ϖ = `x^(1/p)`, A and its tilt are rank-one valuation rings and Spec A/ϖ is a point. Exactly two matched pairs exist, the whole spectra and their generic opens; the tilt is the t-adically completed perfection of k⟦t⟧.

- An open of Spec A not containing Spec A[1/ϖ] (for instance one missing a generic-fibre point) has no matched open.

### 8.2 Multiplicative tilting of the generic fibre

Let A be perfectoid and ϖ-adically complete for ϖ ∈ A with ϖ^p | p, and ϖ^♭ ∈ A^♭ with (ϖ^♭)^♯ a unit multiple of ϖ. There is a multiplicative bijection lim_(a↦a^p)(A[1/ϖ]) ≅ A^♭[1/ϖ^♭], compatible with the supplied multiplicative identification lim_(a↦a^p) A ≅ A^♭. (CS24, §2.1.7, equations (2.1.7.1)–(2.1.7.2), p. 13; CS24 line 516).

A perfectoid, ϖ-adically complete; ϖ^p | p.

A proof route is as follows. The image Ā of A in A[1/ϖ] is p-integrally closed (PerfectoidQuotients §§0.4–0.5, with the ϖ-torsion decomposition of CS24 (2.1.3.1)). A p-power compatible sequence in A[1/ϖ] therefore has ϖ^N times its terms in Ā for one N; combine with lim_(a↦a^p) A ≅ A^♭ (PerfectoidQuotientsPartII §§Q5.1–Q5.3) after inverting ϖ^♭ (CS24 (2.1.7.2)).

*Needs:* PerfectoidQuotients §§0.4–0.6; PerfectoidQuotientsPartII §§Q5.1–Q5.3; Mathlib `PreTilt`.

**Checks.**

- For a mixed-characteristic perfectoid field C and A = 𝒪_C, choose ϖ with ϖ^p | p. The assertion identifies C^♭ with lim_(x↦x^p) C as multiplicative monoids; it makes no identification of C itself with C^♭.

- For complete perfect A of characteristic p, evaluation at the first p-power coordinate gives the identity identification A^♭ = A and its localized counterpart.

- In characteristic p with A = 𝔽_p and ϖ = ϖ^♭ = 0, both localized rings are the zero ring, with one multiplicative element. The inverse limit is a singleton too; replacing localization at zero by A would give p elements instead of one.

### 8.3 Tilting of idempotents on punctured opens

In the setting of §8.1, for every matched pair (U, U^♭) there is a bijection Idem(U) ≅ Idem(U^♭) between the idempotents of Γ(U, O) and of Γ(U^♭, O), compatible with orthogonality and functorial in A and U. (CS24, Theorem 2.2.7 and its proof (first part), pp. 21–22; CS24 line 836).

As in §8.1.

A proof route is as follows. Replace A by its ϖ-adic completion; idempotents of U do not change (the idempotent and completion comparison of ArcTopologyAndDescent §8.9). For U = Spec A and U = Spec A[1/ϖ], idempotents are fixed by p-th powers, so the multiplicative bijections of §8.2 restrict to bijections of idempotents. General U: an idempotent on U is an idempotent on A[1/ϖ] with compatible idempotents on the localisations along principal opens of U ∩ V(ϖ); by Beauville–Laszlo glueing these localisations may be completed; their completions are perfectoid with the matching tilts (PerfectoidQuotients §§0.5–0.6; CS24 Corollary 2.1.6 and equation (2.1.2.2)), reducing to the two settled cases.

*Needs:* §8.1; §8.2; ArcTopologyAndDescent §§8.3, 8.6–8.9; PerfectoidQuotients §§0.4–0.6.

**Checks.**

- For A connected and U = Spec A, Idem = {0, 1} on both sides.

- For A = A_1 × A_2, the idempotents (1, 0), (0, 1) correspond to those of A_1^♭ × A_2^♭.

- For A = 𝒪_C × 𝒪_C, U = Spec A and ϖ = (ϖ₀,ϖ₀) nonzero, there are exactly four idempotents on each side: 0, 1, (1,0) and (0,1). The two primitive idempotents multiply to 0, while each has square itself. Sending both to the first primitive idempotent would preserve idempotency but fail orthogonality.

### 8.4 Étale cohomology of products of valuation rings and their tilts

Let A = ∏_(i∈I) V_i with each V_i a ϖ-adically complete valuation ring of rank ≤ 1 with algebraically closed fraction field, over a perfectoid base as in §8.1. Use the supplied perfectoid structure and product tilt A^♭ = ∏ V_i^♭. Prove the cohomological comparison: for quasi-compact opens U ⊆ Spec A and U^♭ ⊆ Spec A^♭, RΓ_ét(U, G) and RΓ_ét(U^♭, G) are concentrated in degree 0, given by locally constant G-valued functions; for matched (U, U^♭) they are identified functorially through §8.3. (CS24, Lemma 2.2.4, pp. 19–20, and proof of Theorem 2.2.7 (product case), pp. 21–22; CS24 lines 774, 864–871).

V_i complete of rank ≤ 1 with algebraically closed fraction fields; G a torsion abelian group.

A proof route is as follows. Use the supplied perfectoidness and product tilt (PerfectoidQuotients §0.6; PerfectoidQuotientsPartII §§Q6.3–Q6.7), with ϖ^♭-adic completeness of the product tilt from the completeness transfer of PerfectoidQuotientsPartII §Q6.2. Apply the split-cover theorem of ArcTopologyAndDescent §11.2 to the quasi-compact opens of both valuation products. The splitting makes the global-sections functor exact, so higher cohomology vanishes; sections of the constant sheaf G are locally constant G-valued functions. The ultraproduct components are those of ArcTopologyAndDescent §3.6. For matched opens, §8.3 identifies their Boolean algebras of clopens compatibly with disjointness, and hence their locally constant functions, giving the new functorial comparison.

*Needs:* §8.3; ArcTopologyAndDescent §3.6; ArcTopologyAndDescent §§11.1–11.2, 11.5; PerfectoidQuotients §§0.4–0.6; PerfectoidQuotientsPartII §§Q6.2–Q6.7.

**Checks.**

- For I a singleton, V of rank one and 0 ≠ ϖ in its maximal ideal, U = Spec V[1/ϖ] is the spectrum of an algebraically closed field: RΓ = G in degree 0 on both sides. For V an algebraically closed characteristic-p field and ϖ = 0, the generic open is empty and its cohomology is 0; the whole spectrum has H⁰ = G.

- For two such rank-one factors, take the generic open of their product. It is the disjoint union of two algebraically closed fields, so H⁰ = G² and H^q = 0 for q > 0 on both sides. The two primitive idempotents and their sum correspond through §8.3, excluding a comparison that collapses the two components.

- For I infinite, an idempotent e_J with coordinates 1 on J and 0 elsewhere defines D(e_J); an ultrafilter component lies in it exactly when J belongs to that ultrafilter. The tilt preserves the same subsets J and this same membership condition.

### 8.5 Algebraic tilting of étale cohomology

In the setting of §8.1, for every matched pair (U, U^♭) and every torsion abelian group G there is an isomorphism RΓ_ét(U, G) ≅ RΓ_ét(U^♭, G), functorial in A, U and G. (CS24, Theorem 2.2.7 and its proof, pp. 21–22; Theorem 2.2.5, p. 20; CS24 line 827).

As in §8.1; G torsion.

A proof route is as follows. Replace A by its completion (ArcTopologyAndDescent §§8.6–8.9). By formal glueing for étale cohomology (ArcTopologyAndDescent §§8.6–8.9) and ϖ-complete arc descent (CS24 Theorem 2.2.5; ArcTopologyAndDescent §11.5), reduce to U = Spec A and U = Spec A[1/ϖ]. Products of complete valuation rings with algebraically closed fraction fields form a basis of the ϖ-complete arc topology (ArcTopologyAndDescent §11.2), matched with the analogous basis of A^♭ by tilting (PerfectoidQuotientsPartII §Q6.2 for completeness and §§Q6.3–Q6.7 for the valuation rings, ArcTopologyAndDescent §12.6); conclude from §8.4 by descent.

*Needs:* §8.4; §8.3; §8.1; ArcTopologyAndDescent §§8.3, 8.6–8.9; ArcTopologyAndDescent §§11.1–11.2, 11.5; ArcTopologyAndDescent §12.6; PerfectoidQuotientsPartII §§Q6.2–Q6.7.

**Checks.**

- For A perfect of characteristic p and ϖ-adically complete, A^♭ = A and the isomorphism is the identity. A characteristic-p henselian subring need not equal its perfectoid completion, so characteristic p alone does not identify the two rings.

- For R̂_∞ = W(k)⟦`x_1^(1/p^infty)`, …, `x_d^(1/p^infty)`⟧/(p − f) and U the complement of V(x_1, …, x_d), the cohomology of U equals that of the corresponding punctured spectrum of the f-adic completion of k⟦`(x_1^flat)^(1/p^infty)`, …⟧ (the step used in CS24 3.1.3).

- For A = 𝔽_p and ϖ = 0, the whole spectra are matched and both sides have H⁰(−,ℤ/ℓ) = ℤ/ℓ, H¹(−,ℤ/ℓ) = ℤ/ℓ and H^q = 0 for q > 1. This includes ℓ = p and rejects inferring acyclicity from perfectness alone.

### 8.6 Tilting of cohomology with supports

In the setting of §8.1, for every closed Z ⊆ Spec(A/ϖA) and every torsion abelian group G, RΓ_Z(A, G) ≅ RΓ_(Z^♭)(A^♭, G), where Z^♭ ⊆ Spec(A^♭/ϖ^♭) corresponds to Z. (CS24, Theorem 2.2.7, equation (2.2.7.1), p. 21; CS24 line 834).

As in §8.1.

A proof route is as follows. Apply §8.5 to the matched pairs (Spec A, Spec A^♭) and (Spec A − Z, Spec A^♭ − Z^♭) and take cones in the cohomology-with-supports triangle (EtaleCohomologyFoundations §§F.0–F.1, 0.7).

*Needs:* §8.5; EtaleCohomologyFoundations §§F.0–F.1, 0.7.

**Checks.**

- For Z = ∅ both sides vanish. For A an algebraically closed characteristic-p field and ϖ = 0, take Z = Spec A; both support complexes are G in degree 0. A perfect field alone does not imply this concentration: H¹(Spec 𝔽_p, ℤ/ℓ) = ℤ/ℓ. For A = 𝒪_C with C algebraically closed perfectoid, ϖ nonzero and topologically nilpotent, and Z = V(ϖ), restriction on H⁰ is G → G, the identity, with no higher cohomology on either affine term; both support complexes are zero. A noetherian DVR purity calculation cannot be transferred to this nondiscrete valuation ring.

- For A = R̂_∞ as in CS24 3.1.3 and Z the closed point, it identifies H^i_((p, x_1, …, x_d))(R̂_∞, ℤ/ℓ) with local cohomology of the tilt.

- For A = 𝔽_p, ϖ = 0 and Z the whole special fibre, support cohomology equals ordinary cohomology: with G = ℤ/ℓ its degree-zero and degree-one groups both equal ℤ/ℓ on each side, including ℓ = p. Replacing the support complex by degree-zero sections would lose H¹.

### Examples

For a ϖ-adically complete perfect characteristic-p algebra the tilting comparisons reduce to identity maps, with compatible p-power coordinates. For the completed ring W(k)⟦x^(1/p^∞)⟧/(p−x), k algebraically closed, the tilt is the x^♭-adically completed perfection of k⟦x^♭⟧; the common special fibre has one point and there are two matched opens. For the d-parameter regular-local tower of CS24 3.1.3, the comparison identifies support cohomology in (p,x₁,…,x_d) with support cohomology at the corresponding closed point of the f-adically completed tilt (CS24 §§2.2, 3.1; CS24 lines 827, 1237).

### Dependencies

PerfectoidQuotients §§0.4–0.6; PerfectoidQuotientsPartII §§Q5.1–Q5.3, Q6.2–Q6.7; ArcTopologyAndDescent §§3.6, 8.6–8.9, 11.1–11.2, 11.5, 12.6; EtaleCohomologyFoundations §0.7; EnhancedDerivedSheaves §§0.1–0.4, E2.

## Downstream consumers

PurityForFlatCohomology §PF.1 consumes local Lefschetz (§7.3); the purity input it combines with this is LefschetzPencilsAndVanishingCycles §0.10. For a hypersurface quotient of a d-dimensional regular local ring, these inputs give vanishing below d−1. General applications requiring Rf_* to preserve bounded constructibility over completions, henselizations and other quasi-excellent bases use §4.2. Applications requiring duality on an excellent scheme with a global dimension function use §§6.6–6.12. None of these consumers supplies a prerequisite to this roadmap.

## References

- **ILO14.** L. Illusie, Y. Laszlo and F. Orgogozo (eds.), *Travaux de Gabber sur l’uniformisation locale et la cohomologie étale des schémas quasi-excellents*, Astérisque 363–364 (2014), [arXiv:1207.3648v1](https://arxiv.org/abs/1207.3648v1). Unless a published chapter is specified, locators use the printed pages and numbering of this version. Theorem XVII 0.9 is numbered XVII 0.2 in the published volume. The cited statements and proof steps are paraphrased.

- **CS24.** K. Česnavičius and P. Scholze, *Purity for flat cohomology*, Annals of Mathematics 199 (2024), 51–180; [arXiv:1912.10932v3](https://arxiv.org/abs/1912.10932v3), §§2.1–2.2, 3.1–3.2. Locators use v3 numbering and pages.

- **DJ97.** A. J. de Jong, *Families of curves and alterations*, Annales de l’Institut Fourier 47 (1997), 599–621, [§2, Theorem 2.4](https://www.numdam.org/item/AIF_1997__47_2_599_0/).

- **G04.** O. Gabber, *Notes on some t-structures*, Geometric aspects of Dwork theory II (2004), 711–734; [author text](https://www.ihes.fr/~gabber/t-str.pdf), §§1–6 and 8, using the author-text pages.

- **SGA4half.** P. Deligne, *Cohomologie étale*, Lecture Notes in Mathematics 569 (1977), [Th. finitude] 1.9, p. 236 and §2, pp. 238–241; [institutional published scan](https://publications.ias.edu/sites/default/files/Number32.pdf).

- **K10.** F.-V. Kuhlmann, *A correction to Epp’s paper “Elimination of wild ramification”*, [arXiv:1003.5687v1](https://arxiv.org/abs/1003.5687v1), pp. 1–3.

- **Epp73.** H. P. Epp, *Eliminating wild ramification*, Inventiones Mathematicae 19 (1973), 235–249, [Theorem 1.9](https://doi.org/10.1007/BF01390208). The statement used here is read in ILO IV 3.1.2, with the correction in K10; the original text is cited by locator.

- **Ill03.** L. Illusie, *Perversité et variation*, Manuscripta Mathematica 112 (2003), 271–295, [Theorem 2.4](https://doi.org/10.1007/s00229-003-0407-z). ILO XV 1.1.3 and 3.3.2 specify the trait theorem used here; the original text is cited by locator.

- **ILO-final-II.** F. Orgogozo, *Topologies adaptées à l’uniformisation locale*, published Exposé II, pp. 21–36, [Theorem 4.2.1, pp. 33–34](https://www.numdam.org/item/AST_2014__363-364__21_0/). The valuation criterion uses algebraically closed fraction fields.

- **ILO-final-IX.** L. Illusie, *Uniformisation locale première à ℓ*, published Exposé IX, pp. 161–165, [Theorems 1.1–1.2, p. 161](https://www.numdam.org/item/AST_2014__363-364__161_0/). The generic curve is geometrically irreducible; the prime-to-ℓ statement in Exposé II is 4.3.2.

- **ILO-final-XII.** F. Orgogozo, *Descente cohomologique orientée*, published Exposé XII-A, pp. 235–249, [§§1.3–1.4, pp. 238–241](https://www.numdam.org/item/AST_2014__363-364__235_0/). Proper base change uses the proper base morphism; the non-abelian continuity qualification is explicit.

- **ILO-final-XIV.** V. Pilloni and B. Stroh, *Fonctions de dimension*, published Exposé XIV, pp. 277–292, [Corollary 2.5.2, p. 289](https://www.numdam.org/item/AST_2014__363-364__277_0/). The transport formula in §5.4 uses trdeg(κ(y)/κ(f(y))), as required by the dimension formula and the affine-line witness; see ILO-final-XIV line 477.
