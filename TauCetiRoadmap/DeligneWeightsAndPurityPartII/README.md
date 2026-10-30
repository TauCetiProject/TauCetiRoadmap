# Roadmap: deligne weights and purity, part II — weight–monodromy by tilting

**Summary.** Extend DeligneWeightsAndPurity from weights over finite fields and local monodromy on finite-field curves to Scholze's weight–monodromy theorem for geometrically connected proper smooth set-theoretic complete intersections in projective smooth toric varieties over p-adic fields. The build isolates detection on highly ramified subgroups, compatibility of tame monodromy with tilting, and cohomological neighbourhoods, including Ito's uniform constant-coefficient theorem in either characteristic. It constructs a multiplicative Galois-equivariant comparison with a smooth projective variety over a global function field, proves that comparison is an isomorphism in top degree, and splits it by Poincaré duality. Deligne's equal-characteristic theorem then supplies the required weights in every degree and at every prime ℓ different from the residue characteristic (SCH12, Theorem 9.6, pp. 309–311; SCH12 line 2589).

## Scope and ownership

DeligneWeightsAndPurity stops at finite-field weights and the local theorem for pure sheaves on a finite-field curve (§5.11). This continuation owns local monodromy data on profinite groups, their restriction and transport, purity relative to those data, and the geometric argument through tubular neighbourhoods and a tilted approximation. Its coordinate tower target extends the ℚ_p example of PerfectoidSpaces §P1.32a to every finite k/ℚ_p with a chosen uniformizer. Its general constant-coefficient neighbourhood theorem applies to separated finite-type models over complete rank-one valuation rings in either characteristic, with one radius for all invertible coefficient orders; its final mixed-characteristic theorem has the full toric set-theoretic complete-intersection scope.

The canonical scalar Weil-number predicate, linear monodromy filtration and Weil–Deligne pair purity are owned by ArithmeticGaloisRepresentations §§2.4–2.6. DeligneWeightsAndPurity §§0.1–0.19, 5.11 and 7.15 supply the weight comparisons and finite-field purity. LefschetzPencilsAndVanishingCycles §§1.1–1.5 owns the corresponding sheaf-theoretic monodromy. These objects are imported rather than given competing definitions. Our relative purity differs by admitting a marked profinite group whose inertia and tame character need not come from a discretely valued field.

Mathlib's exact-functor preservation of Yoneda composition owns the algebra behind Scholze's Lemma 9.8; §3.5 identifies its application to the supplied site pullbacks and cohomology products. Mathlib's perfect pairings and annihilators own the elementary linear algebra; §4.4 owns the equivariant splitting forced by a multiplicative top-degree isomorphism.

LocalFieldsRamification Layers 0–4 and Tau Ceti's local-field modules own inertia, wild inertia, tame characters, Teichmüller representatives and Frobenius. EtaleCohomologyFoundations §§F.2–F.4.6 owns scheme base change, geometric finiteness and adic realization. SchemeAndStackFoundations §§0.7–0.9, 4.13, 4.16, 4.19, 5.2–5.3 owns components, spreading out, regularity versus smoothness, alterations and Chow theory. AbelianSchemesAndArithmeticModuli §A2.7 owns positivity of ample intersection numbers, specialized here to the top self-intersection on the integral image. EtaleDualityAndPerverseSheaves §§0.5–0.6, 1.3 and 3.4–3.7 owns the rational duality and cycle comparisons used here.

PerfectoidSpaces §§P1.6, P1.10–P1.15 and P3.7–P3.8 owns perfectoid fields, sharp naturality, the residue-field isomorphism, the degree-preserving finite-extension equivalence and the componentwise Fontaine–Wintenberger action. FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3 owns the Kummer field of norms and its abstract Galois equivalence; §2.2 here names the composite of the supplied equivalences, and §§2.3–2.4 add the prime-to-p Tate-coordinate and marked inertia, geometric Frobenius and tame-character comparisons. AdicEtaleGeometry §A1.0.5 owns henselian completion. AdicSpacesPartIII §§R2.3–R2.4 and R2.8 owns generic fibres, equation-dependent closed tubes and proper-model comparison; §3.1 here glues the finite-ideal version for a specified closed subscheme and proves its cofinality as the radius tends to zero. AnalyticToricGeometryPartII Layers 0–6 own the toric spaces, projection, cohomology isomorphism and approximation of complete intersections. No toric construction is duplicated. ClassicalAdicEtaleCohomology §§1.1–1.5, 3.2, 5.4, 8.2, 10.1–10.5 and 11.1 owns analytic sites, continuity, overconvergence, general-base nearby cycles with the plurinodal alteration, disc cohomology, smooth-family constructibility and algebraic comparison. Huber's characteristic-zero locally constant-sheaf neighbourhood theorem, Ito's constant-coefficient theorem with a radius uniform in all invertible orders in either characteristic, and the characteristic-zero punctured-disc Riemann-existence input belong to Layer 3 of this continuation. So do the inputs of the uniform route that no earlier roadmap states: the coefficient-uniform nearby-cycle alteration, adapted coefficients over an analytic curve, the annular decomposition of finite étale covers of a punctured disc (dominated by a Galois cover of degree invertible in K, or coming from a finite morphism of algebraic curves in either characteristic) and the tame annular trivialization. Layer 3 also owns the adapted-open refinement of the supplied plurinodal alteration, the compact-support stalk comparison with sliced nearby cycles, and the smooth nonproper annular duality. These extend the specified general-base and curve interfaces of ClassicalAdicEtaleCohomology §§5.4, 9.6–9.7. Section 4.2 proves continuous-field-automorphism naturality of the supplied proper algebraic–adic comparison.

The general mixed-characteristic weight–monodromy conjecture, integral weight–monodromy, independence of ℓ, and the p-adic coefficient analogue are outside this roadmap. The results here include bad reduction and residue characteristics 2 and 3. WeightsInEtaleCohomology consumes weight results in its own arithmetic applications; it supplies no input to this continuation.

## Conventions

All schemes, sites, closures and vector spaces are taken in fixed compatible universes, with universe lifts on cohomology when required by the supplier. Varieties are separated finite-type schemes over a field; smooth geometrically connected varieties are nonempty and of pure dimension. The general conjecture also permits the empty proper smooth scheme, whose cohomology is zero.

A nonarchimedean local field k has finite residue field `𝔽_q` of characteristic p, with q = `p^a` ≥ 2. Both mixed and equal characteristic are allowed in Layer 0. The prime ℓ differs from p. Representations are finite-dimensional over a finite extension E of `ℚ_ℓ`, with the finite-dimensional module topology; `ℚ̄_ℓ` representations mean scalar extensions of such representations, as in ArithmeticGaloisRepresentations §1.5. Weil weights include algebraicity over ℚ and the absolute-value condition at every complex embedding. They do not include integrality.

Write `G_k` for `Field.absoluteGaloisGroup k`. Geometric Frobenius Φ is the inverse of the arithmetic lift of LocalFieldsRamification. It acts on `ℚ_ℓ(1)` by q⁻¹. The positive Kummer ratio defines the tame character `t_ℓ`, after one fixed identification `ℤ_ℓ(1)` ≅ `ℤ_ℓ`; the untwisted monodromy operator satisfies `rho(Phi) N rho(Phi)^(-1) = q^(-1) N`, equivalently `N rho(Phi) = q rho(Phi) N`. The monodromy filtration is centered at zero: N lowers its index by two, and `N^j` identifies `gr_j` with `gr_−j` for j ≥ 0. Tate twist r subtracts 2r from the weight (SCH12, Proposition 9.1 and Definition/Proposition 9.2, pp. 307–308; SCH12 line 2518).

**Checks.**

- With basis e₀,e₁, take N e₁ = e₀, N e₀ = 0 and Φ = diag(1,q). Then NΦ e₁ = q e₀ = qΦN e₁, and ΦNΦ⁻¹ e₁ = q⁻¹e₀. The reverse geometric sign fails for q = 2 as well as q = 3.
- This string has `gr_−1` = Ee₀ with eigenvalue 1 and `gr_1` = Ee₁ with eigenvalue q: their weights are 0 and 2, giving central weight 1. Its Tate twist has eigenvalues q⁻¹ and 1 and central weight −1.
- For N = 0 the only nonzero grade is zero. The zero vector space is pure of every weight. The value q = 1 is excluded: eigenvalue 1 would otherwise have every integer weight.

Cohomology has constant coefficients unless a sheaf is explicitly specified. Integral cohomology is the cohomology of the supplied derived adic realization; on proper geometric varieties finite-level finiteness and the Mittag–Leffler comparison identify it with the inverse limit of finite-coefficient groups. Rationalization and finite E-extension follow that comparison. A tube radius ε always belongs to |Kˣ|, hence is strictly positive; inequalities at adic points mean comparison with a scalar of that norm, including valuations of higher rank. Empty products of projective spaces and empty intersections of hypersurfaces are permitted. A split toric variety is specified by a finite rational fan in a finite-rank lattice; the fan is complete, regular and projective when that is required below.

## Exact supplier contracts

### From Mathlib

At the pinned Mathlib, `Field.absoluteGaloisGroup` and `Field.absoluteGaloisGroup.mapOfAlgebra` in `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean` provide the Krull-topological group and the continuous restriction map for compatible algebraic closures and scalar towers. A restriction map alone supplies no injectivity or equivalence. `Representation` in `Mathlib/RepresentationTheory/Basic.lean` is a monoid homomorphism to module endomorphisms; continuity is a separate hypothesis. `Padic` and `PadicInt` in `Mathlib/NumberTheory/Padics/PadicNumbers.lean` and `Mathlib/NumberTheory/Padics/PadicIntegers.lean` supply the ℓ-adic coefficients with ℓ prime.

`IsNilpotent.exp` in `Mathlib/RingTheory/Nilpotent/Exp.lean` supplies the finite exponential in a ℚ-algebra, used only on nilpotent inputs. `LinearMap.IsPerfPair` in `Mathlib/LinearAlgebra/PerfectPairing/Basic.lean` requires bijectivity of both adjoints; it supplies no Galois equivariance. `LinearMap.ker`, `LinearMap.range`, `LinearMap.flip`, `Submodule` and `IsCompl` give the carriers of §4.4. `Module.End.HasEigenvalue` supplies the eigenspace predicate after scalar extension.

Use `CategoryTheory.Abelian.Ext.comp` in `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean`, and `CategoryTheory.Abelian.Ext.mapExactFunctor` with `CategoryTheory.Abelian.Ext.mapExactFunctor_comp` in `Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean`. The latter preserves Yoneda composition for an exact functor between abelian categories with the relevant Ext universes. `CategoryTheory.Sheaf.H` in `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean` uses abelian-group sheaves and Ext from the constant ℤ sheaf; it does not by itself identify ring-module cohomology with Ext in module sheaves.

### From Tau Ceti

Use `TauCeti.inertiaSubgroup`, `TauCeti.isClosed_inertiaSubgroup`, `TauCeti.inertiaTameCharacter` and `TauCeti.IsArithFrobeniusLift` from `TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean` and `TauCeti/NumberTheory/LocalField/Tame/Character.lean`. Inertia is closed and normal, its quotient is the residue Galois group, and the tame character uses the positive Kummer ratio. `TauCeti.IsArithFrobeniusLift.smul_eq_pow` in `TauCeti/NumberTheory/LocalField/Tame/Quotient.lean` gives the arithmetic q-power action on tame inertia. Invert the arithmetic lift to obtain the geometric q⁻¹ relation. `TauCeti.teichmullerLift` in `TauCeti/NumberTheory/LocalField/Teichmuller.lean` is the zero-preserving multiplicative section used in the finite uniformizer expansions of §2.1.

### From TauCetiRoadmap.LocalFieldsRamification

Layers 0–4 supply finite extensions with ramification index and residue degree, Eisenstein extensions (Layer 3, totally ramified is equivalent to Eisenstein, with the uniformizer given by the Eisenstein root), Teichmüller representatives, unramified Frobenius, inertia and wild inertia, the tame quotient and its intrinsic Frobenius action. Use compatible algebraic closures and the same Tate-coordinate identification in finite extensions. No assertion that the p-power Kummer tower is Galois is consumed.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Sections 1.5, 2.1a, 2.4 and 2.6 supply finite coefficient fields of definition, the local-field/trait tame-character comparison, the continuous-representation monodromy specialization, Frobenius semisimplification, the centered linear monodromy filtration, and `WeilDeligneRep.IsWeilNumber` and `WeilDeligneRep.IsPureEnd`. The §2.4 arithmetic Frobenius relation uses q; after inversion the geometric relation used here uses q⁻¹. Its canonical operator exists for every continuous local-field representation at ℓ ≠ p, a hypothesis needed for the converse detection theorem of §0.5.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

Sections 1.1–1.5 supply quasi-unipotent nearby-cycle monodromy, the twisted operator, the monodromy filtration in the coefficient category, its uniqueness and functoriality. Section 0.1 identifies its tame character with the local-field character through EtaleCohomologyFoundations §F.3a. Use these identifications when applying the curve theorem; no second filtration is constructed here.

### From TauCetiRoadmap.DeligneWeightsAndPurity

Sections 0.1–0.19 supply scalar Weil-number arithmetic, powers in both directions, spectra of powers and direct sums, descent from purity for all embeddings, and comparison with ArithmeticGaloisRepresentations §2.6. Section 5.11 supplies local monodromy purity for a lisse punctually pure sheaf on a finite-field curve, including closed points and the residue cardinality `q_x`. Layers DWP.4 and DWP.7, in particular §7.15, supply smooth projective and proper smooth finite-field purity. Layer 1 applies these theorems to the cohomology local system; it does not rebuild their tensor-power argument.

### From TauCetiRoadmap.EtaleCohomologyFoundations

Sections F.2.1–F.2.3 give proper and smooth base change, invariance under extension of separably closed fields, local acyclicity and lissity for a proper smooth family with invertible coefficients. Sections F.3 and F.4.1–F.4.6 give finite geometric cohomology, normalized adic systems, derived realization and finite-dimensional rational cohomology. In particular §F.4.6 `VanishingCycles.adicFunctoriality` supplies continuous geometric Galois actions, equivariant restriction along field extensions and conjugacy under closure change; §F.2.2 supplies separably closed extension invariance. Use these with the coefficient descent data, derived completeness and finiteness/realization hypotheses of §§F.4.3–F.4.6, and with ℓ invertible. Section F.3a supplies the trait tame character; §G.2 `nagataCompactification` supplies Nagata compactification for the uniform alteration; §§0.9, F.6 and F.10.2 supply the positive first Chern class, smooth trace/Poincaré pairing and scheme/descent Frobenius conventions.

### From TauCetiRoadmap.PerfectoidSpaces

Sections P1.6 and P1.10–P1.15 give perfectoid fields, the Frobenius criterion, sharp, functorial tilting and the tilt of a field; §P1.6 supplies sharp naturality and §P1.15 `tiltField.residueFieldEquiv` supplies the residue-field isomorphism; P1.32a supplies the completed Kummer-field example. Sections P3.7–P3.8 give finite extensions, preservation of degree and Fontaine–Wintenberger with its componentwise action on the completed algebraic closure, for chosen compatible closures. The specific coordinate and marked-monodromy calculations are §2.1–§2.4 here.

### From TauCetiRoadmap.AdicEtaleGeometry and TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

AdicEtaleGeometry §A1.0.5 supplies finite-étale invariance under henselian completion, including the topologically henselian Tate-ring form. SchemeAndStackFoundations §0.23a supplies étale invariance under purely inseparable extension, which combines with completion for the completed perfection. FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3 supplies the Kummer field of norms, its Galois equivalence and the p = 2 norm-compatible sign; §R07.4.1 supplies the mod-p Kummer frame. For k = ℚ₂, N(√2) = −2 while N(−π_(n+1)) = −π_n, and both systems have the same coordinate modulo 2. Our t has sharp ϖ; comparison with the field-of-norms coordinate respects reduction modulo p and is not an assertion that the unmodified root system is norm-compatible at p = 2.

### From TauCetiRoadmap.AdicSpacesPartII and TauCetiRoadmap.AdicSpacesPartIII

AdicSpacesPartII §§R0.19.1–R0.19.2 and R1.3–R1.6 supply spectral/constructible topology, analytification, base change and properness. AdicSpacesPartIII §§R2.3–R2.4 supplies generic fibres and the affine rational domains for closed tubes; §R2.8 supplies formal-completion/algebraic comparison, an isomorphism for proper models; §R2.10 supplies section valuation domains and coefficient base change. These apply over complete rank-one valuation rings without a discreteness hypothesis. Section 3.1 identifies these equation-defined domains with the global finite-ideal tube.

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

Sections 1.1–1.5 supply module sheaves, derived direct images, Leray, pseudo-adic supports and continuity with verified site and coefficient descent. Sections 8.3–8.5 supply proper supports, proper base change, localization and support descent. Section 9.6 supplies curve duality over `Spa(C,C⁺)` and the étale-local effacement with trace factorization in every relative dimension; §9.7 supplies Berkovich's relative duality for separated smooth strict Berkovich maps and its proper adic transports. This roadmap's §3.4 constructs the nonproper adic relative duality over annuli from these trace and local-duality inputs. Sections 10.1–10.4 supply the radial regions, disc and annulus cohomology, and prime-to-residue Kummer covers with `annulusKummer`; §10.5 supplies Huber's constructibility of `Rf_!` for smooth separated quasi-compact f. Section 3.2 supplies overconvergence, §4.5 microbial valuation bases, and §5.4 the general-base nearby-cycle topos `OrientedEtaleProduct` with its nearby-cycle stalk formula, de Jong's plurinodal alteration theorem (a plurinodal factorization with group control, stated without prescribed opens or marked boundaries) and the uniform amplitude bound q ≤ 2N for fibre dimension at most N; these are consumed by the uniform route of §3.4 without a second construction. Layer 3 adds the coefficient-uniform alteration, adapted coefficients, annular covers, the uniform annular direct-image theorem and the finite-cover sheaf calculations used for the uniform neighbourhood result; it retains the suppliers' tautness, finite-type and coefficient-invertibility conditions. Sections 8.2 and 11.1 supply proper algebraic comparison and the general nonproper algebraic comparison of Huber's Theorems 3.7.2 and 3.8.1. Only their proper instances are needed for Y and Z′. Huber's comparison is used at finite level before taking adic limits.

### From TauCetiRoadmap.AnalyticToricGeometry and TauCetiRoadmap.AnalyticToricGeometryPartII

AnalyticToricGeometry Layer 0 supplies the complete regular projective fans for projective spaces and their finite products. AnalyticToricGeometryPartII §§0.3–0.5 supply monomial divisor sections, invariant Cartier representatives and integral toric line bundles; §§1.1–1.2 supply the unit toric space and the complete-fan analytification comparison; §§3.4–3.6 supply the tilting projection π, the étale-topos comparison and the open-topos restrictions, natural in the perfectoid field; §4.2 supplies the ambient prime-to-p torsion cohomology isomorphism; §5.1 supplies the section-domain neighbourhoods, §§5.2–5.3 dense-field section and hypersurface approximation, and §6.4 the complete-intersection approximation over a dense subfield. The approximation supplies dimension and image containment, without smoothness or geometric irreducibility. Layer 4 obtains these from components and alterations.

The §3.4 projection and §§3.5–3.6 topos targets explicitly include this field naturality. In particular their squares for C and C♭ intertwine continuous K-automorphisms and their tilts, and §4.2 includes the resulting cohomology equivariance.

### From TauCetiRoadmap.SchemeAndStackFoundations

Sections 0.7–0.9 and 0.23a supply geometric irreducible components after a finite separable extension (§0.7 `geometric_irreducible_components`), descent of finite-presentation models and of smoothness and properness to a finite stage, spreading out and purely inseparable étale invariance. Sections 4.16 and 4.19 supply alterations; §4.19 `alteration_theorem` gives a regular source projective over the base field and asserts neither smoothness nor geometric irreducibility over an imperfect field. Over the perfect fields used in §4.1, §4.13 `regularLocus_eq_smoothLocus` makes that source smooth, and §§0.7, 0.9 supply the constant-field and finite-stage descents. Sections 5.2–5.3 supply proper Chow pushforward, degree and the first-Chern-class projection formula. They apply to the proper generically finite g and the integral image W, including inseparable degree.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

Section A2.7 `ampleIntersectionPositive` gives positive intersection of d ample line bundles on a nonempty d-dimensional closed subscheme of a proper scheme over any field. On the integral projective image W, specialize all d bundles to H. In dimension zero use the degree of the closed point, [κ(W):k] > 0, including inseparable degree, with pushforward and degree from SchemeAndStackFoundations §§5.2–5.3.

### From TauCetiRoadmap.EtaleDualityAndPerverseSheaves

Sections 0.5–0.6 and 3.4–3.7 provide the rational extensions of trace-normalized perfect cup-product pairings, top-degree cohomology and their Galois and coefficient compatibilities. Section 1.3 provides the cycle-class/intersection comparison and trace equal to zero-cycle degree, extended rationally by §3.7. On a geometrically connected smooth proper d-fold the top group is E(−d); for d = 0 use the unit of the point directly. On ℙ¹ the hyperplane class has trace +1, geometric Frobenius q, and twist (1) removes that q.

## How to read the build

Layer 0 defines the marked local data and purity and proves restriction, transport and summand detection. Layer 1 identifies the equal-characteristic cohomology representations to which Deligne applies. Layer 2 marks the Kummer/tilt Galois equivalence with the data of Layer 0. Layer 3 independently develops small cohomological neighbourhoods, retaining the characteristic-zero punctured-disc route and adding the coefficient-uniform nearby-cycle alteration, adapted coefficients, annular covers, and the uniform annular and descent inputs for one radius in all invertible constant coefficients in either characteristic. Layer 4 combines the toric approximation with that neighbourhood, constructs the multiplicative comparison, proves its top-degree isomorphism and splits it before transferring weights. No headline theorem is statable at the pins: the geometric headline statements require the supplier carriers listed in the module docstring of [Suggested.lean](Suggested.lean), and the equivariant splitting of §4.4 is elementary linear algebra on free carriers, kept as a target here.

## Layer 0: Weight–monodromy purity and varieties

### 0.1 Local monodromy data and their isomorphisms

Define a local monodromy datum D on a profinite group H to consist of a closed normal subgroup I, a continuous additive homomorphism t : I → `ℚ_ℓ` with nonzero image, an integer Q ≥ 2 prime to ℓ, and a nonempty Frobenius coset Fr = ΦI. Require H/I ≅ ℤ̂ as topological groups, with the image of Φ a topological generator, and require t(ΦσΦ⁻¹) = Q⁻¹t(σ) for σ ∈ I. Compactness, Hausdorffness and total disconnectedness are part of profiniteness. An isomorphism D → D′ is a topological group isomorphism α carrying I onto I′ and Fr onto Fr′, with Q = Q′ and t′∘α = c t for one c ∈ `ℚ_ℓˣ`. Define cD by replacing t with ct. These are marked data: an unmarked group isomorphism is insufficient (SCH12, §9, pp. 307, 309; SCH12 line 2508 and line 2592).

The twist is independent of the lift in its inertia coset because t kills inertia commutators. Prove composition, inversion and rescaling of data with constants cc′, c⁻¹ and c. If 1 belonged to Fr the twist would force (1−Q⁻¹)t = 0; since Q ≥ 2 in characteristic zero, this contradicts t ≠ 0. Compact inertia makes every open subgroup finite index, so the restriction of t to it is nonzero.

Its API consists of the following facts.

- The structure on a profinite H bundling I, t, Fr, Q with closedness, normality, nonvanishing, coset, generation and twist conditions.

- For Φ ∈ Fr and σ ∈ I: t(ΦσΦ⁻¹) = Q⁻¹·t(σ).

- Φ, Φ′ ∈ Fr imply Φ⁻¹Φ′ ∈ I; conversely Φ ∈ Fr and σ ∈ I imply Φσ ∈ Fr and σΦ ∈ Fr.

- 1 ∉ Fr.

- For c ∈ `ℚ_ℓ^×`, the datum (H, I, c·t, Fr, Q).

- The proposition that a topological group isomorphism α : H ≃ H′ with constant c is an isomorphism of data D → D′.

- The identity of H is an isomorphism D → D with c = 1.

- Composition of isomorphisms; constants multiply.

- The inverse isomorphism, with constant c⁻¹.

- The identity gives c·D → D with constant c⁻¹, or D → c·D with constant c.

**Checks.**

- For q ≥ 2 prime to ℓ, let ℤ̂ act on `ℤ_ℓ` by n·x = `q^{−n}x` (the continuous extension of n ↦ `q^{−n}` to ℤ̂ → `ℤ_ℓ^×)`. Then H = `ℤ_ℓ` ⋊ ℤ̂, I = `ℤ_ℓ` × {0}, t(x, 0) = x, Fr = `ℤ_ℓ` × {1}, Q = q is a local monodromy datum: (0,1)(x,0)(0,1)⁻¹ = (q⁻¹x, 0).

- Taking Fr = I (the coset of the identity) violates the twist relation for every Q ≥ 2, because t is nonzero.

- In the tame model, replacing Fr by `ℤ_ℓ` × {−1} (arithmetic Frobenius) gives t(ΦσΦ⁻¹) = q·t(σ), which is not the relation with any Q ≥ 2: the geometric sign is forced.

- For c = ℓ, the identity of H is an isomorphism D → ℓ·D with constant ℓ; it is not an isomorphism with constant 1.

- The discrete group H = ℤ[1/Q] ⋊ ℤ with action n·x = `Q^{−n}x`, I = ℤ[1/Q], t the inclusion into `ℚ_ℓ` and Fr the coset of 1 satisfies the twist but is not profinite. Its inertia has the open subgroup {0}, on which t vanishes; an exponential condition there cannot determine N. This model must be excluded by the topology hypotheses.

*Needs:* Mathlib continuous homomorphisms, normal subgroups, ℓ-adic coefficients; LocalFieldsRamification Layer 4 for the motivating example.

### 0.2 The standard local monodromy datum of a local field

For every nonarchimedean local field k and ℓ ≠ p, construct `D_k` from its absolute Galois group, inertia `I_k`, the ℓ-component of the tame character, geometric Frobenius lifts and Q = q. The tame coordinate is the image of the compatible Kummer ratios `σ(ϖ^{1/ℓ^n})/ϖ^{1/ℓ^n}`; inertia makes it independent of the chosen uniformizer and root system. Fix the same identification of the Tate coordinates under field extension. For k′/k finite, with ramification index e and residue degree f, `D_k` restricted to `G_{k′}` equals `eD_{k′}`, has Q = `q^f`, and is isomorphic to `D_{k′}` with constant e⁻¹ (SCH12, §9, Proposition 9.1 and the remark after Conjecture 9.3, pp. 307–308; SCH12 line 2511 and line 2547).

Use the residue exact sequence and the intrinsic arithmetic tame action, then invert Frobenius. Writing ϖ = `u(ϖ′)^e`, inertia fixes compatible prime-to-p roots of the unit u in the maximal unramified extension, so the Kummer coordinate scales by e. This also proves the finite-extension formula without assuming the extension tame.

Its API consists of the following facts.

- `D_k` for a local field k and ℓ ≠ p.

- The inertia of `D_k` equals `I_k`.

- `t_ℓ(σ)` is the ℓ-adic coordinate of `(σ(ϖ^{1/ℓ^n})/ϖ^{1/ℓ^n})_n` under the fixed `ℤ_ℓ(1)` ≅ `ℤ_ℓ`, independent of ϖ and the roots.

- Φ ∈ `Fr_k` iff Φ⁻¹ is an arithmetic Frobenius lift (TauCeti.IsArithFrobeniusLift).

- Q = #κ(k).

- For k′/k finite with ramification index e: `(D_k)|_{G_{k′}}` = `e·D_{k′}`.

- `t_ℓ(I_k)` = `ℤ_ℓ`.

**Checks.**

- For k = `ℚ_p` and σ ∈ `I_k` with `σ(p^{1/ℓ^n})` = `ζ_{ℓ^n}·p^{1/ℓ^n}` for the compatible system ζ = `(ζ_{ℓ^n})` chosen as generator of `ℤ_ℓ(1)`, `t_ℓ(σ)` = 1.

- For k′/k unramified of degree f′, the restricted datum equals `D_{k′}` on the nose: same inertia, constant 1, Q = `q^{f′}`.

- For k′ = `ℚ_p(p^{1/2})` over `ℚ_p` (p odd), `t_{ℓ,ℚ_p}|_{I_{k′}}` = `2·t_{ℓ,k′}`. The identity from the restricted datum to `D_{k′}` has constant 1/2, and its inverse has constant 2, nonzero in `ℚ_ℓ` even for ℓ = 2.

- An arithmetic Frobenius lift φ is not in `Fr_k`: its class in `G_k/I_k` is the inverse of the class of `Fr_k`, and `t_ℓ(φσφ⁻¹)` = `q·t_ℓ(σ)`.

- For k′/k unramified, the restriction is `D_{k′}` itself (e = 1).

*Needs:* §0.1; LocalFieldsRamification Layers 0, 2, 4; Tau Ceti inertia, tame and Frobenius APIs.

### 0.3 Restriction of a local monodromy datum to a highly ramified closed subgroup

For a local monodromy datum D, call a closed subgroup H′ admissible for restriction when its image in H/I is open and t(H′∩I) ≠ 0. If that image is fℤ̂, where f ≥ 1 is measured using the class of Fr, define the restricted datum on H′ by inertia H′∩I, the restricted character, Q′ = `Q^f`, and Fr′ = `H′∩Φ^fI`. The definition is independent of Φ. Prove transitivity for nested admissible closed subgroups and compatibility with rescaling and isomorphisms (SCH12, proof of Theorem 9.6, p. 309; SCH12 line 2592).

The quotient of H′ by H′∩I is fℤ̂, and the Frobenius coset maps to f times the original generator. Its conjugation scales t by Q⁻f. Closedness ensures compactness. In a nested restriction, residue indices multiply and tame characters restrict, giving the same Q and coset in both constructions.

Its API consists of the following facts.

- The restricted datum exists for closed H′ with open residue image and nonzero tame image.

- `(D|_{H′}).I` = H′ ∩ I.

- Φ′ ∈ Fr′ iff Φ′ ∈ H′ and Φ′ ∈ `Φ^f` I.

- `(D|_{H′}).Q` = `Q^f`.

- `(D|_{H′})|_{H″}` = `D|_{H″}`.

- `D|_{H}` = D.

- An isomorphism α : D ≅ D′ restricts to `D|_{H′}` ≅ `D′|_{α(H′)}` with the same constant.

**Checks.**

- For D = `D_k` and H′ = `G_{k′}`, k′/k unramified of degree 3: f = 3 and Q′ = q³.

- H′ = H gives f = 1 and `D|_{H}` = D.

- H′ = `I_k` is not allowed: its image in `G_k/I_k` is 0, so it has no Frobenius elements and weights cannot be read on it.

- For H′ = `G_{k(ϖ^{1/ℓ^∞})}` ⊆ `G_k`, `t_ℓ(H′∩I_k)` = 0: every Kummer ratio for ϖ is 1. The open-inertia exponential law becomes exp(0·N) = 1 for every N, so it cannot recover N.

- For H′ = `G_{k_∞}` with `k_∞` = `k(ϖ^{1/p^∞})` and k p-adic, f = 1 and t(H′ ∩ I) = t(I) (§2.4).

*Needs:* §0.1; Mathlib closed subgroups and profinite quotients.

### 0.4 Weight–monodromy purity relative to a local monodromy datum

Define weight–monodromy purity of weight w ∈ ℤ for a continuous finite-dimensional E-representation ρ of D by two conditions. First, an open subgroup I₁ of I acts by exp(t(σ)N) for a nilpotent E-endomorphism N. Second, for every Φ ∈ Fr and j ∈ ℤ, every eigenvalue over an algebraic closure of E of the induced action on `M_j(N)/M_{j−1}(N)` is a Weil Q-number of weight w+j. Use the supplied centered monodromy filtration and scalar Weil predicate. Prove uniqueness of N, the relation ρ(Φ)Nρ(Φ)⁻¹ = Q⁻¹N, and preservation of that filtration, so the definition determines an actual operator and graded action. For `D_k` this agrees with ArithmeticGaloisRepresentations §2.6 and the comparison of DeligneWeightsAndPurity §0.19. Scalar extension and nonzero rescaling preserve it (SCH12, Proposition 9.1, Definition/Proposition 9.2 and Conjecture 9.3, pp. 307–308; SCH12 line 2518).

On an open normal subgroup of H intersected with inertia, a nonzero value a of t recovers N as a⁻¹ log ρ(σ); finite logarithm and exponential are inverse. This proves uniqueness and then the Frobenius relation. On a monodromy grade the open unipotent inertia acts trivially, so inertia has finite image F there. If conjugation by A = ρ̄(Φ) on F has order r, `A^r` centralizes F and `(Aτ)^{r|F|}=A^{r|F|}`. Thus purity for one lift implies purity for every lift by the scalar power criterion in both directions. Kernels/images commute with finite coefficient extension, and cN has the same filtration for c ≠ 0. Tensor and dual laws use the supplied convolution and dual filtrations; twisting an arbitrary datum requires the character explicitly specified in the API.

Its API consists of the following facts.

- Purity is the conjunction of the open-inertia exponential condition and the monodromy-grade weight condition in the statement.

- If N and N′ both satisfy the open-inertia exponential condition (on possibly different open subgroups), then N = N′.

- For Φ ∈ Fr: ρ(Φ) ∘ N ∘ ρ(Φ)⁻¹ = Q⁻¹ · N.

- ρ(Φ) maps `M_j` into `M_j` for every j (any Φ with ΦN = cNΦ, c ≠ 0).

- Under the open-inertia exponential condition, the graded weight condition holds for all Φ ∈ Fr iff it holds for one Φ ∈ Fr.

- Purity relative to c·D is purity relative to D (N is replaced by c⁻¹N, with the same filtration).

- For E ⊆ E′, ρ is pure of weight w iff ρ `⊗_E` E′ is.

- For D = `D_k`, the predicate equals ArithmeticGaloisRepresentations §2.6's Weil–Deligne purity, through DeligneWeightsAndPurity §0.19.

- If ρ(I) is finite then N = 0, M is concentrated in degree 0, and purity means all eigenvalues of ρ(Φ) are Weil Q-numbers of weight w.

- The zero representation is pure of every weight.

- Purity is transported along isomorphisms of data (§0.6).

- Purity of ρ₁ ⊕ ρ₂ is purity of both (§0.7).

- Detection on a restricted datum (§0.5).

- If ρ is pure of weight w then its contragredient (with monodromy −Nᵗ) is pure of weight −w (ArithmeticGaloisRepresentations §2.6).

- Pure of weights w and w′ give a tensor product pure of weight w + w′ (convolution of monodromy filtrations, LefschetzPencilsAndVanishingCycles §§1.1–1.5).

- For the standard datum `D_k`, ρ(r) = ρ ⊗ `χ_ℓ^r` is pure of weight w − 2r. For a general datum the same conclusion needs a specified continuous character χ with `χ|_I` = 1 and χ(Φ) = Q⁻¹ for Φ ∈ Fr; no cyclotomic character of an arbitrary profinite group is assumed.

**Checks.**

- For D = `D_k`, the character `χ_ℓ⁻¹` `(ℚ_ℓ(−1)`, geometric Frobenius acting by q) is pure of weight 2 with N = 0.

- V = E² with basis e₀, e₁, ρ(Φ)e₀ = e₀, ρ(Φ)e₁ = q·e₁ for one geometric Frobenius, inertia acting on an open subgroup by exp(t(σ)N) with N e₁ = e₀, N e₀ = 0 (the dual Tate module of a Tate curve): `M_{−1}` = Ee₀, `M_1` = V, `gr_{−1}` has eigenvalue 1 (weight 0 = 1 − 1) and `gr_1` eigenvalue q (weight 2 = 1 + 1), so V is pure of weight 1.

- The zero representation is pure of every weight w.

- `ℚ_ℓ` ⊕ `ℚ_ℓ(−1)` with N = 0 is not pure of any weight: `gr_0` has eigenvalues 1 and q of weights 0 and 2. Purity depends on N, not on the semisimplification.

- For q = 2, the contragredient of the string V above has operator −Nᵗ and graded Frobenius eigenvalues 1/2 and 1, of weights −2 and 0, so it is pure of central weight −1. The operator +Nᵗ satisfies the same Frobenius twist but fails the open-inertia exponential law, since the dual action of exp(t(σ)N) is exp(−t(σ)Nᵗ).

- The ℓ-adic Tate module dual H¹ of a Tate elliptic curve over k is pure of weight 1 with N ≠ 0, while its semisimplification `ℚ_ℓ` ⊕ `ℚ_ℓ(−1)` with N = 0 is pure of no weight.

*Needs:* §§0.1–0.2; ArithmeticGaloisRepresentations §§2.4–2.6; LefschetzPencilsAndVanishingCycles §§1.1–1.5; DeligneWeightsAndPurity §§0.1–0.19; Mathlib nilpotent exponential.

### 0.5 Weight–monodromy purity is detected on highly ramified closed subgroups

For k a nonarchimedean local field and H′ a closed subgroup of `G_k` admissible for `D_k` as in §0.3, prove that any continuous finite-dimensional E-representation of `G_k` is pure of weight w for `D_k` if and only if its restriction to H′ is pure of weight w for the restricted datum. This applies to finite extensions; to the subgroup fixing k∞ = `k(ϖ^{1/p^∞})` in mixed characteristic; and, in characteristic p, to the subgroups obtained from an algebraic extension finite over the perfection of a finite extension. The assertion concerns local-field representations, for which quasi-unipotence is supplied, rather than arbitrary profinite representations (SCH12, pp. 308–309; SCH12 line 2547 and line 2592).

Grothendieck's theorem supplies N on `G_k` before restriction. Its restriction is the same N because the tame character remains nonzero on every open subgroup of H′∩I. For residue index f, a restricted Frobenius is `Φ^fτ`. On each grade a common positive power removes the finite inertia factor. Comparing spectra of powers and Weil `q^f-weights` proves both implications. At the p-power Kummer tower, Eisenstein gives full residue image and p-power degrees cannot kill the pro-ℓ tame quotient. Purely inseparable extensions do not change the étale Galois category.

**Checks.**

- Non-example: for H′ = `G_{k(ϖ^{1/ℓ^∞})}`, `t_ℓ` vanishes on H′ ∩ `I_k`, so the restricted datum is not defined; the restriction of the Tate-curve representation of §0.4 has inertia acting trivially on an open subgroup of H′ ∩ `I_k`, and on it geometric Frobenius has eigenvalues 1 and q on the whole space. The theorem fails without condition (b).

*Needs:* §§0.2–0.4; ArithmeticGaloisRepresentations §2.4; DeligneWeightsAndPurity §§0.11–0.12; LocalFieldsRamification Layer 0 and Layer 3 (totally ramified is equivalent to Eisenstein, for the p-power Kummer tower); SchemeAndStackFoundations §0.23a.

### 0.6 Purity is transported along isomorphisms of local monodromy data

For an isomorphism of local monodromy data α : D → D′ of constant c and a continuous finite-dimensional representation ρ′ of H′, prove purity of ρ′ for D′ equivalent to purity of ρ′∘α for D, with the same weight. The latter operator is cN′, since t′∘α = ct. Its filtration is the same filtration as that of N′ (SCH12, §9, pp. 307, 309; SCH12 line 2527 and line 2598).

Pull back the open inertia subgroup and substitute t′∘α = ct into the exponential. The operator becomes cN′, so its filtration and Frobenius spectra give the same weights. Apply the inverse isomorphism for the converse. In particular t ↦ ℓt sends N ↦ ℓ⁻¹N when the representation is held fixed.

**Checks.**

- For the identity D → ℓD the constant is ℓ and an operator N′ = ℓ⁻¹N pulls back to ℓN′ = N; taking ℓ = 2 gives 2·(N/2) = N.

*Needs:* §§0.1, 0.4; ArithmeticGaloisRepresentations §2.6 (rescaling).

### 0.7 Purity passes to stable direct summands, not to subrepresentations

For any datum D and continuous finite-dimensional representations ρ₁,ρ₂ over E, prove that their direct sum is pure of weight w exactly when both summands are pure of weight w. Thus an H-stable direct summand inherits purity. A stable subspace without a stable complementary subspace need not inherit the weight (SCH12, conclusion of Theorem 9.6, p. 311; SCH12 line 2652).

The equivariant projectors commute with ρ(σ), hence with its finite logarithm and N. The monodromy operator and its filtration are direct sums, and so are the grade spectra. Conversely combine the two open inertia subgroups and use N₁⊕N₂. No semisimplicity of arbitrary local-field representations is used.

**Checks.**

- Non-example: in the Tate-curve representation V of §0.4 (pure of weight 1), the subrepresentation ker N = E·e₀ has N = 0 and Frobenius eigenvalue 1, so it is pure of weight 0, not 1: it is not a direct summand.

- Take E = ℚ₃ and the tame datum of §0.1 at Q = 2, and let H = S₃ × (`ℤ_3` ⋊ ℤ̂) carry the datum with inertia S₃ × `ℤ_3`, t(s,x) = x and Frobenius coset S₃ × Fr. Let H act on E³ through the permutation action of S₃. The diagonal line and the sum-zero plane are stable with N = 0; the Frobenius (1, Φ) has spectra (1) and (1,1) on them, and every Frobenius element has root-of-unity eigenvalues, so both are pure of weight 0; they meet in zero because 3a = 0 forces a = 0 in E.

*Needs:* §0.4; ArithmeticGaloisRepresentations §2.6; DeligneWeightsAndPurity §§0.7, 0.9 (direct sums).

### 0.8 The weight–monodromy conjecture for a proper smooth variety

For a proper smooth variety X over a nonarchimedean local field k, define `WMC_ℓ(X,i)` to mean purity of weight i of its geometric cohomology `H^i(X_k̄,ℚ̄_ℓ)` for `D_k`, and `WMC_ℓ(X)` to mean this for every integer i. Use its actual continuous `G_k-action` from geometric cohomology. Degrees outside 0 through 2dim X vanish for nonempty X; for X empty every group vanishes. The definition includes disconnected varieties. It retains the monodromy of cohomology before semisimplification (SCH12, Conjecture 9.3, p. 308; SCH12 line 2543).

Construct the cohomology representation through finite-level functorial Galois actions and the normalized adic realization, then apply §0.4 degree by degree. Degree-zero cohomology is the finite permutation representation on geometric connected components, so its eigenvalues are roots of unity. For disjoint unions use §0.7. The local L-factor consequence is that the poles of det(1−q⁻sΦ | `H^i(X)^I)⁻¹` have real part at most i/2: invariants lie in ker N with monodromy grades at most zero. This is a consequence of purity, not its definition (SCH12 line 2560).

Its API consists of the following facts.

- The conjecture is the conjunction over all integer degrees of the cohomological purity predicates.

- `WMC_ℓ(X)` iff `WMC_ℓ(X`, i) for 0 ≤ i ≤ 2 dim X.

- `WMC_ℓ(X)` iff `WMC_ℓ(X_{k′})` for a finite extension k′/k (§0.9).

- A proper smooth model over `O_k` gives `WMC_ℓ(X)` for every ℓ ≠ p (§0.10).

- `WMC_ℓ(X`, 0) holds: H⁰ is the permutation representation on geometric connected components, with finite image, so all eigenvalues are roots of unity.

- `WMC_ℓ(X` ⊔ X′) iff `WMC_ℓ(X)` and `WMC_ℓ(X′)` (§0.7).

- `WMC_ℓ(Spec` k) holds.

**Checks.**

- `WMC_ℓ(ℙ^n_k)` holds, with `H^{2r}(ℙ^n_{k̄}`, `ℚ̄_ℓ)` = `ℚ̄_ℓ(−r)` of weight 2r.

- `WMC_ℓ(Spec` k) holds: H⁰ = `ℚ̄_ℓ` with trivial action, weight 0.

- If X has a proper smooth model 𝒳 over `O_k`, `WMC_ℓ(X`, i) is equivalent to the purity of `H^i(𝒳_{𝔽̄_q}`, `ℚ̄_ℓ)` of weight i (Deligne's Weil conjectures), since N = 0 and the action factors through `Gal(𝔽̄_q/𝔽_q)`.

- The representation `ℚ̄_ℓ` ⊕ `ℚ̄_ℓ(−1)` with trivial inertia, which is the semisimplification of H¹ of a Tate curve, is not pure of weight 1: the conjecture concerns `H^i` with its monodromy operator, not its semisimplification.

- `ℙ^n_k` satisfies the conjecture: `H^{2r}` = `ℚ̄_ℓ(−r)`, odd degrees vanish, N = 0 and geometric Frobenius acts by `q^r`.

- For a split Tate elliptic curve, `H^1` is the string of §0.4: its inertia invariants are ker N = Ee₀ with geometric Frobenius eigenvalue 1, so the local factor is (1 − q^(−s))⁻¹ with poles of real part 0 ≤ 1/2. The semisimplification with trivial inertia would give (1 − q^(−s))⁻¹(1 − q^(1−s))⁻¹, with poles of real part 1 > 1/2.

*Needs:* §§0.2, 0.4, 0.7; EtaleCohomologyFoundations §§F.2.2, F.3, F.4.3–F.4.6, especially `VanishingCycles.adicFunctoriality`.

### 0.9 The weight–monodromy conjecture is invariant under finite extension of the base field

For every proper smooth X/k, prime ℓ ≠ p, finite extension k′/k and integer i, prove `WMC_ℓ(X,i)` ↔ `WMC_ℓ(X_{k′},i)`. For a purely inseparable finite extension in characteristic p use étale invariance and compatible closures; for a separable extension use the open subgroup. The assertion includes ramified extensions and both directions (SCH12, remark after Conjecture 9.3, p. 308; SCH12 line 2547).

Use geometric base change to identify the cohomology of `X_{k′}` with the restricted representation. Apply §0.5 and then the data isomorphism `eD_{k′}` → `D_{k′}` of constant e⁻¹. Purely inseparable factors are handled by the supplied étale equivalence, with the positive ramification scalar still nonzero in E.

**Checks.**

- For X an elliptic curve with potentially good reduction, WMC holds over k because it holds over the finite extension where it acquires good reduction (§0.10).

- For ℙ¹ and a residue extension of degree f, restriction changes the eigenvalues on H⁰ and H² from (1,q) to (1,qᶠ). The geometric comparison sends the unit and the hyperplane class to the corresponding classes, each with trace coordinate 1.

- In characteristic p, a purely inseparable extension preserves the geometric dimensions (dim H⁰, dim H²) = (1,1) of ℙ¹; the comparison again has coordinates (1,1), rather than an additional Galois action.

*Needs:* §§0.2, 0.5–0.6, 0.8; EtaleCohomologyFoundations §§F.2.2, F.4.3–F.4.6 (`VanishingCycles.adicFunctoriality`); SchemeAndStackFoundations §0.23a.

### 0.10 Proper smooth varieties with good reduction satisfy the weight–monodromy conjecture

If X/k is the generic fibre of a proper smooth scheme over `O_k`, prove that `H^i(X_k̄,ℚ̄_ℓ)` is unramified and pure of weight i for every i and every ℓ ≠ p. Its monodromy operator is zero. Projectivity is not required: proper smooth finite-field purity supplies the special-fibre weights (SCH12, §9, p. 308; SCH12 line 2564).

Smooth proper base change identifies generic geometric cohomology with that of the special fibre, equivariantly for `G_k` through its residue quotient. Thus inertia is trivial, N = 0 and only grade zero occurs. Apply proper smooth finite-field purity.

**Checks.**

- `ℙ^n_k`, abelian varieties with good reduction, and smooth hypersurfaces of `ℙ^n_k` whose equation reduces to a smooth equation modulo ϖ.

- A Tate elliptic curve has no good model and its H¹ has N ≠ 0; the theorem does not apply, while WMC still holds (classical curve case, and Theorem 9.6 for plane cubics).

*Needs:* §§0.4, 0.8; EtaleCohomologyFoundations §§F.2–F.4.6; DeligneWeightsAndPurity §7.15.

### Examples

The two-term Tate-curve string of the conventions has weights 0 and 2 on grades −1 and 1, central weight 1; its semisimplification puts both eigenvalues in grade zero and has no central weight. On ker N the sole eigenvalue is 1 and the weight is 0. For an unramified residue extension of degree 3 the pair (q,Φ) becomes (q³,Φ³): the eigenvalues become 1 and q³, with the same central weight. For ℙ², only H⁰,H²,H⁴ survive, with eigenvalues 1,q,q² and weights 0,2,4.

### Dependencies

LocalFieldsRamification Layers 0–4; ArithmeticGaloisRepresentations §§1.5, 2.1a, 2.4–2.6; LefschetzPencilsAndVanishingCycles §§1.1–1.5; DeligneWeightsAndPurity §§0.1–0.19, 7.15; EtaleCohomologyFoundations §§F.2–F.4.6; SchemeAndStackFoundations §0.23a. The abstract transport and summand results need no geometric base change.

## Layer 1: Equal-characteristic weight–monodromy

### 1.1 Deligne's weight–monodromy theorem over local fields of curves

Let C be a smooth curve over `𝔽_q`, x a closed point, k the fraction field of the completed local ring at x, and f : X → C∖{x} proper and smooth. For every ℓ ≠ p and i, prove `WMC_ℓ(X_k,i)`, using Q = #κ(x). This is the proper-smooth cohomological application of the local pure-sheaf theorem, with no good-reduction hypothesis at x (SCH12, Theorem 9.4, pp. 308–309; SCH12 line 2571; DEL80, Theorem 1.8.4, pp. 175–176; DEL80 line 1524).

Take the lisse sheaf `R^i` `f_*ℚ̄_ℓ`. Smooth proper base change identifies its fibres with fibre cohomology; finite-field purity makes it punctually pure of weight i for every complex embedding. Apply DeligneWeightsAndPurity §5.11 and its all-embeddings scalar criterion. At a closed point of degree a the correct base is `q_x` = `q^a`. Equivalently extend constants to κ(x), take the component through a point above x and apply the rational-point form; the completion there is k. The tensor-power criterion of Scholze's Lemma 9.5 remains the supplier's proof input, with its weight i explicitly quantified.

**Checks.**

- For the Legendre family y² = x(x − 1)(x − λ) over C = `ℙ¹_{𝔽_q}` ∖ {1, ∞}, p odd, at x = (λ = 0): H¹ of the generic fibre over k = `𝔽_q((λ))` has N ≠ 0, `Gr_{−1}` of weight 0 and `Gr_1` of weight 2.

- Points of good reduction (f extends smoothly over x) give N = 0 and purity of weight i, matching §0.10.

*Needs:* Layer 0; DeligneWeightsAndPurity §§0.19, 5.11, 7.15; EtaleCohomologyFoundations §§F.2–F.4.6; AdicEtaleGeometry §A1.0.5 (henselization/completion).

### 1.2 Weight–monodromy for proper smooth varieties over global function fields at every place

For a global function field F of characteristic p, a place v, a proper smooth Z/F and ℓ ≠ p, prove purity of weight i of `H^i(Z_Fˢ,ℚ̄_ℓ)` restricted to the decomposition group `G_{F_v}`, for every i. Fix compatible separable closures to identify this with `H^i(Z_{F_vˢ},ℚ̄_ℓ)`. All places v are included, with their own residue cardinality (SCH12, Theorem 9.4 and conclusion of Theorem 9.6, pp. 308, 311; SCH12 line 2571 and line 2652).

Spread Z to a proper smooth family on a dense open U of the smooth projective curve of F. At v ∈ U use §0.10. Otherwise use the open curve U∪{v} and §1.1 at v. Geometric field-extension comparison identifies its local fibre with the stated restricted global cohomology.

**Checks.**

- For Z = `ℙ^n_F` the representation is unramified and pure at every place.

*Needs:* §1.1 and §0.10; SchemeAndStackFoundations §§0.8–0.9; EtaleCohomologyFoundations §§F.2.2, F.4.3–F.4.6, especially `VanishingCycles.adicFunctoriality`.

### Examples

For the Legendre family y²=x(x−1)(x−λ) at λ=0 in odd characteristic, the nonzero rank-one N has grades −1 and 1 of weights 0 and 2; possible nonsplit multiplicative reduction multiplies both eigenvalues by an unramified sign, without changing their absolute values. At a closed point of degree a, those eigenvalues have moduli 1 and `q^a`. A constant proper smooth family has N=0 and only grade zero, recovering finite-field purity.

### Dependencies

Layer 0; DeligneWeightsAndPurity §§5.11, 7.15; EtaleCohomologyFoundations §§F.2–F.4.6; SchemeAndStackFoundations §§0.8–0.9; AdicEtaleGeometry §A1.0.5. No input from Layers 2–4 is needed.

## Layer 2: The Kummer tower and its marked Galois groups

### 2.1 The Kummer tower of a p-adic local field and its tilt

Let `k/ℚ_p` be finite, choose a uniformizer ϖ and compatible p-power roots `ϖ_n` with ϖ₀ = ϖ. Put k∞ = `∪_n` `k(ϖ_n)` and K = its completion. Identify the `degree-p^n` totally ramified stages, residue field `𝔽_q` and value group `|ϖ|^{ℤ[1/p]}`. Prove K perfectoid and `O_K/(ϖ)` ≅ `𝔽_q[T^{1/p^∞}]/(T)`. Identify t = `(ϖ_n)_n` in K♭ with t♯ = ϖ, and `O_{K♭}` with the t-adic completion of `𝔽_q[t^{1/p^∞}]`. Consequently K♭ is the completed perfection of `𝔽_q((t))`, and `𝔽_q(t)^perf` is dense in it. This records the coordinate form of the supplied completed Kummer-field example (SCH12, Theorem 1.1 and proof of Theorem 9.6, pp. 245–246, 309; SCH12 line 2592).

Use Eisenstein `X^{p^n}−ϖ` at every stage. Frobenius on `O_K/p` is surjective: approximate an integral element modulo p at a finite stage and expand it as a finite sum of Teichmüller coefficients times powers of `ϖ_n`. Taking p-th roots of the coefficients in `𝔽_q` and replacing `ϖ_n` by `ϖ_{n+1}` produces a p-th root modulo p. The value group is nondiscrete. Apply the perfectoid criterion and compute the inverse Frobenius limit modulo ϖ, obtaining the asserted tilt. Finite character expansions in `t^{1/p^n}` prove density. The fields at finite stages remain discrete and are not perfectoid.

Its coordinate API consists of the following facts.

- Each stage k(ϖₙ) has degree pⁿ over k, normalized valuation group p⁻ⁿℤ relative to v_k(ϖ) = 1, and residue field 𝔽_q.
- Completion of the union has value group ℤ[1/p] in this normalization, residue field 𝔽_q and surjective Frobenius on O_K/p.
- The coordinate quotient sends `T^{1/p^n}` to ϖₙ modulo ϖ, and has exactly the relation T = 0 and its consequences.
- The tilt coordinate satisfies t♯ = ϖ; the t-adic completion and the dense subfield are the ones specified above.

**Checks.**

- For k = `ℚ_p` this is the example K = completion of `ℚ_p(p^{1/p^∞})`, K♭ = `𝔽_p((t^{1/p^∞}))^∧`, t♯ = p (Scholze 2012, Theorem 1.1 and the paragraph after it).

- For k = ℚ₂(√2), ϖ = √2 and v_k(ϖ) = 1, the first stage k(√ϖ) has degree 2 and v_k(√ϖ) = 1/2. In O_K/(ϖ), the class of ϖ₁ is nonzero with square zero, agreeing with `T^{1/2}` in `F_2[T^{1/2^infty}]/(T)`; the reduced quotient would lose this class.

- At p = 2 the norm of ϖ₁ from k(ϖ₁) to k is −ϖ, while t♯ = ϖ. Sharp uses the multiplicative inverse-limit coordinate, not the unsigned norm of a tower uniformizer.

- Non-example: the fields `k(ϖ^{1/p^n})` themselves are not perfectoid (discretely valued); only the completed union is.

*Needs:* LocalFieldsRamification Layers 0–1 and Layer 3 (totally ramified is equivalent to Eisenstein); Tau Ceti Teichmüller lift; PerfectoidSpaces §§P1.10–P1.15, P1.32a.

### 2.2 Galois groups of the Kummer tower, its completion, its tilt and `𝔽_q((t))`

Choose a completed algebraic closure C of K and its tilt C♭, with compatible embedded closures, and put k′ = 𝔽_q((t)). Name β the composite `G_{k∞}` ≅ `G_K` ≅ `G_{K♭}` ≅ `G_{k′}` of henselian completion, Fontaine–Wintenberger and the completed-perfection comparison. Use the same notation for its middle arrow and its restrictions after these identifications. This is notation for the supplied equivalences, used to formulate the additional marked comparisons in §§2.3–2.4 (SCH12, proof of Theorem 9.6, p. 309; SCH12 line 2597).

Its API records the following supplied compatibilities for this composite.

- The source is the closed subgroup `G_{k∞}` of `G_k`, and the target is `G_{k′}` with the chosen compatible closures; the composite is a topological group isomorphism.
- For σ ∈ `G_K`, the middle arrow acts componentwise on C♭ and satisfies (β(σ)x)♯ = σ(x♯), by PerfectoidSpaces §§P1.6, P3.8.
- β preserves identities, products and inverses, and transports the Galois correspondence; a degree-r finite extension L/K corresponds to L♭/K♭ of degree r, by PerfectoidSpaces §P3.7.
- Restricting the middle arrow to `G_L` gives the supplied equivalence `G_L` ≅ `G_{L♭}` with the same closure choices.

**Checks.**

- The identity automorphism has β(1)x = x for every coordinate, hence (β(1)t)♯ = ϖ. A zero coordinate map would send the nonzero t to zero.
- At k = ℚ₂, choose σ with σ(ζ₃) = ζ₃². If ζ₃♭ is the compatible prime-to-2 preimage of §2.3, then β(σ)ζ₃♭ = (ζ₃♭)², whose sharp is ζ₃² ≠ ζ₃. This excludes an identity-only action.
- Every σ ∈ `G_K` fixes all ϖₙ, so β(σ)t = t and (β(σ)t)♯ = σ(ϖ) = ϖ. For a degree-r extension the corresponding tilted degree is r; for the unramified quadratic extension both degrees are 2 and both residue fields have q² elements.

*Needs:* §2.1; PerfectoidSpaces §§P1.6, P1.15, P3.7–P3.8; AdicEtaleGeometry §A1.0.5; SchemeAndStackFoundations §0.23a; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3 for comparison with its field-of-norms notation; Mathlib absolute Galois restriction.

### 2.3 Prime-to-p Tate coordinates and the supplied residue comparison

For an algebraically closed perfectoid field C of residue characteristic p and its tilt C♭, use PerfectoidSpaces §P1.15 `tiltField.residueFieldEquiv` and its §P1.6 naturality. Prove that for every ℓ ≠ p and n ≥ 1, sharp restricts to an isomorphism `μ_{ℓ^n}(C♭)` ≅ `μ_{ℓ^n}(C)`, compatible with the transition power maps, and hence identifies their ℓ-adic Tate modules. Both identifications commute with continuous automorphisms and their tilts. In particular β matches residue-field actions and cyclotomic characters (SCH12, §3, tilt construction, and §9, p. 309; SCH12 line 2597).

Apply the supplied residue comparison to the action in §2.2. For the additional Tate-coordinate comparison use multiplicativity of sharp. If an `ℓ^n-torsion` element has sharp 1, its r-th inverse-limit coordinate has order dividing both `p^r` and `ℓ^n`, so is 1. Both torsion groups have `ℓ^n` elements; hence sharp is bijective on them. Componentwise actions give equivariance and transition compatibility. For ℓ = p in mixed characteristic the source torsion is trivial and surjectivity fails.

**Checks.**

- For C = `ℂ_p` and ℓ ≠ p, the compatible system `(ζ_{ℓ^n})` ∈ `ℤ_ℓ(1)_{ℂ_p}` has a unique preimage in `ℤ_ℓ(1)_{ℂ_p♭}`.

- Non-example in mixed characteristic: `μ_{p^n}(C♭)` = {1}, whereas `μ_{p^n}(C)` has `p^n` elements, so ♯ is not surjective on these root-of-unity groups. The element ε = (1, `ζ_p`, `ζ_{p²}`, …) has ε♯ = 1 and ε ≠ 1, but has infinite order in C♭; it witnesses noninjectivity on the full multiplicative group, not on p-power torsion.

*Needs:* §2.2 for the Galois application; PerfectoidSpaces §§P1.4–P1.6, P1.15; roots of unity in algebraically closed fields.

### 2.4 Tilting matches inertia, Frobenius, q and the tame character

Let L/K be finite as in §2.2, and let k″ ⊆ L♭ be a closed characteristic-p local subfield containing t such that L♭ is the completion of an algebraic extension finite over the perfection of a finite extension of k″. Prove that `G_L` ⊆ `G_k` and `G_{L♭}` ⊆ `G_{k″}` are admissible for restriction. The tilt equivalence β is an isomorphism of restricted data: it matches inertia and geometric Frobenius, and both restricted Q equal #κ(L) = #κ(L♭). If e = `v_{k″}(t)` > 0, the positive tame coordinates satisfy `t_{ℓ,k}` = `e(t_{ℓ,k″}∘β)`. Thus the constant of the data isomorphism from the k-side to the k″-side is e⁻¹, not e. In particular the constant is 1 for k″ = `𝔽_q((t))` (SCH12, proof of Theorem 9.6, p. 309; SCH12 line 2592).

Identify inertia as the kernel of the common residue action. Its open residue image determines the same Frobenius coset and Q on both sides. Write t = `u(ϖ″)^e`; inertia fixes prime-to-p roots of u. Applying sharp to compatible ℓ-power roots of t gives compatible roots of ϖ, proving `t_{ℓ,k}` = e `t_{ℓ,k″}∘β`. The p-power tower has full tame image; passage to finite L preserves a nonzero lattice image. This proves admissibility on both sides and fixes the direction of the scalar.

**Checks.**

- For L = K and k″ = 𝔽_q((t)), β preserves the inertia kernel and geometric Frobenius coset, both Q are q, and `t_{ell,k}` = `t_{ell,k''}`∘β, so the scalar is 1. At q = 2 the two-term string has eigenvalues (1,2), N(e₁) = e₀ and weights (0,2) on both sides (SCH12, p. 309; SCH12 line 2598).

- If k″ = `𝔽_q((t^{1/p}))` then `v_{k″}(t)` = p, and `t_{ℓ,k}` = `p·t_{ℓ,k″}∘β`; p is a unit in `ℤ_ℓ`, and the data-isomorphism scalar is p⁻¹. For p = 2 and ℓ = 3 this gives (1/2)(2N) = N on the two-term string.

*Needs:* §§0.2–0.5, 2.1–2.3; LocalFieldsRamification Layers 0, 2, 4; henselian completion and purely inseparable étale invariance as in §2.2.

### 2.5 Transfer of weight–monodromy purity through the tilt

With k,K,L,k″ and β as in §2.4, let V be a continuous finite-dimensional `G_k-representation` and W a continuous finite-dimensional `G_{k″}-representation` pure of weight w. If V restricted to `G_L` is isomorphic to a `G_L-stable` direct summand of W restricted along β, prove V pure of weight w for `D_k`. The complementary subspace is part of the hypothesis, not a consequence of injectivity alone (SCH12, proof of Theorem 9.6, pp. 309, 311; SCH12 line 2592 and line 2652).

Restrict W to `G_{L♭}`, transport along the marked β, and take the stable summand. Apply detection on `G_L` ⊆ `G_k` to recover purity of V. Each use of detection has both an open residue image and a nonzero tame image by §2.4.

**Checks.**

- Non-example: if `V|_{G_L}` only embeds into W without a stable complement, the conclusion fails in general (ker N in the Tate-curve representation, §0.7).

*Needs:* §§0.5–0.7, 2.4; no cohomological or toric input.

### Examples

For k=ℚ₂ the coordinate t has t♯=2 even though the naive tower uniformizers are not norm-compatible: `N_{ℚ₂(√2)/ℚ₂}(√2)=−2`. This is compatible with the signed field-of-norms coordinate because signs disappear modulo 2. For `k″=𝔽_q((t^{1/p}))`, `v_{k″}(t)=p` and the datum isomorphism has scalar p⁻¹. For the Tate string, N on the k″ side is pN on the k side, so pullback by a data isomorphism of scalar p⁻¹ gives the original N. Finite residue degree a replaces the two eigenvalues by 1 and `q^a` on both sides.

### Dependencies

Layer 0; LocalFieldsRamification Layers 0–4; PerfectoidSpaces §§P1.4–P1.6, P1.10–P1.15, P1.32a, P3.7–P3.8; AdicEtaleGeometry §A1.0.5; SchemeAndStackFoundations §0.23a; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.1, R07.4.3. The roots-of-unity calculation does not require Layer 1.

## Layer 3: Cohomology of tubular neighbourhoods

### 3.1 Tubular neighbourhoods of a closed subscheme in the generic fibre

Let K be complete with nontrivial rank-one valuation, O = K°, X finite type over O and Z ↪ X a closed immersion of finite presentation. For ε ∈ |Kˣ|, glue the rational closed-tube domains of the formal generic fibre to a tube T(Z,ε): on an affine U with ideal generators `g₁,…,g_r` its points satisfy `|g_j|` ≤ ε for every j. This is the ideal-indexed specialization of the equation-dependent closed tube of AdicSpacesPartIII §R2.4. Prove generator independence, quasicompact openness, monotonicity, intersection `∩_ε` T(Z,ε) = d(Ẑ), and cofinality inside every constructible subset containing d(Ẑ). Prove inverse-image and complete-field-base-change compatibility. For a proper model identify d(X̂) with `(X_K)^ad` and d(Ẑ) with `(Z_K)^ad` (ITO20, Proposition 4.1 and Lemma 4.3, pp. 19–20; ITO20 line 866 and line 918).

Integral change-of-generator coefficients have norm at most one, proving that the inequalities depend on the ideal. Glue a finite affine cover, use rational-domain quasicompactness and the constructible topology to prove cofinality. Pulling back generators proves inverse-image and field-base-change formulas. Proper-model comparison identifies the zero locus with the analytification of the generic closed subscheme. Keep the chosen integral subscheme: equal generic fibres need not give equal tubes at a fixed radius.

Its API consists of the following facts.

- T(Z, ε) ⊆ d(X̂) for Z ⊆ X closed of finite presentation and ε ∈ `|K^×|`.

- On an affine open U with generators `g_i` of the ideal of Z ∩ U: T(Z, ε) ∩ d(Û) = `{|g_i|` ≤ ε for all i}.

- T(Z, ε) is open.

- T(Z, ε) is quasi-compact.

- ε′ ≤ ε implies T(Z, ε′) ⊆ T(Z, ε).

- `∩_{ε}` T(Z, ε) = d(Ẑ).

- Every constructible W ⊇ d(Ẑ) contains some T(Z, ε).

- T(Z `×_X` X′, ε) = d(f̂)⁻¹ T(Z, ε).

- For a complete extension K′/K and ε ∈ |Kˣ|, `T(Z_{O′}`, ε) is the preimage of T(Z, ε).

- Continuous K-automorphisms of K′ preserve `T(Z_{O′}`, ε).

- For X proper over O the natural generic-fibre comparison identifies d(X̂) with `(X_K)^ad` and d(Ẑ) with `(Z_K)^ad`.

- For Σ complete and regular, the toric model `X_{Σ,K°}`, finitely many normalized sections `f_1`, …, `f_s` of invariant integral Cartier models and c ≥ 0 with `|ϖ|^c` ∈ |Kˣ|, the section domain `N_c(f_1`, …, `f_s)` of AnalyticToricGeometryPartII §5.1 is `T(V(f_1`, …, `f_s)`, `|ϖ|^c)`: on a chart with an integral generator of each line bundle the sections become functions generating the ideal of the common zero scheme, and a change of integral generator has norm one at every point.

**Checks.**

- For X = Spec O[T] and Z = V(T), T(Z, ε) is the closed disc {|T| ≤ ε} in d(X̂) = Spa(K⟨T⟩, O⟨T⟩).

- For Z = X (ideal 0), T(Z, ε) = d(X̂); for Z = ∅ (ideal (1)) and ε < 1, T(Z, ε) = ∅.

- For X = Spec O[T], Z = V(T), Z′ = V(ϖT) and 0 < |ϖ| < 1, take ε = |ϖ|². Then T(Z′, ε) = {|T| ≤ |ϖ|}, whereas T(Z, ε) = {|T| ≤ |ϖ|²}; the K-point T = ϖ lies only in the former. Both subschemes have generic fibre V(T), and both tube families are cofinal. For ε ≥ 1 both tubes are the unit disc, so inequality is not asserted for every radius.

*Needs:* AdicSpacesPartII §§R0.19.1–R0.19.2; AdicSpacesPartIII §§R2.3–R2.4, R2.8, R2.10; AnalyticToricGeometryPartII §5.1 for the section-domain comparison.

### 3.2 Local constancy of direct images near the centre of a disc (Huber)

For K algebraically closed, complete and of characteristic zero, X separated finite type over O = K°, a global f ∈ `Γ(X,O_X)` and positive n invertible in O, consider `f^rig` : d(X̂) → B(1), with T ↦ f. For each integer j ≥ 0, prove that `R^j` `f^rig_*ℤ/n` is oc-quasi-constructible in Huber's sense (HUB98, Definition 1.4 and Theorem 2.1), and therefore is locally constant of finite type on `B(ε_j)∖{0}` for some positive `ε_j` ∈ |Kˣ|. Oc-quasi-constructibility here refers to the literature's condition on étale sheaves in that definition, not a substitute meaning only the last consequence. The consequence and its degreewise quantifier are the form recalled in ITO20, §1.2, pp. 2–3 (ITO20 line 99).

Use Huber's finiteness theorem in exactly the form recalled by Ito. The radius is initially a function of j and n. Ordinary nonproper direct-image stalks cannot be replaced by fibre cohomology. Section 3.4 supplies the additional boundedness and stabilization needed to turn this degreewise statement into the neighbourhood theorem. Characteristic zero is retained here; the positive-characteristic compact-support analogue is recalled in ITO20 Remark 4.6, and Ito's uniform endpoint in §3.4 uses the annular direct-image theorem instead (ITO20, Theorems 1.4 and 4.9).

**Checks.**

- For X = Spec O[T] and f = T the direct images are ℤ/n in degree 0 and 0 otherwise: constant on all of B(1).


*Needs:* §3.1; ClassicalAdicEtaleCohomology §§1.1–1.4; HUB98 Definition 1.4 and Theorem 2.1 in the stated setting.

### 3.3 Lütkebohmert's Riemann existence theorem near a puncture

For algebraically closed complete K of characteristic zero, a positive n invertible in K°, ε₁ ∈ |Kˣ| and a locally constant finite-type ℤ/n-module sheaf F on B(ε₁)∖{0}, prove that some smaller radius ε₀ and integer m ≥ 1 make F constant after pullback by T ↦ `T^m` from `B(ε₀^{1/m})∖{0}` to B(ε₀)∖{0}. The algebraic closure ensures the indicated root radius exists. No prime-to-p condition on m is imposed; characteristic zero makes this covering étale away from zero (LUT93, Theorem 2.2, cited through ITO20, §1.2, p. 3; ITO20 line 103).

A finite-type local system over the finite ring ℤ/n is trivialized by a finite étale cover. Riemann existence near a puncture dominates such a cover by a Kummer covering after shrinking. Prime-to-p tame radial covers alone do not supply the m divisible by p case. The Artin–Schreier example in the Checks excludes a characteristic-p extension of this assertion.

**Checks.**

- The Kummer covering T ↦ `T^m` itself is trivialised by itself `(ε_0` = `ε_1)`.

- Non-example in characteristic p: Artin–Schreier coverings `y^p` − y = `T^{−1}` of a punctured disc are not dominated by Kummer coverings on any smaller punctured disc.

*Needs:* ClassicalAdicEtaleCohomology §§1.4, 10.1–10.4; the full characteristic-zero punctured-disc covering theorem, including p-divisible degree.

### 3.4 Cohomological neighbourhoods: fixed locally constant sheaves and uniform constant coefficients

For algebraically closed complete nontrivially valued rank-one K of characteristic zero, X separated finite type over O = K°, Z ↪ X closed of finite presentation, n ≥ 1 invertible in O, and a constructible locally constant étale ℤ/n-module sheaf F on d(X̂), prove that some ε₀ ∈ |Kˣ| makes restriction `H^i(T(Z,ε),F)` → `H^i(d(Ẑ),F|_{d(Ẑ)})` bijective for all ε ≤ ε₀ and every i. Here ε₀ may depend on n and F. This is the locally constant-sheaf form of Huber's theorem; the closed pseudo-adic support uses the supplied comparison with the closed subspace (HUB98, Theorem 3.6; ITO20, Theorem 4.5(2), p. 21; ITO20 line 974).

For algebraically closed complete nontrivially valued rank-one K in either characteristic, the same separated finite-type X/O and finite-presentation immersion Z ↪ X, prove the full constant-coefficient endpoint: there exists one ε₀ ∈ |Kˣ| such that for every ε ≤ ε₀ in |Kˣ|, every positive n invertible in O and every i, restriction `H^i(T(Z,ε),ℤ/n)` → `H^i(d(Ẑ),ℤ/n)` is bijective. The radius is independent of both n and i (ITO20, Theorem 4.9, p. 22; ITO20 line 1003).

For the characteristic-zero constant-sheaf instance develop four proof inputs for K,X,Z,n, with `f^rig` as in §3.2 after the principal-ideal reduction. Call them blow-up descent, bounded direct-image amplitude, disc stabilization and closed-support continuity. They are targets of this subsection. For blow-up descent, take the proper surjective cover `Bl_Z(X)` ⊔ Z → X and its Čech nerve; prove that the natural augmented cohomology complexes for the inverse images of each tube and of the closed pseudo-adic support are quasi-isomorphisms. Prove finite-open-cover Čech gluing for the same complexes. This includes components of X contained in Z, where the blow-up alone need not be surjective. For bounded direct-image amplitude, prove that there are b ∈ ℕ and ε ∈ |Kˣ| such that `(R^j` `f^rig_*ℤ/n)|_{B(ε)}` = 0 for every j > b. Together with §§3.2–3.3 this gives one smaller radius and one Kummer cover for all its nonzero cohomology sheaves. For disc stabilization, prove that there is δ ∈ |Kˣ| such that for all ε′ ≤ ε ≤ δ in |Kˣ| restriction `RΓ(B(ε),Rf^rig_*ℤ/n)` → `RΓ(B(ε′),Rf^rig_*ℤ/n)` is a quasi-isomorphism, using the simultaneous Kummer trivialization and the actual extensions of these direct images across zero. This calculation includes covers of degree divisible by p. For closed-support continuity, prove for every i that the natural map `colim_{ε→0}` `H^i(T(Z,ε),ℤ/n)` → `H^i(d(Ẑ),ℤ/n)` is bijective, by verifying the shrinking-tube site and coefficient-descent hypotheses; equality of point sets alone does not establish this comparison. Apply Leray to identify the stabilized groups with the closed-subspace groups. These are the descent, amplitude, disc calculation and continuity steps in ITO20 §1.2, pp. 2–3 (ITO20 line 76); the simultaneous conclusion is ITO20 Theorem 4.5(2), not an inference from degreewise local constancy alone.

**Checks for the characteristic-zero theorem and its four proof inputs.**

- For X = Spec O[T], Z = V(T) and f = T, bounded direct-image amplitude has b = 0. On every smaller disc and on the origin, H⁰ = ℤ/n and Hⁱ = 0 for i > 0; every restriction sends 1 to 1. This computes disc stabilization and closed-support continuity. For the constant rank-two sheaf F, the corresponding groups are (ℤ/n)² and zero.
- For Z = X, Bl_Z(X) is empty, while Bl_Z(X) ⊔ Z → X contains the identity; its augmented Čech complex computes H*(d(X̂),ℤ/n) identically. For X the affine line above these are ℤ/n in degree zero and zero otherwise. The blow-up alone would give zero in degree zero.
- For two disjoint copies of the identity disc, R⁰f_*ℤ/n = (ℤ/n)² and Rʲf_*ℤ/n = 0 for j > 0, again b = 0. Disc restriction and its limit preserve (a,b) ↦ (a,b); finite-cover descent and the closed-support comparison give the same two summands. At n = 1 every group is zero.

The uniform proof uses the following additional targets in this subsection. They do not extend Lütkebohmert's characteristic-zero theorem.

**Sliced nearby cycles, base-change compatibility and unipotence.** Let f : X → S be a morphism of schemes and Λ a commutative ring. For a morphism U → S from a strictly local scheme with closed point u, a point η ∈ U and an algebraic geometric point η̄ over η, let U(η̄) be the strict localization, `j : X_{U(etabar)} → X_U` and `i : X_u → X_U`, and write `RPsi_{f_U,etabar} = i^* Rj_* j^*` : `D⁺(X_U,Λ)` → `D⁺(X_u,Λ)`, with the action of `Gal(κ(η̄)/κ(η))` through the automorphisms of U(η̄) over the local ring at η. This is notation for the shred of the general-base nearby-cycle functor of ClassicalAdicEtaleCohomology §5.4 for f_U at the specialization from η̄ to u; no second construction is made. Say that the sliced nearby cycles of f and K ∈ `D⁺(X,Λ)` are *compatible with any base change* if, for every local morphism q : V → U of strictly local S-schemes and every algebraic geometric point ξ̄ of V with image η̄ in U, the base-change map `q^* RPsi_{f_U,etabar}(K_U)` → `RPsi_{f_V,xibar}(K_V)` is an isomorphism. Say that they are *unipotent* if, for every strictly local U → S and every algebraic geometric point η̄ of U, each cohomology sheaf of `RPsi_{f_U,etabar}(K_U)` has a finite Galois-stable filtration on whose graded pieces the Galois group acts trivially (ITO20, §2.1 and Definitions 2.1–2.2, pp. 5–6; ITO20 line 189 and line 238).

Its API consists of the following facts.

- At a geometric point x̄ of X_u the stalk is `RΓ((X_U)_(xbar) ×_U U(etabar), K)`, Galois-equivariantly; this is the nearby-cycle stalk formula of ClassicalAdicEtaleCohomology §5.4 (ITO20 (2.1), p. 7; ITO20 line 317).
- Compatibility with any base change holds exactly when the general-base nearby-cycle base-change map of ClassicalAdicEtaleCohomology §5.4 is an isomorphism for every morphism T → S (ITO20, Remark 2.3, pp. 6–7; ITO20 line 252).
- Both properties pass from f to `f_{S′}` for every morphism S′ → S: a strictly local S′-scheme is a strictly local S-scheme and `(X_{S′})_U = X_U`.
- For an open immersion u : X → P over S and K on P, `RPsi` of f = g∘u and `K|_X` is the restriction to X_u of `RPsi` of g and K, because derived direct image commutes with restriction to an open subscheme.

**Checks.**

- For f = id_S and any n, `(X_U)_(xbar) = U`, so every stalk is `RΓ(U(etabar),ℤ/n)` = ℤ/n in degree zero with trivial Galois action. All base-change maps are identities; both properties hold.
- Let V be a complete strictly henselian discrete valuation ring with uniformizer π and residue characteristic p ≠ 2, and X = Spec V[t]/(t²−π) over S = Spec V. At the generic geometric point, `R⁰Psi(ℤ/n)` = (ℤ/n)² with Galois acting by the swap σ, and `(σ−1)^k = (−2)^(k−1)(σ−1)`. For odd n > 1 prime to p this is never zero, so unipotence fails; for n a power of 2 it vanishes for large k. Over V′ = V[π^(1/2)] only the generic fibre splits, into two points: the base change is V′[t]/((t − π^(1/2))(t + π^(1/2))), the two branches meet over the closed point, and the special fibre is κ[t]/(t²) with one point rather than κ × κ. The generic nearby-cycle stalk is still (ℤ/n)², now with trivial action for every n. Thus unipotence depends on n before base change, and the converse of the base-change stability bullet is false.
- For X empty, or n = 1, every complex is zero and both properties hold over every U.

**Adapted opens in a plurinodal alteration.** A nodal curve f : X → S is *adapted* to dense opens (X°, S°) if it is smooth over S° and some closed D ⊆ X, étale over S and inside the smooth locus, satisfies f⁻¹(S°) ∖ D = X° (ITO20, §3.1, p. 8; ITO20 line 381). For a proper surjective f : X → S of Noetherian excellent integral schemes with irreducible geometric generic fibre, and a dense open X° ⊆ X, refine the plurinodal alteration of ClassicalAdicEtaleCohomology §5.4 to integral alterations X′ → X and S′ → S with a factorization X′ = X_d → ⋯ → X_0 = S′ into nodal curves and dense opens X_i°. Require each stage to be adapted to (X_i°, X_(i−1)°), with this definition, and X_d° to lie in the inverse image of X°. The refinement retains the supplied factorization and adds control of the opens and étale markings (ITO20, Theorem 3.3 and §3.1, pp. 8–9; ITO20 line 381 and line 412). *Needs:* ClassicalAdicEtaleCohomology §5.4; SchemeAndStackFoundations §4.16 for alteration refinements; the adapted nodal-curve definition in this paragraph.

Its definition has the following API.

- Restricting S° to a smaller dense open and replacing X° by the corresponding complement of the marking preserves adaptedness.
- Base change preserves adaptedness whenever the inverse images of the specified opens remain dense; the marking remains closed, étale and inside the smooth locus.
- An isomorphism of the curve over S carrying X° and the marking to the specified opens and marking preserves adaptedness.

**Checks.**

- For X = ℙ¹_S and X° = (ℙ¹ minus {0,∞}) over a regular trait S, the identity alterations and the two marked sections give one nodal stage; the complement has exactly two sections, each of degree 1.
- For the generic marking x² = s over k[[s]], char k ≠ 2, the degree-two base alteration s = r² separates the two generic markings x = ±r. Their closures still meet at r = 0; a blow-up at that intersection separates their strict transforms. The two resulting sections have disjoint specializations. Base change alone does not supply the required étale marking.
- For X = S and X° = S the zero-stage factorization is the identity and the top open is S. For a nodal curve with a node over every point of S, the choice S° = S fails adaptedness: the singular locus has one point in each fibre and smoothness over S° fails.

**Compact-support stalk comparison with sliced nearby cycles.** For a strictly henselian microbial valuation ring R with fraction field L, a chosen separable closure of L, a separated finite-type f : X → Spec R and a torsion étale sheaf F on X, construct the Galois-equivariant isomorphism from the stalk of Rʲd(f)!Fᵃ at the corresponding closed geometric point of Spa(L,R) to Hʲ_c of the geometric special fibre with coefficients in the sliced nearby cycles of F. Require compatibility with specialization maps and coefficient homomorphisms. Compactify f, apply the supplied proper and formal nearby-cycle comparisons, and identify extension by zero on the special fibre; this extends the proper comparison to compact supports (HUB96, Theorem 5.7.8, as recalled and proved in ITO20, Theorem 5.3 and Proposition 5.5, pp. 27–30; ITO20 line 1198 and line 1299). *Needs:* ClassicalAdicEtaleCohomology §§4.5, 5.2–5.4, 8.3–8.5; EtaleCohomologyFoundations §§F.2, G.2; sliced nearby cycles above.

**Checks.**

- For f = id and F = ℤ/3 both degree-zero stalks are ℤ/3, higher groups vanish, and the comparison sends 1 to 1 with trivial action.
- For f a disjoint union of two identity maps the stalk and special-fibre group are (ℤ/3)². The two characteristic functions map to (1,0) and (0,1); a summation map would lose one dimension.
- For the affine-line projection with coefficients ℤ/n invertible in R, compact-support cohomology of the special fibre is ℤ/n(−1) in degree 2 and zero otherwise. The analytic lower-shriek stalk has these same values; ordinary degree-zero fibre cohomology ℤ/n cannot replace it.

**Coefficient-uniform nearby-cycle alteration.** Let S be a Noetherian excellent scheme and f : X → S separated of finite type. Prove that there is an alteration S′ → S, proper surjective, generically finite and sending generic points to generic points, such that for every positive n invertible on S the sliced nearby cycles of `f_{S′}` and ℤ/n are compatible with any base change and unipotent. One S′ serves every n (ITO20, Corollary 3.17, pp. 17–18; ITO20 line 803).

The route compactifies f = g∘u with g proper and u an open immersion, uses the restriction bullet above, and proves the proper case for every complex with constructible ℤ/n-cohomology that is locally unipotent along a fixed stratification 𝒳 of X (ITO20, Theorem 2.7, p. 8; ITO20 line 359). Here a sheaf is *locally unipotent along* a finite partition 𝒳 = {X_α} of X into reduced locally closed subschemes if, for every strictly local U → X and every α, its pullback to `U ×_X X_α` has a finite filtration with constant graded pieces (ITO20, Definition 2.5, pp. 7–8; ITO20 line 348). The induction uses de Jong's plurinodal alteration in its adapted form, with a prescribed dense open X° and an étale marked boundary at every stage: ClassicalAdicEtaleCohomology §5.4, the plurinodal alteration theorem, supplies the plurinodal factorization, and the adapted-open plurinodal refinement of §3.4 supplies the adapted opens and the containment of the top open in the inverse image of X° (ITO20, Theorem 3.3, p. 9; ITO20 line 412). It also uses the following propagation statement, a target of this subsection. Let f : X → S be a flat projective morphism of Noetherian schemes whose geometric fibres are connected reduced curves with at most ordinary double points, smooth over a dense open S° ⊆ S with S° normal. Let D ⊆ X be a closed subscheme étale over S inside the smooth locus, and put X° = f⁻¹(S°) ∖ D with open immersion u. Then for n invertible on S and every locally constant constructible ℤ/n-sheaf L on X° such that u!L is locally unipotent along {X°, X∖X°}, every `R^i f_*(u_! L)` is locally unipotent along {S°, S∖S°} (ITO20, §3.1 and Proposition 3.1, p. 8, recalling Orgogozo; ITO20 line 378 and line 388). The truncated induction on base-change and unipotence defects follows ITO20, Definition 3.4 and Lemmas 3.5–3.16, pp. 9–17 (ITO20 line 429). The stratification and f determine S′; the coefficient order does not enter its choice. *Needs:* the sliced nearby cycles above; ClassicalAdicEtaleCohomology §5.4 (oriented products, the nearby-cycle stalk formula, the plurinodal alteration theorem, the uniform amplitude bound); the adapted-open plurinodal refinement of §3.4; EtaleCohomologyFoundations §§F.2, G.2 (proper base change, `nagataCompactification`); SchemeAndStackFoundations §§0.9, 4.16 for Noetherian approximation and alterations.

The locally unipotent stratified condition has this API.

- A sheaf constant on each strict-local stratum has a one-step unipotent filtration on that stratum.
- Finite direct sums preserve the condition, by combining the constant-graded filtrations. In an exact sequence whose three restrictions to every strict-local stratum are locally constant, subobjects, quotients and extensions preserve unipotence by intersecting, projecting and concatenating the filtrations.
- Pullback preserves the condition along the inverse-image partition, with reduced structures on its locally closed strata.

**Checks.**

- For f = id_S, S′ = S works for every n, by the first Check above.
- For a constant rank-two ℤ/3-sheaf the filtration by the first coordinate has two trivial rank-one graded pieces. For the zero sheaf the empty filtration has length 0. A quadratic swap over ℤ/3 instead has eigenvalues 1 and −1, so cannot have only trivial graded pieces.
- In the t² = π example, S itself fails for every odd n > 1 prime to p and succeeds for powers of 2. The single alteration Spec V[π^(1/2)] → Spec V of degree 2 works for every n prime to p. The pushforward of ℤ/n along Spec V[π^(1/2)] → Spec V is locally unipotent along {η,s} exactly when n is a power of 2, for the same swap computation.
- Per-coefficient modifications do not suffice: the modification of ClassicalAdicEtaleCohomology §5.4 may depend on the coefficient sheaf, and alterations of degrees tending to infinity have no common refinement of finite degree. The theorem asserts one finite alteration. For X empty or n = 1 every S′ works.
- Adaptedness, positive case: let S = Spec k[[s]], S° = Spec k((s)), X = ℙ¹_S and D the union of the sections 0 and ∞. For X° = ℙ¹_(S°) minus those two sections the curve X → S is adapted to (X°, S°): it is smooth everywhere, and D is a disjoint union of two sections, étale over S and inside the smooth locus.
- Adaptedness fails when the marking ramifies. Assume char k ≠ 2 and keep X, S, S°, but remove from the generic fibre the divisor x² = s. A closed D with f⁻¹(S°)∖D = X° contains the closure Spec k[[s]][x]/(x² − s) ≅ Spec k[[x]] of that divisor, which is ramified over s = 0 with special fibre k[x]/(x²). If D were étale over S, it would be finite étale (it is proper), the closure would be a one-dimensional integral closed subscheme of a component Spec R with R a finite étale local k[[s]]-domain, hence equal to it, and so étale: a contradiction. The pair is not adapted, although the curve is smooth over S°.
- Adaptedness fails when the curve is singular over S°. Let C be a connected projective nodal curve over k with a node, X = C × S, S° = S and X° = X. The empty D is étale and f⁻¹(S°)∖D = X°, but X → S is not smooth at the node over S°. The three Checks realise the truth values (smooth over S°, étale marking) = (true, true), (true, false) and (false, true).

**Adapted constant coefficients over an analytic curve.** Let K be algebraically closed complete nontrivially valued of rank one, in either characteristic, with O = K°. Consider Y = Spec A integral affine of finite type over O with Y_K smooth of dimension one, f : X → Y separated of finite type, and π : Z → Y proper surjective with Z integral, Z_K smooth and π_K finite. For n invertible in O, a ℤ/n-sheaf F on X is *adapted* to (f,π) if its analytic pullback F^a to d(X̂) is Huber-constructible and the sliced nearby cycles of f_Z and F_Z are compatible with any base change and unipotent (ITO20, Definition 6.5, pp. 32–33; ITO20 line 1455). Prove the following three statements.

- If f is of finite presentation, there is π as above such that ℤ/n is adapted to (f,π) for every positive n invertible in O. Descend f to a finitely generated `ℤ_(p)`-subalgebra, which is excellent; apply the coefficient-uniform alteration there; base change to Y, keep a dominating component, normalize its generic fibre and extend by a proper model. Base-change stability of the two properties carries them along (ITO20, Proposition 6.6 and proof, p. 33; ITO20 line 1481).
- For F adapted to (f,π), every `d(π)^* R^i d(f)_! F^a` is tame at each point of d(Ẑ) that has a proper generalization, in the sense of the annular target below. The stalk there is `H^i_c` of the special fibre with coefficients in the sliced nearby cycles, Galois-equivariantly. It is a finite ℤ/n-module on which Galois acts through a finite group, and unipotence makes the order of that group a product of primes dividing n (ITO20, Proposition 6.7(1) and Theorem 5.3, pp. 27, 33–34; ITO20 line 1502 and line 1198).
- For a K-rational point y of d(Ŷ) there is an open V ∋ y such that, for every adapted F with n invertible in O, every `d(π)^* R^i d(f)_! F^a` is overconvergent on d(π)⁻¹(V). Base-change compatibility identifies the specialization maps over a fibre of the specialization map λ with isomorphisms of compact-support nearby-cycle cohomology. Since d(π) is finite, a neighbourhood of y has preimage inside the union of those fibres through the points over y (ITO20, Propositions 5.5 and 6.7(2), pp. 29–30, 34–35; ITO20 line 1299 and line 1518).

*Needs:* the coefficient-uniform alteration; the compact-support nearby-cycle comparison of §3.4; ClassicalAdicEtaleCohomology §§1.4, 3.2, 4.5, 8.3–8.4 (constructibility, overconvergence, microbial bases, lower-shriek base change); AdicSpacesPartIII §R2.8 for `d(Ẑ) ≅ d(Ŷ) ×_Y Z` with π proper; SchemeAndStackFoundations §0.9 and EtaleCohomologyFoundations §G.2 for descent and proper models.

**Checks.**

- For Y = Spec O[T], f = id and π = id, ℤ/n is adapted for every n; `R⁰d(f)_!ℤ/n` = ℤ/n is constant, hence tame and overconvergent everywhere.
- Let the residue characteristic avoid 2 and 3, take f : Spec O[S] → Spec O[T], T ↦ S³, and n = 2. With π = id the nearby cycles at T = 0 carry the cyclic permutation of order 3 on (ℤ/2)³, which is not unipotent since 3 is odd, so ℤ/2 is not adapted. With π = f itself, `X ×_Y Z` is three branches S′ = ζS meeting over S = 0, each mapping isomorphically to Z. The action is trivial and ℤ/n is adapted for every invertible n. The pulled-back direct image is constant of rank 3 on the punctured disc and has rank 1 at the origin, where the branches meet.
- Over K of characteristic 2, let X = Spec O[w,(1−w)⁻¹] map to Spec O[T] by T = w²/(1−w), and n = 3. Over T ≠ 0 this is the Artin–Schreier cover u² − u = T⁻¹ with u = 1/w. The model in w is needed because the formal completion imposes |w| ≤ 1; the model in u would impose |u| ≤ 1, which forces |T| = 1. With π = id the sheaf `R⁰d(f)_!ℤ/3` cannot be tame near 0: tameness and the tame annular trivialization below would give an odd-degree Kummer trivialization, which the computation there excludes. So ℤ/3 is not adapted to (f,id). For π the normalization of Spec O[T] in the function field of X, the pulled-back cover splits into two sheets and the pullback is constant (ℤ/3)² on the punctured disc. The finite Galois factor of the uniform annular target is needed for exactly this case.

**Finite étale covers of small annuli and tame annular trivialization.** Let K be algebraically closed complete nontrivially valued of rank one, in either characteristic, with B(1)* = B(1)∖{0} and annuli B(a,b) = {a ≤ |T| ≤ b} for a < b ≤ 1 in |Kˣ|. A Kummer covering of degree m, for m invertible in K, is T ↦ Tᵐ from `B(a^(1/m),b^(1/m))` to B(a,b). For a one-dimensional smooth adic space W over Spa(K,O), a point x with a proper generalization, and an étale sheaf F, say F is *tame at x* if the Galois group of a separable closure of the henselized completed residue field `k(x)^(∧h)` acts on the geometric stalk through a finite group of order invertible in O (ITO20, Definition 6.1, pp. 31–32; ITO20 line 1413). The Kummer-cover and tame-sheaf definitions have the following API.

- A Kummer cover of positive degree m invertible in K is finite étale of degree m on the annulus; its deck transformations multiply the source coordinate by μ_m(K).
- Composing Kummer covers of degrees m and r gives degree mr and the same root-radius formula, with source radii a^(1/(mr)) and b^(1/(mr)). The degree-one cover is the identity.
- The stalk of a tame sheaf and each of its subquotients have finite monodromy of order invertible in O. Restriction to a subannulus and pullback along a finite étale map preserve tameness, since the stalk monodromy becomes a subgroup or quotient of the original finite image.
- Constant finite sheaves are tame with image of order 1. Finite sums and tensor products of tame ℤ/n-module sheaves are tame: the joint image is a subgroup of the product of the finite prime-to-residue image groups.

Prove the following four statements.

- Let f : W → B(1)* be finite étale, dominated by a finite étale Galois cover of degree D invertible in K; in characteristic zero every finite étale cover has such a domination. There is ε ≤ 1 in |Kˣ| such that for all a < b ≤ ε, f⁻¹(B(a,b)) is a finite disjoint union of annuli B(cᵢ,dᵢ) with cᵢ < dᵢ ≤ 1. In characteristic zero ε can be chosen so that every component maps by a Kummer covering (ITO20, Theorem 6.2, p. 32, proved in Appendix A, pp. 46–52; ITO20 line 1427 and line 2338). The route uses Ramero's discriminant function of a finite étale cover of an annulus: it is continuous, piecewise linear and convex with integer slopes, and the functions on the annuli glue to a function of −log|T| on [0,∞) (ITO20, Theorem A.6, p. 49; ITO20 line 2191). At a Gauss point the base valuation is nondiscrete. For the finite free integral closure in a completed valued-field factor of degree r, Ramero's estimate bounds its discriminant below by `|r|^r` (RAM05, Lemma 2.1.10(ii), p. 193; RAM05 line 1020). Apply it to the Galois cover: the field-factor degrees divide D, hence are invertible in K. Their finite number gives a finite bound independent of the radius. The discriminant function is nonnegative; a bounded nonnegative convex function on a half-line with integer slopes is constant near infinity. Linearity gives annular components (ITO20, Proposition A.8, pp. 51–52; ITO20 line 2279), and passage to intermediate covers gives the assertion for f. In characteristic zero the Kummer refinement also follows from the punctured-disc covering theorem of §3.3. In positive characteristic, invertibility of the total degree alone does not justify this bound: a field factor can have degree divisible by the characteristic. The algebraic-cover statement below includes wild ramification without this domination hypothesis.
- Algebraic covers, in either characteristic. Let φ : W̄ → Ȳ be a finite morphism of smooth proper connected curves over K, y ∈ Ȳ(K), and V an open disc around y in the analytification of Ȳ with coordinate T, T(y) = 0, identified with B(1), such that φ is étale over V∖{y}. There is ε ≤ 1 in |Kˣ| such that for all a < b ≤ ε, φ⁻¹(B(a,b)) is a finite disjoint union of annuli, one in a small disc around each point y′ over y, mapping to B(a,b) with degree the ramification index e(y′) of φ at y′. When every e(y′) is invertible in K these components are Kummer coverings. This is the form consumed by the uniform annular direct-image target below. Route: at y′ choose an algebraic uniformizer S, so that T∘φ = `S^e(y′)`·u with u a unit of the local ring at y′. A uniformizer at a smooth K-point is a coordinate on a small closed disc D(y′) around y′, and after shrinking D(y′) the unit u has constant norm |u(y′)| on it. Hence |T∘φ| = |u(y′)|·`|S|^e(y′)` on D(y′). Finiteness of φ makes the preimages of the discs B(ε) a neighbourhood basis of the finite fibre over y, so for small ε they lie in the union of the D(y′). The preimage of B(a,b) in D(y′) is then the annulus `(a/|u(y′)|)^(1/e) ≤ |S| ≤ (b/|u(y′)|)^(1/e)`, whose radii lie in |Kˣ| because K is algebraically closed. When e = e(y′) is invertible in K, shrink D(y′) until u/u(y′) has an analytic e-th root with value 1 at y′, by the étale implicit-function theorem (or the convergent binomial series in characteristic zero), and replace S by S·(u/u(y′))^(1/e)·c with `c^e = u(y′)`; then T∘φ is the e-th power of the new coordinate. No discriminant bound is used.
- Let F be a locally constant étale sheaf with finite stalks on B(a,b), a < b ≤ 1, tame at every point having a proper generalization. For every t ∈ |Kˣ| with a/b < t² < 1, the restriction of F to B(a/t,tb) becomes constant after a Kummer covering of degree m invertible in O (ITO20, Theorem 6.3, p. 32, proved pp. 53–54; ITO20 line 1439 and line 2391). Route: choose a connected Galois cover trivializing F with faithful action on global sections. Tameness makes every stabilizer order invertible in O, which forces a constant discriminant (ITO20, Lemma A.11, p. 53; ITO20 line 2382). The Galois group is then cyclic of order m, and the Kummer isomorphism `O(A)^×/m ≅ H¹(A,μ_m)` of ClassicalAdicEtaleCohomology §10.3 identifies the torsor with a union of Kummer coverings.
- On an annulus, a Huber-constructible ℤ/n-sheaf that is overconvergent is locally constant (Huber's Lemma 2.7.11 as applied in ITO20, proof of Theorem 6.10, p. 37; ITO20 line 1662; HUB96).

*Needs:* ClassicalAdicEtaleCohomology §§1.4, 3.2, 10.1–10.3 (finite étale algebras over affinoids, overconvergence, radial regions, tame Galois covers and `annulusKummer`); AdicSpacesPartII §R0.19 for the constructible topology and §§R1.3–R1.6 for the analytification of the finite morphism φ.

**Checks.**

- For f the identity of B(1)* every ε works with one component, the constant sheaf has monodromy image of order 1, and the degree-one Kummer cover fixes the coordinate. Composing T ↦ T³ and S ↦ S² gives T ↦ T⁶ and preimage radii a^(1/6), b^(1/6), whenever 6 is invertible in K. The map T ↦ Tᵐ with m invertible in K has preimage `B(a^(1/m),b^(1/m))`, one Kummer component. In characteristic zero this includes m = p.
- In characteristic 2 put w = 1/u on u² − u = T⁻¹. Then T = w²/(1−w), with |1−w| = 1 for |w| < 1, so |T| = |w|². The preimage of B(a,b), b < 1, is the single annulus `B(a^(1/2),b^(1/2))`, and dT/dw = w²/(1−w)² ≠ 0 there. It has degree 2, which is not invertible in K, so it is not a Kummer covering. The decomposition holds; the characteristic-zero refinement fails.
- Negative control for the discriminant bound, with the same cover. At the Gauss point |T| = r < 1 choose c ∈ K with |c|² = r and put z = w/c. Then z² + (T/c)z + T/c² = 0 with |T/c| = r^(1/2) < 1 and |T/c²| = 1; its reduction z² + s over the residue field κ(s) is irreducible, so 1, z is an integral basis and the trace-form discriminant (T/c)² − 4T/c² = (T/c)² has norm r. The discriminant function takes the value −log r at −log r: it is unbounded, with slope 1, at fixed degree 2. Ramero's estimate with d = 2 = 0 in K gives only norm at least 0, so the first statement does not cover this cover. The algebraic statement does: the cover is w ↦ w²/(1−w) on ℙ¹, with ramification index 2 at w = 0 and u = 1/(1−w), |u(0)| = 1, giving the annulus `B(a^(1/2),b^(1/2))` of the preceding Check.
- In characteristic 2, add one identity sheet to the preceding degree-two Artin–Schreier cover. The total degree is 3, invertible in K, but at |T| = r its integral algebra has factors of degrees 2 and 1 and discriminant norm r·1 = r. A bound using only |3|³ = 1 would demand r ≥ 1, false for r < 1. The Galois domination hypothesis excludes this example, whose nontrivial monodromy has order 2.
- For the same cover and odd m, suppose `g² − g = S^(−m)` had a solution on an annulus. Coefficients in characteristic 2 give `g_(−m) = 1` and `g_(−2^j m) = g_(−2^(j−1) m)²` = 1 for all j ≥ 1, so g diverges on every annulus with radii below 1. Hence the pulled-back cover stays connected, and the rank-two direct image of ℤ/3 is not trivialized by any odd-degree Kummer covering. By the tame trivialization statement it is not tame at some point with a proper generalization: the tameness hypothesis cannot be dropped. The direct image of ℤ/n along a Kummer covering of degree m invertible in O is tame and is trivialized by that covering.

**Uniform annular direct images.** For algebraically closed complete nontrivially valued rank-one K in either characteristic and separated finitely presented f : X → Spec O[T], suppose d(f) is smooth over B(η)∖{0} for some η ∈ |Kˣ| with η ≤ 1. Prove that one δ ≤ η works for every positive n invertible in O: every Rʲd(f)!ℤ/n is locally constant of finite type on B(δ)∖{0}, and for each 0 < a < b ≤ δ in |Kˣ| there is a finite étale map h from an annulus to B(a,b), factoring as a Kummer covering of degree invertible in O followed by a finite Galois étale map, that makes all these sheaves constant. The cover may depend on n,a,b; δ does not. In characteristic zero the second factor can also be chosen Kummer (ITO20, Theorem 1.4, pp. 3–4; ITO20 line 124). Route: take π from the adapted-coefficient target. Shrink the disc until the separable Galois part of Z_K is finite étale over it. That part is the normalization of Y_K in the separable closure of its function field, so its smooth projective completion maps finitely to that of Y_K, and the algebraic form of the annular decomposition applies to it, with Kummer components in characteristic zero. Shrink again into the overconvergence neighbourhood. On each annular component the pulled-back direct image is constructible by ClassicalAdicEtaleCohomology §10.5, overconvergent and therefore locally constant, and tame; the tame annular trivialization finishes (ITO20, Theorem 6.10 and proof, pp. 35–37; ITO20 line 1586 and line 1606). *Needs:* §3.1; the sliced nearby cycles, coefficient-uniform alteration, adapted-coefficient and annular-cover targets above; the compact-support nearby-cycle comparison of §3.4; ClassicalAdicEtaleCohomology §§1.1–1.5, 3.2, 8.3–8.5, 10.1–10.5; SchemeAndStackFoundations §0.9 for finite-stage descent.

**Checks.**

- For f the identity disc, R⁰d(f)!ℤ/n = ℤ/n and all other direct images are zero. Take δ = η = 1 and h = id simultaneously for every invertible n.
- For T ↦ Tʳ with r invertible in O, the punctured-disc direct image has rank r in degree zero and cyclic permutation monodromy; its own Kummer pullback makes it constant. For r = 3 in residue characteristic 2 the rank is 3, including n = 3; no division by the cover degree is used.
- In characteristic 2 the étale cover u²−u = T⁻¹ over an annulus has wild monodromy of order 2. Its rank-two ℤ/3 direct image becomes constant after that Galois cover, while prime-to-2 Kummer covers alone cannot remove the order-two wild inertia. At n = 1 all direct images vanish.

**Annular sheaf comparison.** With K and O as in the uniform statement, use the supplied annuli B(a,b) and the pseudo-adic strict radial region D(b) = {|T| < b}, with interior D(b)° from ClassicalAdicEtaleCohomology §§10.1–10.2. Let a, b ∈ |Kˣ| satisfy a < b ≤ 1. For a locally constant constructible ℤ/n-module sheaf F on B(a,b), n invertible in O, assume a finite étale cover from an annulus, a composition of finite Galois étale maps, makes F constant. Prove that Hⁱ_c(B(b)∖B(a),F) and Hⁱ_c(D(b)∩B(a,b),F) are zero, and that restriction `H^i(B(a,b),F)` → `H^i(D(b)°∩B(a,b),F)` is bijective for every i. If F on B(δ)∖{0} has this property on every subannulus, prove Hⁱ_c(D(δ)∖{0},F) = 0 for every i. These statements use pseudo-adic supports, rather than replacing them by their rank-one points (ITO20, Lemma 6.11, pp. 37–38; ITO20 line 1673). *Needs:* ClassicalAdicEtaleCohomology §§1.1–1.5, 8.3–8.5, 10.1–10.4 for finite-cover descent, continuity and the constant annulus calculation.

**Checks.**

- For F = ℤ/n constant, both annuli in the restriction have H⁰ = ℤ/n, H¹ = ℤ/n(−1), and Hⁱ = 0 for i ≥ 2. Restriction preserves the Kummer class of T; both compact-support expressions in the target are zero in every degree.
- For F = (ℤ/n)² the same restriction is identity on (ℤ/n)² in degree zero and on (ℤ/n(−1))² in degree one; the indicated compact-support groups are again zero. This excludes a comparison that kills a nontrivial constant summand.
- Pull back the rank-three direct image of T ↦ T³ in residue characteristic 2 and with n = 3 to its trivializing annulus. Radial restriction there is identity on three degree-zero generators and on their three Kummer classes. Finite-cover descent preserves the comparison despite 3 = 0 in ℤ/3; averaging by the degree would be invalid.
- Non-example for equal radii: the zero-width region a = b = 1 is the affinoid {|T| = 1}, connected, so H⁰ of the constant sheaf ℤ/3 on it is ℤ/3, while D(1)° ∩ {|T| = 1} is empty and has H⁰ = 0. Restriction cannot be bijective, so the strict inequality a < b is needed.

**Smooth nonproper annular duality.** Let K be algebraically closed complete nontrivially valued of rank one, O = K°, n invertible in O, and g : W → B(a,b) smooth separated quasi-compact of pure relative dimension N, with W analytic of finite type over Spa(K,O) and a < b ≤ 1. If every Rⁱg!ℤ/n is locally constant constructible, prove that the trace gives Rʲg*(ℤ/n(N)) ≅ Hom(R^(2N−j)g!ℤ/n, ℤ/n) for every j, and the same comparison for the base change g′ over the pseudo-adic subspace D(b) ∩ B(a,b). The twist is on the ordinary-cohomology side. Use the supplied normalized smooth trace and étale-local duality, with the radial support comparison, to obtain this relative statement (HUB96, Corollary 7.5.5, as used in ITO20, proof of Lemma 7.1, pp. 45–46; ITO20 line 2009 and line 2038). *Needs:* ClassicalAdicEtaleCohomology §§8.3–8.5, 9.4–9.7; annular sheaf comparison above; EtaleCohomologyFoundations §F.6 for the algebraic trace normalization.

**Checks.**

- For g = id, N = 0, both degree-zero sheaves are ℤ/n, the pairing is (x,y) ↦ xy, and the comparison sends 1 to the functional y ↦ y; every other degree is zero. Restriction to the specified pseudo-adic subspace has the same values.
- For g : ℙ¹ × B(a,b) → B(a,b), N = 1, ordinary cohomology with twist (1) is ℤ/n(1) in degree 0 and ℤ/n in degree 2. Lower-shriek cohomology is ℤ/n in degree 0 and ℤ/n(−1) in degree 2. Their indicated duals are ℤ/n(1) and ℤ/n, respectively. The hyperplane class has trace +1.
- For two disjoint copies of this projection, each nonzero sheaf has rank 2 and the trace pairing has matrix diag(1,1). It remains perfect at n = 2; averaging by the number of components would divide by zero.

**Uniform reduction, bounds and smooth principal case.** With K and O as in the uniform statement, for separated finite-type X/O and a finite-presentation closed Z, prove a cohomological bound N independent of ε and of invertible n for the ordinary cohomology of T(Z,ε), of the closed support d(Ẑ), and of the strict tubes and their interiors: all these groups must vanish for i ≥ N. Establish proper-surjective Čech descent and finite-open gluing for the restriction cones in these comparisons, retaining the same n-uniform quantifiers. A proper surjection P → Q of finite-type analytic adic spaces must give cohomological descent after every pseudo-adic base change. For locally closed supports U ↪ V in Q, let C be the cone of restriction RΓ(V,ℤ/n) → RΓ(U,ℤ/n), and Cₘ the corresponding cone on level m of the Čech nerve. For any integer r ≥ −1, if Hʲ(Cₘ) = 0 for j ≤ r−m at every level 0 ≤ m ≤ r+1, prove Hʲ(C) = 0 for j ≤ r. These are the analytic descent and truncation inputs of ITO20 Proposition 7.2, Corollary 7.4 and Lemma 7.6, pp. 40–43 (ITO20 line 1774, line 1813 and line 1901).

For Z = V(f) with d(f) smooth on a sufficiently small punctured disc, derive one radius for all n and i from the uniform annular direct images, their annular sheaf comparisons, smooth nonproper Poincaré duality for the components g of the preimage of each annulus (the smooth nonproper annular duality of §3.4), Leray and closed-support continuity; this is the smooth principal comparison (ITO20, Lemma 7.1 and its proof, pp. 39, 44–46; ITO20 line 1738 and line 1973). Reduce general Z to this case using the supplied blow-ups and alterations and the owned descent for Bl_Z(X) ⊔ Z → X. The alteration is de Jong's theorem over a field, SchemeAndStackFoundations §4.19 `alteration_theorem`. In characteristic zero apply it to the integral generic fibre over K. In characteristic p apply it to the reduced generic fibre over the perfect field K(T^(1/p^∞)), where its regular output is smooth by SchemeAndStackFoundations §4.13 `regularLocus_eq_smoothLocus`; descend the alteration to some finite stage K(T^(1/p^N)) (SchemeAndStackFoundations §0.9) and extend it by a proper model. The finite extension and the model are retained. This is a finite purely inseparable change of the principal parameter, `f = (f')^{p^N}`; verify `T(V(f'),epsilon) = T(V(f),epsilon^{p^N})` and the analogous strict-tube formula, with identical étale closed supports. Degreewise descent and the bound N give one radius in all degrees (ITO20, Lemmas 7.5–7.7, pp. 41–44; ITO20 line 1846 and line 1928). *Needs:* §3.1 and the uniform annular and sheaf-comparison targets above; ClassicalAdicEtaleCohomology §§1.1–1.5, 8.3–8.5, 9.6–9.7, 10.1–10.4; the smooth nonproper annular duality of §3.4 for the smooth nonproper duality; SchemeAndStackFoundations §§0.9, 0.23a, 4.11, 4.13, 4.16, 4.19 for approximation, purely inseparable invariance, blow-ups, smoothness of regular schemes over a perfect field, the alteration calculus and de Jong's existence theorem; EtaleCohomologyFoundations §G.2 `nagataCompactification` for the proper model over `Spec O[T^(1/p^N)]`. The scheme constructions are imported; their analytic uniform comparison is the target here.

**Checks.**

- For f = T, δ = 1 works: every invertible ℤ/n gives H⁰ = ℤ/n on the disc and on the origin and no higher groups. One may take N = 1 for these ordinary groups. At Z = X the descent cover contains the identity and its comparison cone is zero in every degree.
- In characteristic 2, f = T² is not smooth on any punctured disc. Set f′ = T. At ε = |t|² < 1, both T(V(T),ε) and T(V(T²),ε²) are {|T| ≤ |t|²}; their closed supports both have H⁰ = ℤ/n, Hⁱ = 0 for i > 0 and odd n. Reversing the exponent would give the wrong radius.
- For the empty Z, T(Z,ε) is empty at ε < 1 and every group is zero for all n. With n = 1 the groups and all restriction cones are zero for arbitrary Z; this permits the zero coefficient ring without a nonzero-module assumption.

**Checks for the uniform endpoint.**

- Over the completed algebraic closure of 𝔽₂((t)), take X = Spec O[T], Z = V(T) and ε₀ = 1. For every ε ≤ 1 and every odd n, H⁰ on the tube and origin is ℤ/n, restriction is identity and Hⁱ = 0 for i > 0. The same radius works for all odd n.
- In mixed characteristic (0,p), n = p is excluded: H¹(B(1),ℤ/p) has infinite dimension, while H¹({0},ℤ/p) = 0. Every rescaled positive-radius disc has the same obstruction (ITO20, Remark 4.7, p. 22; ITO20 line 987).
- For Z = V(T²), the tube radius is `epsilon^{1/2}` over algebraically closed K, and for Z = V(T) it is ε. Their closed supports have the same étale cohomology; at 0 < ε < 1 the tubes differ, yet ε₀ = 1 works for both and all invertible n.

*Needs:* §3.1 and the owned uniform annular direct images, annular sheaf comparison, uniform reduction/bounds and smooth principal comparison above. The characteristic-zero locally constant-sheaf target uses §§3.2–3.3, the four fixed-coefficient inputs and finite étale local trivialization with descent; it is independent of the positive-characteristic uniform route.

### 3.5 Pullback along a morphism of sites respects cup products (Lemma 9.8)

For a morphism of sites f : T₁ → T₂ and a constant commutative coefficient ring A, use exact inverse image on A-module sheaves and its identification f*A ≅ A. Identify cohomology with Ext from the coefficient unit and its cup product with Yoneda composition. Deduce that f* preserves products and the degree-zero unit, and that its inverse also preserves products whenever f* is bijective degreewise. This is Scholze's Lemma 9.8 in its geometric application, using the Mathlib identity in the supplier contract rather than a second abstract composition theorem (SCH12, Lemma 9.8 and following paragraph, p. 310; SCH12 line 2622).

Apply the exact-functor composition identity to inverse image, then transport the coefficient unit. The module-sheaf/abelian-sheaf cohomology comparison of ClassicalAdicEtaleCohomology §1.1 identifies this Ext product with the cup product used by duality. The inverse of a bijective multiplicative map is multiplicative by taking preimages of two classes. This supplies the product compatibility for every arrow of §4.2, including the reversed restriction isomorphism.

**Checks.**

- For restriction from a closed disc to its origin with invertible coefficients ℤ/n, both sides of the product identity on a,b ∈ ℤ/n are ab, and both units are 1. With n = 3 and a = b = 2 the product is 1; the inverse comparison also sends that product to 1.

- Over ℤ/2, the zero endomorphism of the degree-zero coefficient ring sends 1 to 0; it fails the unit law and cannot replace the pullback along the identity of a nonempty site.

*Needs:* Mathlib Ext composition and exact-functor map; ClassicalAdicEtaleCohomology §1.1; EtaleCohomologyFoundations §F.6 (agreement of cup products).

### 3.6 A Galois-stable neighbourhood with the cohomology of the subvariety, uniformly in invertible coefficients

Let K be complete nontrivially valued rank-one nonarchimedean in either characteristic, C its completed algebraic closure, and 𝒳 proper of finite presentation over K°. Let 𝒵 ↪ 𝒳 be closed of finite presentation with generic fibre Y ⊆ X. Prove that one ε ∈ |Kˣ| works for every ε′ ≤ ε in |Kˣ|, every i and every positive n invertible in K°: `Ỹ_{ε′}` = T(𝒵,ε′) is a quasicompact open neighbourhood of `Y^ad` over K and restriction `H^i(Ỹ_{ε′,C},ℤ/n)` → `H^i(Y_C^ad,ℤ/n)` is `G_K-equivariant` and bijective. The maps identify graded cohomology rings, preserve the unit and commute with coefficient reductions. In particular the same radius works for all ℓ-power coefficients for every ℓ invertible in K° (ITO20, Theorem 4.9 and Corollary 4.11, pp. 22–23; ITO20 line 1003 and line 1030; SCH12, proof of Theorem 9.6, p. 309; SCH12 line 2601).

Apply §3.4 over C and choose a smaller radius in |Kˣ|, using a power of any element with norm strictly between zero and one. Base change of the ideal-defined tubes gives `G_K-stability`. The inclusion is equivariant, §3.5 gives multiplicativity in both directions, and coefficient reduction is natural. Specializing n = ℓᵐ gives the all-power comparison directly; the coefficient exact sequences also recover it from n = ℓ at a fixed radius.

**Checks.**

- For 𝒳 = 𝒵 the neighbourhood is all of `X^ad` and restriction is identity for every n. For a geometric point H⁰ = ℤ/n, Hⁱ = 0 for i > 0 and the unit maps to 1.
- For the proper model ℙ¹ over the valuation ring of 𝔽₂((t)) and its zero section, sufficiently small tubes are discs: over C the groups are ℤ/n in degree zero and zero otherwise for every odd n at the same radius. The unit and products have coordinates 1 and ab on both sides.
- An arbitrary open neighbourhood need not work: for a smooth plane cubic Y ⊆ ℙ², H¹(ℙ²_C) = 0 while H¹(Y_C) has dimension 2 over ℚ_ℓ. Thus taking the whole ambient space loses the degree-one comparison even when the characteristic and coefficients are permitted.

*Needs:* §§3.1, 3.4, 3.5 (cup compatibility); AdicSpacesPartIII §R2.8; coefficient long exact sequences.

### Examples

For X=Spec O[T] and Z=V(T), T(Z,ε) is the rational closed disc |T|≤ε. At positive invertible n its cohomology is ℤ/n in degree zero and zero in higher degrees, as at the origin. For Z=V(T²), the tube has radius `ε^{1/2}` when the root radius exists, although the closed analytic subspace has the same étale cohomology as the reduced origin. Thus nilpotent thickening changes a fixed-radius tube. At n=p over mixed-characteristic algebraically closed K, H¹ of every rescaled disc with ℤ/p coefficients is infinite-dimensional and that of the origin is zero, so shrinking cannot repair the missing invertibility hypothesis.

### Dependencies

AdicSpacesPartII §§R0.19, R1.3–R1.6; AdicSpacesPartIII §§R2.3–R2.4, R2.8, R2.10; ClassicalAdicEtaleCohomology §§1.1–1.5, 10.1–10.4; SchemeAndStackFoundations §§4.11, 4.16, 4.19; EtaleCohomologyFoundations §F.6; Mathlib Ext and exact functors. The four characteristic-zero derived inputs and the sliced nearby-cycle, uniform alteration, adapted-coefficient, annular-cover, uniform annular, descent and boundedness targets live in §3.4. The uniform route also uses ClassicalAdicEtaleCohomology §§3.2, 4.5, 5.4, 8.3–8.5, 9.6–9.7, 10.5, EtaleCohomologyFoundations §§F.2, G.2 and the compact-support nearby-cycle comparison, adapted-open plurinodal refinement and smooth nonproper annular duality of §3.4; its scheme inputs remain SchemeAndStackFoundations §§0.9, 0.23a, 4.11, 4.16, 4.19, with §4.16 for the alteration calculus and §4.19 for de Jong's existence theorem. No weight theory is needed.

## Layer 4: The comparison and toric complete intersections

### 4.1 The tilted approximation Z′ of a toric complete intersection

Let Y ⊆ `X_{Σ,k}` be geometrically connected proper smooth of dimension d over a p-adic field, set-theoretically the intersection of c = codim Y Cartier hypersurfaces in a projective smooth split toric variety. Choose the integral section model and a tube Ỹ as in §3.6. Construct tilted approximation data: a global function field k₁ ⊆ C♭ finite over some `𝔽_q(t^{1/p^n})`, the finite extension L♭ = K♭k₁ with untilt L/K, the closure k″ of k₁ in L♭, and a projective smooth geometrically irreducible k₁-variety Z′ of dimension d with a proper morphism g : Z′ → `X_{Σ,k₁}` generically finite onto its integral image W of dimension d. Require the analytification of `Z′_{L♭}` to map into `π_L⁻¹(Ỹ_L)`. Then k″ is a characteristic-p local field containing t and satisfies the hypothesis of §2.4. Geometric irreducibility is retained even though connectedness suffices for top-degree cohomology (SCH12, Corollary 8.8 and proof of Theorem 9.6, pp. 307, 309; SCH12 line 2496 and line 2607; for the alteration, DJ96, Theorem 4.1 and Remark 4.2, pp. 66–67; DJ96 line 597).

Use the dense perfect subfield k₀ = `𝔽_q(t)^perf` of K♭ in the toric complete-intersection approximation, obtaining a reduced Z₀ ⊆ `X_{Σ,k₀}` of dimension d. By §0.7 a finite separable, hence perfect, extension k₂ of k₀ inside C♭ makes every irreducible component of `Z_{0,k₂}` geometrically irreducible; choose one, W₂, of dimension d. Apply the alteration theorem over k₂ with empty boundary. Since W₂ is projective, the integral source X₁ of the alteration is proper, so its open immersion into the regular projective compactification has closed image and X₁ is a connected component of it. Thus X₁ is regular and projective over the perfect field k₂, hence smooth by §4.13. Again by §0.7 a finite separable extension k₃ of k₂ inside C♭ makes every component of `X_{1,k₃}` geometrically irreducible; a component Z₃ is open and closed because `X_{1,k₃}` is smooth, so Z₃ is smooth, projective and geometrically irreducible over k₃. It maps onto X₁ (§0.7), so Z₃ → W₂ is still an alteration. Since k₃ is finite over k₀, it is the perfection of a field k₁ finite over some `𝔽_q(t^{1/p^n})`. Write k₃ as the union of the purely inseparable extensions `k₁^(1/p^m)` and descend Z₃, its closed immersion into a projective space, its map to `X_{Σ,k₃}` and smoothness to one of them (§0.9); rename that field k₁. As k₃/k₁ is purely inseparable, geometric irreducibility, dimension d and the image containment are unchanged. Call the descended variety Z′ and its map g. No step applies the alteration theorem over an imperfect field. Form L♭ = K♭k₁ and untilt it. Completion at the induced place identifies k″ and gives the hypothesis of §2.4. Naturality of the toric projection under field extension preserves image containment. For ample H on the ambient toric variety, proper pushforward and the Chern projection formula give `deg(c₁(g*H)^d[Z′])` = deg(g) `deg(c₁(H)^d[W])` > 0; every factor is a positive integer.

Its API consists of the following facts.

- The data (k₁, L, k″, Z′, g) with the properties of the statement.

- Existence for every Y and Ỹ as in the statement.

- dim Z′ = dim W = dim Y = d.

- Z′ is geometrically connected (indeed geometrically irreducible) over k₁.

- Z′ is smooth and projective over k₁.

- `g^ad((Z′_{L♭})^ad)` ⊆ `π_L⁻¹(Ỹ_L)`.

- g is proper and generically finite onto W, of degree deg(g) ≥ 1.

- k″ is a local field of characteristic p, the closure of k₁ in L♭, containing t.

- For H ample on `X_Σ`, `deg(c₁(g*H)^d` ∩ [Z′]) = `deg(g)·deg(c₁(H)^d` ∩ [W]) > 0.

**Checks.**

- For Y = `X_{Σ,k}` (c = 0) one may take Ỹ = `X^ad`, k₁ = `𝔽_q(t)`, Z′ = `X_{Σ,k₁}` and g the identity.

- For d = 0 (Y a single k-point that is a set-theoretic complete intersection, for instance a k-point of `ℙ^n` cut out by n hyperplanes) Z′ is Spec k₁ for a finite extension k₁ and g a k₁-point of `X_Σ` whose analytification lies in π⁻¹(Ỹ).

- For c = 1, the initial approximation Z may be taken to be the zero locus of a section of `O(p^N` D) defined over the dense perfect field k₀ = `𝔽_q(t)^perf` (AnalyticToricGeometryPartII §§5.2–5.3, dense-field section and hypersurface approximation).

- Different cohomology is possible even with Y = X = ℙ¹ over `ℚ_3` and Ỹ = `X^ad`. Take k₁ = `𝔽_3(t)`, L♭ = K♭, k″ = `𝔽_3((t))`, and Z′ the smooth projective elliptic curve y² = x³ − x. Its x-coordinate gives a finite degree-two morphism g : Z′ → ℙ¹. These are tilted approximation data, yet dim H¹(Z′, `ℚ̄_ℓ)` = 2 and H¹(Y, `ℚ̄_ℓ)` = 0 for ℓ ≠ 3. Approximation permits a larger cohomology space; no cohomology isomorphism with Y is asserted.

- Regular is not smooth over the imperfect fields k₁: over 𝔽₂(s,t) the conic X² + sY² + tZ² = 0 of SchemeAndStackFoundations §4.18 is regular and integral, but over 𝔽₂(√s,√t) it becomes the double line (X + √s Y + √t Z)² = 0, so it is not smooth, nor geometrically reduced. Over the perfect field k₂ the regular source of the alteration is smooth, and smoothness then descends to k₁ with Z′; an alteration applied directly over `𝔽_q(t^{1/p^n})` could stop at such a regular non-smooth source.

- On ℙ¹, the hyperplane class has degree 1; the degree-two elliptic cover in the preceding Check has deg g*O(1) = 2·1 = 2. Modulo 2 this trace is zero, while it is nonzero over ℚ₂.

- For W = Spec L over a field k, the empty top product has degree [L:k]: 1 for L = k and p for a purely inseparable extension of degree p. Both are positive integers; inseparable degree is retained.

*Needs:* §§2.1–2.4, 3.6; AnalyticToricGeometryPartII §§0.3–0.5, 1.1–1.2, 3.4–3.6, 5.1–5.3, 6.4; SchemeAndStackFoundations §§0.7–0.9, 4.13, 4.16, 4.19, 5.2–5.3; AbelianSchemesAndArithmeticModuli §A2.7 `ampleIntersectionPositive`; PerfectoidSpaces §P3.7.

### 4.2 Scholze's comparison map from the cohomology of Y to that of the tilted approximation

For approximation data of §4.1 and G = `G_L`, construct `f*_m` : `H^i(Y_k̄,ℤ/ℓ^m)` → `H^i(Z′_k̄₁,ℤ/ℓ^m)`. Its composite is geometric field-extension comparison; algebraic–adic comparison; the inverse of restriction from `Ỹ_C` to `Y_C^ad`; π* to `π⁻¹(Ỹ)_{C♭}`; pullback along `g^ad`; and the inverse algebraic–adic and geometric-field comparisons on Z′. Prove G-equivariance, multiplicativity, preservation of 1 and coefficient reduction. Passing to the inverse limit and rationalizing defines f* with the same properties. If `r_Y` and g* are pullbacks from the ambient toric varieties, prove the square `f*∘r_Y` = `g*∘π*_X`, with `π*_X` the ambient toric cohomology isomorphism (SCH12, Theorem 9.7 and proof of Theorem 9.6, pp. 309–310; SCH12 line 2604 and line 2612).

For a proper K-variety V, the completed algebraic closure C of K, and a positive torsion order n invertible in K°, prove that the supplied comparison Hⁱ(V_(Kbar),ℤ/n) → Hⁱ(V_Cᵃᵈ,ℤ/n) commutes with every continuous K-automorphism of C, cup products and coefficient reductions. Here the automorphism acts on the embedded algebraic closure by restriction. Derive this naturality from the analytification morphism of sites and its field-base-change square before using it for f* (SCH12, Theorem 9.7 and its application, pp. 309–310; SCH12 line 2604 and line 2612). *Needs:* ClassicalAdicEtaleCohomology §§8.2, 11.1; EtaleCohomologyFoundations §F.4.6; §3.5.

Every arrow has the indicated source and target and is either site pullback or the inverse of a bijective site pullback. The open toric topos square gives the ambient compatibility. Naturality of that square and of algebraic–adic comparison under base-field automorphisms gives G-equivariance. Use finite-level coefficient compatibility, proper geometric finiteness and Mittag–Leffler for the limit and rationalization. No additivity of sharp and no morphism of mixed-characteristic locally ringed spaces is required.

Its API consists of the following facts.

- `f*_m` and f* as in the statement.

- f*(σ·x) = β(σ)·f*(x) for σ ∈ `G_L`.

- f*(x ∪ y) = f*(x) ∪ f*(y).

- f*(1) = 1 in H⁰.

- `f*_m` is compatible with `ℤ/ℓ^{m+1}` → `ℤ/ℓ^m`.

- f* ∘ `r_Y` = g* ∘ `π*_X` on `H^i(X_Σ)`.

- The `ℚ̄_ℓ-map` is `lim_m` `f*_m` ⊗ `ℚ̄_ℓ`.

**Checks.**

- In degree 0, with Y and Z′ geometrically connected, f* : `ℚ̄_ℓ` → `ℚ̄_ℓ` is the identity. The algebraic–adic comparison sends the unit to 1 on both sides, so every field-automorphism square has the two values 1 and 1.

- For V = ℙ¹ and n = 9, algebraic–adic comparison sends the twisted hyperplane generator to the same generator, of trace +1, and reduction to n = 3 sends that generator to 1 modulo 3 on both sides. Geometric Frobenius at q = 2 acts by 2 on untwisted H² on both sides; taking the inverse action on only one side would give 5 modulo 9.

- For Y = `X_{Σ,k}` with the tilted approximation Z′ = `X_{Σ,k₁}`, g = id, f* is the toric isomorphism `π*_X` of AnalyticToricGeometryPartII §4.2, an isomorphism in every degree.

- In degree 2d, `G_L` acts on `H^{2d}(Y_{k̄}`, `ℚ̄_ℓ)` ≅ `ℚ̄_ℓ(−d)` through `χ_ℓ^{−d}` and on `H^{2d}(Z′_{k̄₁}`, `ℚ̄_ℓ)` ≅ `ℚ̄_ℓ(−d)` through `(χ♭_ℓ` ∘ `β)^{−d}`; these characters are equal by §2.3 (equivariance), as G-equivariance of f* requires.

- Replacing Ỹ by an arbitrary open neighbourhood U of `Y^ad` does not define a map out of `H^i(Y)`: the restriction `H^i(U_C)` → `H^i(Y^ad_C)` need not be invertible (U = `X^ad` and Y a plane cubic in ℙ², degree 1).

*Needs:* §§2.2–2.3, 3.5–3.6, 4.1; AnalyticToricGeometryPartII §§3.4–3.6, 4.2; ClassicalAdicEtaleCohomology §§8.2, 11.1; the automorphism-naturality target above; EtaleCohomologyFoundations §§F.2.2, F.4.3–F.4.6, especially `VanishingCycles.adicFunctoriality`.

### 4.3 The comparison map is an isomorphism in top degree (Lemma 9.9)

For the actual comparison of §4.2, prove f* : `H^{2d}(Y_k̄,ℚ̄_ℓ)` → `H^{2d}(Z′_k̄₁,ℚ̄_ℓ)` an isomorphism of one-dimensional spaces. Retain smoothness, properness, dimension d and geometric connectedness on both varieties and generic finiteness onto the integral image W. This is a rational-coefficient result; positive geometric degree need not be a unit modulo ℓ (SCH12, Lemma 9.9, pp. 310–311; SCH12 line 2636).

Both top groups are one-dimensional. If d = 0, unit preservation makes f* the identity. For d > 0, if f* vanished, the ambient square and the toric `π*_X` isomorphism would force g* to vanish on `H^{2d}` of the ambient variety. But the trace of `g*c₁(H)^d` is deg(g) `deg(c₁(H)^d[W])` > 0 by §4.1, with first Chern classes and trace compatible with cycle degree. A positive integer is nonzero in characteristic-zero `ℚ̄_ℓ`. Thus f* is nonzero and therefore an isomorphism. The argument needs the target top group one-dimensional, not merely the source.

**Checks.**

- With `ℤ/ℓ^m` coefficients the argument fails when ℓ divides `deg(g)·deg(c₁(H)^d` ∩ [W]); this is why the statement is made after passing to `ℚ̄_ℓ`.

- If Z′ were not geometrically connected, `H^{2d}(Z′)` would have dimension the number of geometric components and f* could be injective without being surjective; the construction of §4.1 makes Z′ geometrically connected.

*Needs:* §§4.1–4.2; AnalyticToricGeometryPartII §4.2; EtaleCohomologyFoundations §§0.9, F.6; EtaleDualityAndPerverseSheaves §§0.6, 1.3, 3.7; SchemeAndStackFoundations §§5.2–5.3; AbelianSchemesAndArithmeticModuli §A2.7 `ampleIntersectionPositive`.

### 4.4 A multiplicative map that is an isomorphism in top degree is a split injection

Let E be any field, G a group and d ≥ 0. Let A and B be finite-dimensional graded E-vector spaces in degrees 0 through 2d, with degree-preserving linear G-actions, G-equivariant bilinear products and one-dimensional top degrees. Assume that the complementary-degree product pairings in both are perfect. If f : A → B is graded, G-equivariant, multiplicative and an isomorphism in degree 2d, prove injectivity in each degree and the G-stable decomposition `B^i` = `f(A^i)` ⊕ `f(A^{2d−i})^⊥` for 0 ≤ i ≤ 2d. The annihilator is taken in the first argument of `B^i` × `B^{2d−i}` → `B^{2d}`. Graded commutativity is unnecessary (SCH12, conclusion of Theorem 9.6, p. 311; SCH12 line 2652).

The underlying complementary-pair implication is used in every degree. Choose top-degree bases, write p and q for the scalar perfect pairings, and write c ≠ 0 for f on the top line. For arbitrary finite-dimensional E-spaces U,U′,V,V′, linear maps a : U → V and b : U′ → V′, assume q(a x,b y) = c p(x,y). With G-actions on all four spaces, a and b equivariant, and a character χ : G → Eˣ satisfying q(gv,gv′) = χ(g)q(v,v′), the theorem gives injectivity of a and b and V = range(a) ⊕ {v | ∀y, q(v,b y)=0}, with both subspaces G-stable. Apply this for each i using `U=A^i`, `U′=A^{2d−i}`, `V=B^i` and `V′=B^{2d−i}`. This form permits independent dimensions in different degrees and a nontrivial G-action on the top line.

A nonzero class in `A^i` pairs nontrivially with some class of `A^{2d−i}`; multiplicativity and the top isomorphism force its image to remain nonzero. The restricted pairing on the two images is perfect, so the image in `B^i` intersects the annihilator trivially; perfectness identifies the annihilator dimension with dim `B^i−dim` `A^i`. This proves the sum fills `B^i`. G-equivariance into a one-dimensional top line makes the annihilator stable even when that line has a nontrivial character. In the complementary-pair form the annihilator is the kernel of v ↦ (y ↦ q(v, b y)), and the same argument applies to both legs a and b.

**Checks.**

- Example: A = `H^*(ℙ¹`, `ℚ̄_ℓ)`, B = `H^*(Ell`, `ℚ̄_ℓ)` for an elliptic curve Ell over an algebraically closed field, f the pullback along a degree-2 map Ell → ℙ¹: f is multiplicative, an isomorphism in degree 2 (multiplication by 2 under the traces), A¹ = 0, and B¹ = f(A¹) ⊕ `f(A¹)^⊥` = 0 ⊕ B¹.

- Non-example: without the top-degree isomorphism, the zero map in positive degrees is multiplicative and is neither injective nor split.

- For G = S₃ acting by coordinate permutations on E³ over E = ℚ, take a(x)=b(x)=(x,x,x), q the dot pairing, p(x,y)=xy and c=3. The annihilator is x₁+x₂+x₃=0, of dimension 2, and E³ is the direct sum of that plane and the diagonal line. In characteristic 3 the diagonal lies in that plane and c=0, so the same proposed splitting fails.

- For G=C₂, V=V′=E, q(x,y)=xy, let the generator act by −1 on V and by 1 on V′. Then q(g1,g1)=−1 and the top character is −1. The identity maps satisfy the theorem with c=1; requiring an invariant scalar pairing would exclude this valid top character.

- With U=U′=0, V=V′=E and c=1 the two maps from zero are injective and the annihilator is all V: V=0⊕V. Over 𝔽₂ with all four spaces one-dimensional, identity maps and c=1 give V=V⊕0, so the linear-algebra theorem has no characteristic-zero restriction.

*Needs:* Mathlib perfect pairings, finite-dimensional duals, kernels, ranges and complements, representations and characters; no geometric supplier is needed for this theorem.

### 4.5 `H^i(Y)` is a Galois-stable direct summand of `H^i(Z′)`

For the comparison constructed in §4.2, prove for every i that f* is injective and its image has a `G_L-stable` complement. Via β this identifies `H^i(Y_k̄,ℚ̄_ℓ)|_{G_L}` with a `G_{L♭}-stable` direct summand of `H^i(Z′_k̄₁,ℚ̄_ℓ)|_{G_{L♭}}`. All maps and actions refer to the actual approximation; an arbitrary linear injection has no asserted complement (SCH12, conclusion of Theorem 9.6, p. 311; SCH12 line 2652).

Apply rational Poincaré duality with complementary-degree cups, the multiplicativity and equivariance of §4.2, the top isomorphism of §4.3 and the splitting of §4.4. For i = 0 or 2d the image is the entire one-dimensional target. For i outside the cohomological range both sides vanish.

**Checks.**

- For i = 0 and i = 2d the summand is everything (both sides one-dimensional).

*Needs:* §§4.2–4.4; EtaleCohomologyFoundations §F.6; EtaleDualityAndPerverseSheaves §§0.5–0.6, 3.4–3.7.

### 4.6 The weight–monodromy conjecture for set-theoretic complete intersections in toric varieties (Theorem 9.6)

Prove Scholze's theorem: for every finite `k/ℚ_p`, every projective smooth split toric variety `X_Σ/k`, every geometrically connected proper smooth closed Y ⊆ `X_Σ` whose underlying set is the intersection of exactly codim Y hypersurfaces, and every prime ℓ ≠ p, `WMC_ℓ(Y)` holds. The conclusion quantifies over every cohomological degree and all reduction types. Scheme-theoretic equality with the intersection is unnecessary (SCH12, Theorem 9.6, pp. 309–311, and Theorem 1.15, p. 251; SCH12 line 2589).

Form the Kummer tower and mark its tilt by Layer 2. Use invariant Cartier representatives to choose a finite-presentation integral equation model. Obtain the Galois-stable cohomological tube from §3.6 and the approximation and comparison from §§4.1–4.2. Sections 4.3–4.5 make `H^i(Y)` a stable summand of `H^i(Z′)` after restriction to `G_L`. Apply §1.2 at the place of k₁ with completion k″, and then §2.5 to transfer its weight i back to `G_k`. No general mixed-characteristic conjecture is an input. Characteristic zero of k is used to form the Kummer tower of Layer 2; the neighbourhood theorem of §3.6 holds in either characteristic, and Layer 1 supplies the equal-characteristic input.

**Checks.**

- Y = `ℙ^n_k` (c = 0, Σ the fan of `ℙ^n)`: the conjecture holds, as computed directly in §0.8.

- Smooth hypersurfaces of `ℙ^n_k` of dimension at least 1 (geometrically connected): the theorem applies; in every degree the monodromy grades have the prescribed weights (SCH12, Theorem 1.15, p. 251).

- Smooth plane curves: the theorem gives weight–monodromy for H¹, consistent with the classical curve case through Grothendieck's semistable reduction.


*Needs:* §§0.8, 1.2, 2.5, 3.6, 4.1–4.5; AnalyticToricGeometryPartII §§0.3–0.5, 1.1–1.2 (integral equations).

### 4.7 Smooth complete intersections in projective space and in products of projective spaces

Apply §4.6 to every geometrically connected smooth set-theoretic complete intersection in `ℙ^n_k` or in a finite product of projective spaces over any finite `k/ℚ_p`. In particular this proves weight–monodromy for smooth complete intersections, geometrically connected smooth hypersurfaces and smooth plane curves. Closedness gives properness. All primes ℓ ≠ p and all reduction types are retained (SCH12, Theorems 1.15 and 9.6, pp. 251, 309; SCH12 line 2589).

Projective space and its products have complete regular projective fans, including the rank-zero fan. A smooth closed set-theoretic complete intersection therefore meets every geometric hypothesis of §4.6. The Fermat good-reduction calculation and a cubic threefold with arbitrary reduction distinguish this conclusion from a good-reduction theorem.

**Checks.**

- For n ≥ 2 and e ≥ 1 with p ∤ e, the Fermat hypersurface `x_0^e` + … + `x_n^e` = 0 over `ℚ_p` is geometrically connected and has good reduction, and the theorem agrees with §0.10.

- A smooth cubic threefold in ℙ⁴ over `ℚ_p`, with any reduction type, satisfies weight–monodromy in every degree; the theorem includes its ramified cohomology (SCH12, Theorem 1.15, p. 251).

*Needs:* §4.6; AnalyticToricGeometry Layer 0; AnalyticToricGeometryPartII §1.2 (complete-fan comparison).

### Examples

For Y=ℙ¹ use the identity approximation to obtain the toric isomorphism; on top degree the trace-normalized hyperplane class has value 1 and geometric Frobenius q on both sides. Another approximation over 𝔽₃(t) is the elliptic curve y²=x³−x mapping to ℙ¹ by x, of degree 2. On top cohomology f* multiplies the trace coordinate by 2; on H¹ it embeds the zero space into a two-dimensional space. The top map is invertible over `ℚ̄_ℓ` even for ℓ=2, whereas modulo 2 it is zero. For a smooth cubic threefold in ℙ⁴ the conclusion applies without a reduction condition; for a Fermat hypersurface of degree e with p∤e it agrees with good reduction, since its partial derivatives e `x_j^{e−1}` have no simultaneous projective zero.

### Dependencies

Layers 0–3; AnalyticToricGeometry Layer 0; AnalyticToricGeometryPartII Layers 0–6; SchemeAndStackFoundations §§0.7–0.9, 4.13, 4.16, 4.19, 5.2–5.3; AbelianSchemesAndArithmeticModuli §A2.7 `ampleIntersectionPositive`; ClassicalAdicEtaleCohomology §§8.2, 11.1 with automorphism naturality; EtaleCohomologyFoundations §§0.9, F.2–F.4.6, F.6; EtaleDualityAndPerverseSheaves §§0.5–0.6, 1.3, 3.4–3.7. Section 4.4 itself uses only native finite-dimensional linear algebra.

## Downstream consumers

The local representation interface in Layer 0 and the marked tilting interface in Layer 2 can be used independently of the toric application. The general constant-coefficient neighbourhood result in Layer 3 supplies étale cohomology comparisons for arbitrary separated finite-type models in either characteristic, with a finite-presentation closed immersion and one radius for all invertible coefficient orders. Its characteristic-zero locally constant-sheaf form retains a radius depending on the sheaf and its coefficient order. The end theorem supplies weight–monodromy for toric complete intersections to arithmetic applications such as WeightsInEtaleCohomology. The tensor, dual, Tate-twist and finite-extension interfaces retain the normalizations of the canonical arithmetic suppliers.

## References

Every mathematical statement above is an authorial formulation. Printed page numbers are used for published papers; ITO20 locators refer to arXiv v1. The source identifiers below fix the editions; line locators refer to their line-numbered text extractions, alongside the theorem and page locators.

- **SCH12.** Peter Scholze, [Perfectoid spaces](https://pmihes.centre-mersenne.org/item/10.1007/s10240-012-0042-x.pdf), Publ. Math. IHÉS 116 (2012), 245–313. Published numbering: Theorem 1.15, p. 251; §8, Theorem 8.5 to Corollary 8.8, pp. 304–307; §9, Proposition 9.1 to Lemma 9.9, pp. 307–311. In particular SCH12 line 2496, line 2518, line 2571, line 2589, line 2622 and line 2636.
- **ITO20.** Kazuhiro Ito, [Uniform local constancy of étale cohomology of rigid analytic varieties](https://arxiv.org/abs/2008.07794v1), arXiv:2008.07794v1 (2020). Theorems 1.1 and 1.4 and §1.2, pp. 1–4; §2.1, Definitions 2.1–2.2 and 2.5, Remark 2.3 and Theorem 2.7, pp. 5–8; §3.1, Proposition 3.1, Theorem 3.3, Definition 3.4, Lemmas 3.5–3.16 and Corollary 3.17, pp. 8–18; Proposition 4.1 and Lemma 4.3, pp. 19–20; Theorems 4.5(2) and 4.9, Remark 4.7 and Corollary 4.11, pp. 21–23; Theorem 5.3 and Proposition 5.5, pp. 27–30; Definition 6.1, Theorems 6.2–6.3, Definition 6.5, Propositions 6.6–6.7, Theorem 6.10 and Lemma 6.11, pp. 31–38; Lemmas 7.1–7.7, pp. 39–46; Appendix A, Theorem A.6, Proposition A.8 and Lemma A.11, pp. 46–54. ITO20 line 76, line 99, line 103, line 124, line 189, line 238, line 252, line 317, line 348, line 359, line 381, line 388, line 412, line 429, line 803, line 866, line 918, line 964, line 974, line 987, line 1003, line 1030, line 1198, line 1299, line 1413, line 1427, line 1439, line 1455, line 1481, line 1502, line 1518, line 1586, line 1606, line 1662, line 1673, line 1738, line 1774, line 1813, line 1846, line 1901, line 1928, line 1973, line 2009, line 2038, line 2191, line 2279, line 2338, line 2342, line 2382 and line 2391. The discriminant argument at ITO20 line 2342 is used here after Galois domination of degree invertible in K, so every completed field-factor degree is invertible. Ito supplies the formulations of Huber and Lütkebohmert used in Layer 3.
- **HUB98.** Roland Huber, A finiteness result for direct image sheaves on the étale site of rigid analytic varieties, J. Algebraic Geom. 7 (1998), 359–403. Definition 1.4 and Theorems 2.1 and 3.6; the neighbourhood and degreewise local-constancy forms used here are those recalled at the ITO20 locators above.
- **LUT93.** Werner Lütkebohmert, [Riemann's existence problem for a p-adic field](https://doi.org/10.1007/BF01231290), Invent. Math. 111 (1993), 309–330, Theorem 2.2. Cited through ITO20 line 103; the formulation used here is the one recalled by Ito.
- **DEL80.** Pierre Deligne, [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf), Publ. Math. IHÉS 52 (1980), 137–252, §1.8, Theorem 1.8.4, pp. 175–176; DEL80 line 1524. The finite-field and pure-sheaf theorems are consumed through DeligneWeightsAndPurity.
- **DJ96.** A. J. de Jong, [Smoothness, semi-stability and alterations](https://www.numdam.org/article/PMIHES_1996__83__51_0.pdf), Publ. Math. IHÉS 83 (1996), 51–93, Theorem 4.1 and Remark 4.2, pp. 66–67; DJ96 line 597. The alteration construction is supplied by SchemeAndStackFoundations §4.19.
- **RAM05.** Lorenzo Ramero, [Local monodromy in non-archimedean analytic geometry](https://www.numdam.org/article/PMIHES_2005__102__167_0.pdf), Publ. Math. IHÉS 102 (2005), 167–280, Lemma 2.1.10(ii), p. 193; RAM05 line 1020. Used in §3.4 on completed valued-field factors of invertible degree after Galois domination.
- **HUB96.** Roland Huber, [Étale cohomology of rigid analytic varieties and adic spaces](https://doi.org/10.1007/978-3-663-09991-8), Aspects of Mathematics E30 (1996), Theorems 3.7.2 and 3.8.1, pp. 224–228; Lemma 2.7.11 and Theorem 5.7.8, as recalled in ITO20, proof of Theorem 6.10 and Theorem 5.3; Corollary 7.5.5, as used in ITO20, proof of Lemma 7.1, pp. 45–46 (ITO20 line 2009 and line 2038), for the smooth nonproper annular duality of §3.4. The formulations used here are cited through Ito and Scholze; the proper comparison used here is also recalled in SCH12 Theorem 9.7, SCH12 line 2604, and is supplied by ClassicalAdicEtaleCohomology §§8.2, 11.1.
