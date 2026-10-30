# Roadmap: elliptic curve modularity, part II — wild 3-adic types and descent

**Summary.** This roadmap proves that every continuous absolutely irreducible representation `ρ̄ : G_ℚ → GL₂(𝔽₅)` with cyclotomic determinant is modular (6.10), and deduces that every elliptic curve over `ℚ` is modular (6.13), by the method of Breuil, Conrad, Diamond and Taylor. Given `ρ̄`, a quadratic twist puts its restriction to `G_{ℚ₃}` into one of six explicit normal forms (1.9–1.10). For each form one finds a curve `E₁/ℚ₃` whose 5-torsion is `ρ̄|_{G_{ℚ₃}}` and whose 3-torsion has a prescribed très ramifié shape in the five wild forms (1.16), and then, on the twisted modular curve `X_ρ̄(5) ≅ ℙ¹_ℚ` (1.15), a global curve `E/ℚ` with `E[5] ≅ ρ̄`, with surjective mod-3 representation, and with the same 3-adic local 3-torsion as `E₁` (6.3). In the five wild cases the 3-adic Tate module of `E` is potentially Barsotti–Tate of one of four explicit wildly ramified types `τ₁, τ₋₁, τ₃, τ₋₃` or of one of three extended types `τ′_i` of conductor 243 (6.4). These types simply admit the residual representation, a finite computation with the reductions of explicit compact representations (0.6–0.8), and they are weakly acceptable: the deformation ring of the type is zero or a quotient of `𝒪[[X]]` (3.9, 4.7, 5.12). The weak acceptability is the heart of the roadmap: the type points are shown to satisfy a finite-flat or Dieudonné-module deformation condition over an explicit wildly ramified splitting field (2.10, 2.11, 5.11), and the tangent space of that condition is bounded by a line through explicit computations with Breuil modules carrying wild descent data (Layers W3.3–W3.5). Langlands–Tunnell makes `ρ̄_{E,3}` modular (6.6), BCDT's lifting theorems make `V₃(E)` modular (6.5, 6.8), hence `E` and `ρ̄ ≅ E[5]` (6.7). Conrad–Diamond–Taylor's theorems for curves whose conductor is not divisible by 27 and for the switch at 5 finish the proof (6.9, 6.11, 6.12).

## Scope and ownership

EllipticCurveModularity supplies the modularity interfaces and its Serre-based existence proof. This Part II adds the general wild descent machinery and its BCDT applications; the existing theorem and interfaces retain their owner.

This roadmap owns:

1. **BCDT types and admittance** (Layer W3.0): the explicit inducing models and Iwahori/normalizer compact representations `σ_τ`, `σ_{τ′}` attached to `ℓ`-types and extended `ℓ`-types (0.1); the four wild 3-types and the three conductor-243 extended types (0.3–0.5) and their simple admittance (0.6–0.8).
2. **Local arithmetic of `ℚ₃`** (Layer W3.1): the explicit cube-class basis and peu/très lines of `ℚ₃` (1.1); the Eisenstein and descent-correction data of a uniformizer (1.2); the five families of explicit splitting fields (1.3–1.7); two finite group calculations in `GL₂(𝔽₅)` and `GL₂(𝔽₃)` (1.8); the six local cases and their exhaustion (1.9–1.10); Manoharmayum's local elliptic curves with `e = 3` and `e = 12` (1.11–1.12); the cross-prime comparison for potentially good abelian varieties with number-field action and its elliptic specialization (1.13); the extended Frobenius sign (1.14); rationality of the twisted curve `X_ρ̄(5)` over any field of characteristic zero (1.15); and the local companion curves (1.16).
3. **Breuil modules with wild descent and finite-flat deformation conditions** (Layer W3.2): Breuil's classification of finite flat group schemes killed by an odd prime (2.1), rank-one modules and the extension gauge (2.2), wild descent data with their correction operators (2.3), models with descent, Dieudonné ideals and weak and strong filtrations (2.4); the three kinds of deformation condition at 3 (2.5–2.7), the comparison maps and the tangent-kernel criterion (2.8–2.9), and the factorization of cubic and quadratic type points (2.10–2.11).
4. **The three weak-acceptability computations** (Layers W3.3–W3.5).
5. **The global argument** (Layer W3.6): local constancy of 3-torsion (6.1), the degree-24 three-torsion cover (6.2), the global companion (6.3), the six 3-adic types (6.4), weight-two modularity of odd mod-3 representations (6.6), the transfer of modularity between a curve, its Tate modules, its torsion and its twists (6.7), the wild lifting application (6.8), the theorem of Conrad–Diamond–Taylor for curves with conductor prime to 27 (6.9), modularity of cyclotomic mod-5 representations (6.10), the exceptional isogeny classes (6.11), the switch at 5 (6.12) and the modularity theorem (6.13).

The end statement 6.13 is the end theorem of EllipticCurveModularity, which owns the modularity predicate, the conductor normalization, the attached newform and the modular parametrisation. This roadmap gives a second proof that uses only the conditional comparison theory of that roadmap (Layers R29.3–R29.6) and never its existence theorem through the classical Serre conjecture.

It uses, and does not redevelop:

- residual irreducible representations of the compact and normalizer groups and all BCDT admittance predicates (PadicLocalLanglandsForGL2Qp §§2.8, 5.13), the shared fundamental characters and total unit-Kummer condition including split classes (§0.3), and the underlying Henniart `K`-types (§4.4). Section 0.1 specifies explicit inducing models and the Iwahori/normalizer realizations; 0.6–0.8 compute their wild reductions and simple admittance.
- the underlying Breuil-module triple (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.34); 2.1 extends its finite-flat classification and monodromy calculus to arbitrary ramification, and 2.3 adds wild descent; the compact types of 0.1 specify BCDT’s inducing data and normalizations beyond the inertial-class interfaces of GL2AutomorphicRepresentationsAndTransfer Layers R16.2–R16.3;
- types of local deformations, extended types, potentially Barsotti–Tate representations of a given type, the type and extended-type quotients `R^τ_{V,𝒪}`, `R^{τ′}_{V,𝒪}` (LocalGaloisDeformationRings §3.12); deformation conditions cut out by a category `S` and their tangent spaces, computed using self-extensions in `S[3]` at residue field `𝔽₃` (LocalGaloisDeformationRings §8.6); tangent and obstruction spaces of local lifting rings and change of coefficients (§1.4, §1.12);
- finite flat group schemes over a Dedekind base, schematic closure and models of a generic group (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20, §R07.1.24), Tate's full faithfulness for `p`-divisible groups (§R07.1.22) and extension from compatible finite flat levels (§R07.1.25), the Dieudonné ring, the contravariant Dieudonné module and its classification and Galois descent (§R07.2.5–§R07.2.8), Breuil's `S`-modules (§R07.4.18), Weil–Deligne types of potentially Barsotti–Tate representations (§R07.4.27), `p`-divisible groups with descent data (§R07.4.30), and the tame theory of Breuil modules with descent data (§R07.4.31–§R07.4.35); this roadmap adds the wild descent calculus and the filtration criteria in Layer W3.2;
- the local Langlands correspondence for `GL₂`, Henniart's types and the Conrad–Diamond–Taylor vexing type (GL2AutomorphicRepresentationsAndTransfer Layers R16.2–R16.3); the Langlands–Tunnell theorem in its octahedral mod-3 form (Layer R17.5);
- Kisin's potentially Barsotti–Tate modularity lifting theorem over `ℚ`, the patching on a chosen local component and the general BCDT lifting theorems (GL2ModularityLifting §§5.6, 5.11–5.15), and the ordinary modularity lifting theorem (ClassicalSerreModularity §I.1);
- the twisted modular curve `Y(ρ)/ℚ` and its moduli interpretation (TauCetiRoadmap ModularCurves §5C), its geometric irreducibility, compactification and the fixed-pairing curves (ModularCurvesPartII §§4.10, 5.14, 6.5); 1.15 extends the twist construction to arbitrary characteristic-zero fields;
- Hilbert specialization with local conditions (InverseGaloisAndArithmeticFundamentalGroups §IG.2.7);
- Tate modules, Weil pairing, cyclotomic determinant, reduction and Euler factors (ArithmeticGaloisRepresentations Layer 6 and Tau Ceti), residual images, oddness and bad dihedral images (Layer 4), Brauer–Nesbitt (§1.8);
- Serre weights, the Hasse section, the Deligne–Serre lifting lemma and residual modularity predicates (AlgebraicModularFormsAndSerreWeights Layers R15.3, R15.5, R15.6); twisting of newforms by Dirichlet characters and primitive associates (TauCetiRoadmap ModularForms Layers 4 and 9);
- general local cohomology dimensions (TauCetiRoadmap LocalGaloisGroups Layer 1); local class field theory with the arithmetic Frobenius normalization, Kummer theory and local Tate duality (TauCetiRoadmap ClassFieldTheory Layers 5, 7, 8; Tau Ceti `kummerEquiv`, `dualityMap1_kummerCoeff_bijective`, `localArtinMap`); ramification of local fields, Eisenstein extensions and unramified extensions (TauCetiRoadmap LocalFieldsRamification Layers 0, 2, 3); elliptic curves over local fields and Néron–Ogg–Shafarevich (TauCetiRoadmap EllipticCurves Layers 2 and 4);
- modularity of CM elliptic curves through Hecke characters (ComplexMultiplicationAndExplicitReciprocity).

It leaves to other roadmaps:

- the general Serre conjecture and the Khare–Wintenberger route to elliptic modularity (EllipticCurveModularity, ClassicalSerreModularity);
- potentially Barsotti–Tate deformation rings for general types and modularity lifting, including the general BCDT theorems (LocalGaloisDeformationRings §3.12, GL2ModularityLifting §§5.11–5.15); this roadmap's local results are the BCDT computations of weak acceptability for the specific wild types, not a general theory of potentially Barsotti–Tate deformation rings;
- modularity over number fields other than `ℚ` (EllipticCurveModularityImaginaryQuadratic, ModularityAndLanglandsExtensions).

## Conventions

- **Primes and fields.** `ℓ` is an arbitrary odd prime in 0.1, 2.1–2.3 and 6.5, and an arbitrary prime in 2.4 (Breuil modules need `ℓ` odd); except where a prime is explicitly quantified in a statement, `ℓ = 3`. `G_ℓ = Gal(ℚ̄_ℓ/ℚ_ℓ)`, `I_ℓ` its inertia subgroup, `W_{ℚ_ℓ}` the Weil group, and `G₃` stands for `G_{ℚ₃}`. All extensions of `ℚ₃` are subfields of a fixed `AlgebraicClosure ℚ₃` (the Lean abbreviations `Q3` and `Q3bar` fix these fields), and `j` is a fixed square root of `−1`. Fix `ξ ∈ ℚ₃(j)` with `ξ² = j`; then `ξ⁴ = −1` and `ξ` has order eight (0.3, 1.9).
- **Reciprocity.** The local Artin map sends uniformizers to **arithmetic** Frobenius (as in TauCetiRoadmap ClassFieldTheory §2.6 and in BCDT's notation section, p. 848). The sign computations of 1.14 and of the extended types reverse under the geometric normalization.
- **Characters.** `ε` is the `ℓ`-adic cyclotomic character, `ω` its reduction modulo `ℓ`, `ω₂ : I_ℓ → 𝔽_{ℓ²}^×` the fundamental character of level two, and `ω̃`, `ω̃₂` their Teichmüller lifts. For `ℓ = 3`, `ω` is the quadratic character of `ℚ₃(√−3)/ℚ₃`, so `ω² = 1` and `ω^{−1} = ω`.
- **Peu and très ramifié.** An extension `0 → ω → V → 1 → 0` of `𝔽₃[G₃]`-modules has a Kummer class in `ℚ₃^×/(ℚ₃^×)³`; use the total unit-Kummer convention of PadicLocalLanglandsForGL2Qp §0.3: it is peu ramifié if its class belongs to the unit subspace, including the zero cohomology class, and très ramifié otherwise; a très ramifié extension is necessarily nonsplit (Serre's terminology, 1.1). The same words are applied to `(1, ∗; 0, ω) = (ω, ∗; 0, 1) ⊗ ω` and to restrictions to inertia.
- **Matrix shapes.** `(a, ∗; 0, b)` denotes a representation with a subrepresentation `a` and quotient `b`. A self-extension of `ρ̄` killed by 3 is written `(ρ̄, φρ̄; 0, ρ̄)` with `φ ∈ Z¹(G₃, ad ρ̄)`, in a basis in which `ρ̄ = (χω, ∗; 0, χ)` (2.8).
- **Group schemes.** Every finite flat group scheme in this roadmap is commutative. In §§2.1–2.3 it is killed by the indicated odd prime; §2.4 and the deformation categories allow commutative groups of prime-power order.
- **Breuil modules.** Contravariant; scalars `k[u]/(u^{eℓ})`; `N(u) = +u`; `c_π = −φ(G_π)`; `φ(m) = c_π^{−1}φ₁(u^e m)` (2.1). Breuil modules depend on the choice of uniformizer, and the uniformizers are the ones fixed in 1.3–1.7.
- **Crystalline Frobenius.** PadicHodgeTheory §8.3 uses the covariant crystalline realization of `V_p(A)`. Its `φ^f` has reciprocal roots to arithmetic Weil Frobenius: for good elliptic reduction over `𝔽_q` with `q = p^f`, its polynomial is `X² − (a_q/q)X + 1/q`, whereas the arithmetic Weil polynomial is `X² − a_qX + q`. The contravariant special-fibre operator `F` in Layers W3.2–W3.5 uses the integral Dieudonné convention, not that covariant `φ`. The witness in 1.13 fixes the comparison.
- **Dieudonné modules.** `D(G)` is the classical contravariant Dieudonné module of the special fibre, with `FV = VF = ℓ`, `F` Frobenius-semilinear and `V` inverse-Frobenius-semilinear; descent data act semilinearly through `Γ` on the Witt vectors (2.4).
- **Deformation rings.** `R_{V,𝒪}` is the universal deformation ring of `ρ̄` (centralizer `k`), `R^ψ`, `R^S`, `R^{ψ,S}` its fixed-determinant and category quotients (LocalGaloisDeformationRings §8.6), `R^τ`, `R^{τ′}` the type quotients (§3.12). A type (or extended type) is *weakly acceptable* for `ρ̄` if its type quotient is zero or admits a surjective continuous local `𝒪`-algebra map from `𝒪[[X]]` (BCDT §1.1, pp. 850–851). For example the zero quotient and `𝒪[[X]]/(X)` satisfy this condition; `𝒪[[X,Y]]` does not, since its relative tangent dimension is two, while that of a quotient of `𝒪[[X]]` is at most one.
- **Modularity.** As stated at the head of Layer W3.6: weight-two newforms for representations, AlgebraicModularFormsAndSerreWeights R15.6 for residual representations, EllipticCurveModularity R29.6 for elliptic curves.
- **Names.** Lean names are relative to the namespace `TauCetiRoadmap.EllipticCurveModularityWild3Adic` of [Suggested.lean](Suggested.lean), which states the declarations that can be typed against the pinned libraries. Section numbers `k.n` refer to this document, `k` being the digit of the layer `W3.k`. **BCDT** is Breuil–Conrad–Diamond–Taylor (published version, J. Amer. Math. Soc. 14 (2001)), **CDT** is Conrad–Diamond–Taylor (J. Amer. Math. Soc. 12 (1999), cited with its published page numbers), **Manoharmayum** is Math. Res. Lett. 6 (1999), **Shepherd-Barron–Taylor** is J. Amer. Math. Soc. 10 (1997); see References.

## Exact supplier contracts

### From Mathlib (pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`)

- `Padic` (`ℚ₃` as `Padic 3`, with `Padic.addValuation`), `AlgebraicClosure`, `IntermediateField.adjoin`, `minpoly`, `Polynomial.IsEisensteinAt`, `GaloisField`, `ZMod`; Krasner's lemma `IsKrasner`, `IsKrasner.krasner` (used in 6.1).
- `AdjoinRoot` with `AdjoinRoot.root` and `AdjoinRoot.liftAlgHom` (the truncated polynomial rings `𝔽₃[u]/(u^n)` and `𝔽₃[T]/(T^N)`), `Submodule.span` (filtrations of Breuil modules), `WittVector`, `PowerSeries`, `AddValuation`.
- `Matrix.trace`, `Matrix.GeneralLinearGroup` with `Matrix.GeneralLinearGroup.mkOfDetNeZero`, `Matrix.SpecialLinearGroup`.
- `linearIndependent_algHom_toLinearMap` (`LinearAlgebra/LinearIndependent/Lemmas.lean`) for Artin independence; `groupCohomology.H1ofAutOnUnitsUnique` (`RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean`) for scalar Hilbert 90 over finite-dimensional field extensions, after the finite-Galois reduction in 1.15.
- `SeparableClosure`, the Krull topology on `AlgEquiv`, `Matrix.ProjGenLinGroup`, `Matrix.ProjectiveSpecialLinearGroup`, `Matrix.SpecialLinearGroup.toPGL`, `QuotientGroup.mk`, and coefficient maps on the three matrix groups (1.15).
- `Representation`, `ContRepresentation` (continuous linear operators; joint continuity in the group variable is a separate hypothesis), `WeierstrassCurve`, `WeierstrassCurve.IsElliptic`, `WeierstrassCurve.j`.

### From Tau Ceti

- `HeckeRing.GL2.Newform`, with `χ` and good-index `eigenvalue`, from `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`; the latter is defined only at indices coprime to the level. Section 6.13 uses precisely that domain.

- At the pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`: `TauCeti.AbsoluteGaloisGroup`; continuous cohomology `TauCeti.ContCohomology.Z1`, `TauCeti.ContCohomology.H1`, `TauCeti.ContCohomology.H1pi`, and its functoriality `TauCeti.ContinuousCohomology.coeffMap`, `TauCeti.ContinuousCohomology.res` (used in 2.8).
- the Kummer isomorphism `TauCeti.ClassFieldTheory.kummerEquiv` (`NumberTheory/ClassFieldTheory/MuNRep.lean`, for `n` a unit of the field) and local Tate duality `dualityMap1_kummerCoeff_bijective` (`NumberTheory/ClassFieldTheory/Local/Duality/FiniteModule.lean`), used in 1.1; the local Artin map `TauCeti.ClassFieldTheory.localArtinMap` with `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer` and the abelian-layer reciprocity `localAbelianGaloisEquiv`; the Weil pairing `TauCeti.Isogeny.weilPairing` with `weilPairing_torsionGaloisAction`, `WeierstrassCurve.tateModuleGaloisRepresentation` and `TauCeti.det_tateModuleGaloisRepresentation` (determinant the cyclotomic character); Eisenstein characterizations of totally ramified extensions (`TauCeti.isTotallyRamified_iff_exists_eisenstein_generator`).

### From TauCetiRoadmap on main

- **ClassFieldTheory** §2.6 (arithmetic Frobenius convention), Layers 11–12 (`globalArtinMap`, `globalArtinMap_local` and ray-class reciprocity over `ℚ`), Layer 5 (local coefficients, the Brauer group, the local invariant and duality: `kummerEquiv_mixed`, `tateDualityPairing_perfect_mixed`, the Euler characteristic formula), Layer 7 (the absolute local Artin map, its normalizations and conductors), Layer 8 (local existence and the local class field correspondence). The specializations to `ℚ₃` needed here are 1.1.
- **LocalGaloisGroups** Layer 1 (the general local cohomology dimension formulas). Section 1.1 adds the explicit cube-class basis and ramification lines, rather than a second general dimension theorem.
- **LocalFieldsRamification** Layers 0, 2, 3 (extension valuations, unramified extensions with Frobenius generator, Eisenstein generators, the ramification filtration). The explicit fields are 1.3–1.7.
- **EllipticCurves** Layer 2 (torsion, the Weil pairing and the Tate module) and Layer 4 (reduction over local fields, Tate's algorithm, Néron–Ogg–Shafarevich).
- **ModularCurves** §5C (the twisted curve `Y(ρ)/ℚ` for `N ≥ 3`; its geometric connectedness is an explicit hypothesis there and is supplied by ModularCurvesPartII §§4.10, 6.5). Section 1.15 extends the construction to arbitrary paired `G_K`-modules over characteristic-zero fields; ModularCurvesPartII §5.14 supplies compactification and base change for twists defined over `ℚ`.
- **ModularForms** Layer 4 (newforms, primitive associates) and Layer 9 (the twist `f ⊗ ψ` with `a_p(f ⊗ ψ) = ψ(p)a_p(f)` and its level bound).
- **Chebotarev** (density of Frobenius elements, through ArithmeticGaloisRepresentations §5.1).
- **RepresentationTheory/InductionRestriction** Layer 7 (factor sets, Schur multipliers and representation groups, used in 1.15); its finite-group induction and Clifford theory are used in 0.1. The equivariant level-five lift and matrix Hilbert 90 are the explicit targets of 1.15.

### From TauCetiRoadmap suppliers

- **PadicLocalLanglandsForGL2Qp** §0.3 (fundamental characters and the total unit-Kummer subspace, including zero), §2.8 (all residual irreducibles of `GL₂(ℤ_ℓ)`, `U₀(ℓ)` and its full normalizer, retaining the noncompact central scalar), §4.4 (Henniart `K`-types and multiplicity one), and §5.13 (all BCDT admittance and simple-admittance predicates, including the quotient-Frobenius condition and the full set of boundary Serre weights). These inputs are used at odd primes; the types of 0.1 add explicit inducing models and the Iwahori/normalizer realization.

- **LocalGaloisDeformationRings** §1.4 (tangent and obstruction of local lifting rings), §1.12 (change of coefficients), §3.12 (BCDT type rings as Kisin rings: `ℓ`-types, extended `ℓ`-types, type quotients), §8.6 (deformation conditions cut out by a category `S`: `CategoryCondition`, its ring and tangent `Ext¹_{S[3]}(V, V)` at residue field `𝔽₃`).
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory** §R07.1.20 (`schematicClosure_flat`), §R07.1.22 (`BarsottiTate.extend_genericFibre`: extension of morphisms), §R07.1.25 (extension of a group from compatible finite flat levels), §R07.1.24, §R07.2.5 (`DieudonneRing`), §R07.2.6–§R07.2.8, §R07.4.18, §R07.4.27, §R07.4.30 (`descentDataPDivisibleGroups`), §R07.4.31–§R07.4.35 (tame Breuil modules with descent, `N(u) = −u`); in §R07.4.34 the underlying carrier `BreuilModuleModP` is the finite free truncated-polynomial module with filtration containing `u^eM` and semilinear Frobenius with generating image. Its tame descent and realization conventions are replaced by the arbitrary-ramification contravariant classification and positive-monodromy formulas of 2.1–2.3.
- **GL2AutomorphicRepresentationsAndTransfer** Layer R16.2 (Henniart's unicity of supercuspidal types; the CDT vexing type), Layer R16.3 (local parameters and factors; the CDT inertial comparison and multiplicity one), Layer R17.5 (the octahedral mod-3 application of Langlands–Tunnell).
- **GL2ModularityLifting** §§5.6, 5.9, 5.11 (*Kisin's potentially Barsotti–Tate theorem over ℚ*: for `p > 2`, a continuous `ρ` potentially Barsotti–Tate at `p` with determinant cyclotomic times finite order, with `ρ̄` modular and absolutely irreducible on `G_{ℚ(√p*)}`, is modular; *patching on a chosen local component*; *the exact overlap with ordinary modularity lifting*).
- **GL2ModularityLifting** §§5.14–5.15 (the general BCDT type and extended-type lifting theorems, with the residual support and corrected comparison of §§5.12–5.13); 6.5 records their hypotheses and 6.8 applies them to the types constructed here.
- **ClassicalSerreModularity** §I.1 (ordinary modularity lifting over ℚ, including its imaginary-quadratic branch); **OrdinaryAutomorphicFormsAndModularityLifting** §§5.7, 5.10 supplies the ordinary modular seed with the selected unramified residual quotient for an absolutely irreducible modular residual representation whose local characters are distinct and either `p ≠ 3` or the residual restriction to `G_{ℚ(√−3)}` is irreducible. Its restricted lifting specialization is not used for imaginary-quadratic induced representations.
- **ModularCurvesPartII** §4.10 (geometric connectedness of a fixed-pairing curve), §6.5 (geometric irreducibility of the paired twist), §5.14 (the compactification `X(ρ)` and frame descent), and §§5.1–5.5 (coarse level curves and `X₀(N)` models).
- **InverseGaloisAndArithmeticFundamentalGroups** §IG.2.7 (*Hilbert specialization with local conditions*: for a Hilbert subset `H ⊂ 𝔸^r_K` and finitely many places `S`, `H(K)` is dense in `∏_{v ∈ S} 𝔸^r(K_v)`).
- **AutomorphicGaloisRepresentations** §1.5 (rank-two newform realization, with arithmetic polynomial `X² − a_pX + χ(p)p` in weight two) and §7.3 (the fixed-eigenform compatible family), used in the modularity comparisons of 6.7.
- **ArithmeticGaloisRepresentations** §1.8 (Brauer–Nesbitt), Layer 4 (§4.1 complex conjugation and oddness, §4.2 Borel and Cartan subgroups, §4.3, §4.6 bad dihedral images), Layer 5 (§5.1 density of Frobenius elements, §5.3–§5.4 recognition), Layer 6 (§6.1 the Tate module, §6.2 Weil pairing and determinant, §6.3 reduction and Euler factors).
- **AlgebraicModularFormsAndSerreWeights** Layers R15.3 (the Hasse section; ordinary weight congruences and weight one), R15.5 (Deligne–Serre eigenvalue lifting), R15.6 (residual modularity and modularity predicates), and the Serre weights of `GL₂(𝔽_ℓ)`.
- **EllipticCurveModularity** Layers R29.3 (attachment and uniqueness across levels), R29.4 (the rational Tate-module comparison; the level is the conductor), R29.5 (isogeny from the modular quotient; the morphism from `X₀`), R29.6 (recovering a primitive form from a Jacobian quotient; the three equivalent modularity formulations), only in their conditional form.
- **PadicHodgeTheory** §§8.3, 9.3 (good reduction and crystalline Tate modules, with covariant crystalline Frobenius inverted for the arithmetic Weil normalization), used in 1.13.
- **ComplexMultiplicationAndExplicitReciprocity** (*CM induction and compatible-system comparison*), used in 6.11. The two finite modular-map constructions are targets here, using polynomial identities over `ℚ` and the modular-curve and conditional Jacobian-quotient interfaces named above.

## How to read the build

Layer W3.0 sets up the representation theory of types and admittance and checks the admittance of the seven wild types. Layer W3.1 is the local arithmetic of `ℚ₃` and the local elliptic curves; it ends with the local companion curves. Layer W3.2 is the general machinery for the local deformation rings: Breuil modules with wild descent, filtered models, the three deformation conditions and the comparison maps. Layers W3.3, W3.4 and W3.5 are three parallel computations of weak acceptability, for the cubic, ramified quadratic and extended types; W3.5 reuses the degree-twelve rank-one results of W3.4 and is the longest, because four residual models must be classified and three of the four deformation rings turn out to be killed by 3. Layer W3.6 is the global argument and needs everything before it; 6.5 imports the general BCDT lifting theorems, while 6.6–6.7 and 6.9 supply the residual, comparison and tame applications used in the argument.

## Layer W3.0: Types, admittance and the wild 3-adic types

This layer has two halves. The first (0.1) specifies explicit inducing models and Iwahori/normalizer realizations for the representation-theoretic side of BCDT's lifting theorems. Use the residual representation classification of PadicLocalLanglandsForGL2Qp §2.8 and its predicates “admits” and “simply admits” from §5.13, with the fundamental characters and total unit-Kummer convention of its §0.3. The Galois side — `ℓ`-types, extended `ℓ`-types, potentially Barsotti–Tate representations of a given type, the type quotients `R^τ_{V,𝒪}`, `R^{τ′}_{V,𝒪}` — is supplied by LocalGaloisDeformationRings §3.12. Weak acceptability is the predicate in Conventions (BCDT §1.1, pp. 850–851). The second half (0.3–0.8) defines the four wildly ramified 3-types and the three conductor-243 extended types that the proof uses, and checks that each simply admits the residual representations it will be paired with.

Throughout, `U₀(ℓ^r) ⊂ GL₂(ℤ_ℓ)` is the subgroup of matrices that are upper triangular modulo `ℓ^r`, `Ũ₀(ℓ)` is the normalizer of `U₀(ℓ)` in `GL₂(ℚ_ℓ)`, generated by `U₀(ℓ)` and `w_ℓ = (0, −1; ℓ, 0)`, and `ω₂ : I_ℓ → 𝔽_{ℓ²}^×` is the fundamental character of level two. Local class field theory identifies `F^×` with `W_F^{ab}` with uniformizers going to arithmetic Frobenius.

### 0.1 The compact representations attached to types

**Construction.** Let `ℓ` be odd. Use the Henniart `K`-type of PadicLocalLanglandsForGL2Qp §4.4 for reducible `τ`, in the CDT normalization. The first two formulas below specify explicit inducing models for that supplied object; the last two construct the extended and Iwahori realizations. For an `ℓ`-type `τ` put `U_τ = GL₂(ℤ_ℓ)` if `τ` is reducible and `U_τ = U₀(ℓ)` if it is irreducible; for an extended `ℓ`-type `τ′` with `τ′|_{I_ℓ}` irreducible put `U_{τ′} = Ũ₀(ℓ)`. The inducing models for `σ_τ` over `ℚ̄_ℓ`, with open kernel, are:

1. `τ = χ₁|_{I_ℓ} ⊕ χ₂|_{I_ℓ}` with `χ_i` characters of `W_{ℚ_ℓ}`, and `a` the conductor exponent of `χ₁/χ₂`: if `a = 0`, `σ_τ = St ⊗ (χ₁ ∘ det)`, with `St` the Steinberg representation of `PGL₂(𝔽_ℓ)`; if `a > 0`, `σ_τ` is induced from `U₀(ℓ^a)` to `GL₂(ℤ_ℓ)` from the character `(α, β; ℓ^aγ, δ) ↦ (χ₁/χ₂)(α)·χ₂(αδ − ℓ^aβγ)`.
2. `τ` the restriction to `I_ℓ` of `Ind_{W_F}^{W_{ℚ_ℓ}} χ` with `F/ℚ_ℓ` unramified quadratic, `s` its conjugation and `χ ≠ χ^s`; `a > 0` the conductor of `χ/χ^s` and `χ′` a character of `W_{ℚ_ℓ}` with `χ′^{−1}|_{W_F}·χ` of conductor `a`. Identify `GL₂(ℤ_ℓ)` with `Aut_{ℤ_ℓ}(𝒪_F)`. If `a = 1`, `σ_τ = Θ(χ′^{−1}|_{W_F}χ) ⊗ (χ′ ∘ det)`, with `Θ` the cuspidal representation of `GL₂(𝔽_ℓ)` attached to a regular character of `𝔽_{ℓ²}^×`. If `a` is even, `σ_τ` is induced from `𝒪_F^×(1 + ℓ^{a/2}𝒪_F s)` of the character `αβ ↦ (χ′^{−1}χ)(α)χ′(det αβ)`. If `a > 1` is odd, `σ_τ` is induced from `𝒪_F^×(1 + ℓ^{(a−1)/2}𝒪_F s)` of the `ℓ`-dimensional representation `η` whose restriction to `𝒪_F^×(1 + ℓ^{(a+1)/2}𝒪_F s)` is the sum of the characters `αβ ↦ (χ′^{−1}χχ″)(α)χ′(det αβ)` over the `ℓ` nontrivial characters `χ″` of `𝒪_F^×/ℤ_ℓ^×(1 + ℓ𝒪_F)`.
3. `τ′` an extended type with `τ′|_{I_ℓ}` irreducible: `τ′ = Ind_{W_F}^{W_{ℚ_ℓ}} χ` with `F/ℚ_ℓ` ramified quadratic and `a = cond(χ/χ^s)` even, `a ≥ 2`; with `χ′` as before, identify `GL₂(ℚ_ℓ)` with `Aut_{ℚ_ℓ}(F)` and `U₀(ℓ)` with the stabilizer of `𝔭_F^{−1} ⊃ 𝒪_F`; then `σ_{τ′}` is induced from `F^×(1 + 𝔭_F^{a/2}s)` to `Ũ₀(ℓ)` of `αβ ↦ (χ′^{−1}χχ″)(α)χ′(det αβ)`, where `χ″` is the character of `F^×/(𝒪_F^×)²` that is nontrivial on `𝒪_F^×` and satisfies `χ″(−θ·(N_{F/ℚ_ℓ}ϖ)^{a/2}) = Σ_{x ∈ ℤ/ℓ} ψ(x²/N_{F/ℚ_ℓ}ϖ)` for a uniformizer `ϖ` of `F`; here `ψ` is an additive character of `ℚ_ℓ` with kernel `ℤ_ℓ` and `θ ∈ F^×` satisfies `(χ′^{−1}χ)(1 + x) = ψ(tr_{F/ℚ_ℓ}(θx))` for `x ∈ 𝔭_F^{a−1}` (the value at the uniformizer need not be a root of unity).
4. `τ` irreducible: `σ_τ = σ_{τ′}|_{U₀(ℓ)}` for any extended type `τ′` restricting to `τ`.

**Theorem.** The displayed inducing models identify with the supplied `K`-types in cases 1–2. In cases 3–4 the resulting representations are independent of choices and irreducible. For an infinite-dimensional irreducible admissible representation `π` of `GL₂(ℚ_ℓ)` over `ℚ̄_ℓ`, and irreducible `τ`, prove `Hom_{U₀(ℓ)}(σ_τ, π) ≅ ℚ̄_ℓ` if `WD(π)|_{I_ℓ} ≅ τ` and `= 0` otherwise; likewise `Hom_{Ũ₀(ℓ)}(σ_{τ′}, π) ≅ ℚ̄_ℓ` if `WD(π) ≅ τ′` and `= 0` otherwise. Here `WD(π)` is the local Langlands correspondence in the normalization of Conrad–Diamond–Taylor §4.1.

- the compact representations are independent of the choices of inducing data and extensions used to construct them, up to isomorphism.
- the explicit models in cases 1–2 identify with the Henniart types, while the extended and Iwahori representations in cases 3–4 are irreducible over `ℚ̄_ℓ`.
- for every infinite-dimensional irreducible admissible `π`, the indicated Hom space has dimension one exactly for the matching inertial or extended type, and dimension zero otherwise.
- in case 4, `σ_τ` does not depend on the extension `τ′`.

*Proof sketch.* Principal series cases from the standard theory of induced representations; the irreducible-but-not-extending case and the extended case from Gérardin's description of the supercuspidal representations of `GL₂`. For an irreducible `τ` with extension `τ′`, `τ′ ≇ τ′ ⊗ δ` for the unramified quadratic character `δ`, so `σ_{τ′}` restricted to `ℚ_ℓ^×U₀(ℓ)` stays irreducible, which gives irreducibility of `σ_τ`. (BCDT, §1.2 and Lemma 1.2.1 with proof, pp. 852–854.) *Needs:* PadicLocalLanglandsForGL2Qp §4.4 (Henniart `K`-types), GL2AutomorphicRepresentationsAndTransfer Layer R16.2 (*Henniart's unicity of supercuspidal types*, *the Conrad–Diamond–Taylor vexing type*) and Layer R16.3 (*principal-series parameters*, *supercuspidal parameters including wild cases*, *the Tate and unitary normalization bridge*, *the CDT inertial comparison and multiplicity one*).

**Checks.**

- `τ` trivial (`χ₁ = χ₂ = 1`, `a = 0`): `σ_τ = St` has dimension `ℓ`. For an unramified irreducible principal series `π`, the invariants under the principal congruence subgroup form `Ind_{B(𝔽_ℓ)}^{GL₂(𝔽_ℓ)} 1 ≅ 1 ⊕ St`, so `Hom(St, π)` is one-dimensional, as the occurrence criterion of PadicLocalLanglandsForGL2Qp §4.4 requires; for a principal series whose inducing characters are ramified it is zero.
- `τ = χ|_{I_ℓ} ⊕ 1` with `χ` tame of conductor 1: `σ_τ` is induced from `U₀(ℓ)`, of dimension `ℓ + 1`; in general case 1 with `a > 0` has dimension `[GL₂(ℤ_ℓ) : U₀(ℓ^a)] = (ℓ + 1)ℓ^{a−1}`.
- For `ℓ = 3` and `τ₁` (0.3), `σ_{τ₁}` is induced from `U₀(9)` of a character of order three: dimension `[GL₂(ℤ₃) : U₀(9)] = 12`.

### 0.3 The cubic wild types

**Definition.** Fix `ζ ∈ GL₂(ℤ₃)` with `ζ³ = 1 ≠ ζ`. The 3-type `τ₁` corresponds, through local reciprocity, to the order-three character of `ℤ₃^×` with `−1 ↦ 1` and `4 ↦ ζ`. The 3-type `τ₋₁` corresponds to the order-three character of `ℤ₃[j]^×` (`j² = −1`, the units of the unramified quadratic extension) with `ξ ↦ 1`, `4 ↦ 1` and `1 + 3j ↦ ζ`, viewed as an inertial type through induction from the unramified quadratic field. These are isomorphism classes of representations of `I₃` and do not depend on `ζ`.

- the unit values extend to continuous characters with open kernel, and to inertial types extendable to `W_{ℚ₃}`.
- `τ₁(Art(−1)) = 1`, `τ₁(Art(4)) = ζ`, and the inducing character of `τ₋₁` takes the values listed.
- another order-three `ζ` gives an isomorphic type.
- both are `ℓ`-types in the sense of LocalGaloisDeformationRings §3.12, and their compact representations are those of 0.1 cases 1 and 2.

*Construction.* The cube-class groups of `ℤ₃^×` and of the units of `ℚ₃(j)` are computed from the unit filtration; `4 ≡ 1 mod 3` generates `(1 + 3ℤ₃)/(1 + 9ℤ₃)`. For `τ₁`, restrict scalars of the character over `ℚ₃(ζ)` to obtain a two-dimensional `ℚ₃`-representation. For `τ₋₁`, first embed `ℚ₃(ζ)` in `ℚ̄₃`, induce its one-dimensional scalar character from the unramified quadratic field, and then restrict to inertia; the result has a two-dimensional `ℚ₃`-form. Inducing the already two-dimensional restriction of scalars would instead give dimension four. (BCDT, §2.1, pp. 860–861; §§3.1–3.2, pp. 866–867.) *Needs:* 0.1, LocalGaloisDeformationRings §3.12, TauCetiRoadmap ClassFieldTheory Layers 7 and 8.

**Checks.**

- `τ₁(Art(4))` has order three; a trivial unit character fails this.
- the inducing character of `τ₋₁` is trivial on `ξ` and `4` and nontrivial on `1 + 3j`: its unit image has order three. Since `ξ⁸ = 1`, an order-three character must send `ξ` to 1; a character sending it to `−1` has even-order unit image and defines a different inertial type.
- the unramified quadratic conjugation inverts the inducing character of `τ₋₁` (so `τ₋₁` does not extend to a sum of characters of `W_{ℚ₃}`).

### 0.4 The ramified quadratic wild types

**Definition.** With `ζ` as in 0.3, `τ₃` is the unique 3-type whose restriction to the inertia of `ℚ₃(√3)` corresponds to the order-six character of `ℤ₃[√3]^×` with `−1 ↦ −1`, `4 ↦ 1`, `1 + √3 ↦ ζ`, and `τ₋₃` the unique 3-type whose restriction to the inertia of `ℚ₃(√−3)` corresponds to the order-six character of `ℤ₃[√−3]^×` with `−1 ↦ −1`, `4 ↦ 1`, `1 + 3√−3 ↦ 1`, `1 + √−3 ↦ ζ`.

- the characters and the two-dimensional inertial types extending them exist.
- the inducing characters have the displayed values on the unit generators; in particular the character for `τ₋₃` is trivial on `1 + 3√−3`.
- an inertial type with the given restriction is isomorphic to `τ₃` (resp. `τ₋₃`).
- these are irreducible `ℓ`-types; their compact representations are those of 0.1 case 4.

*Construction.* Local reciprocity for the ramified quadratic field, then uniqueness of the two-dimensional extension from the conjugation relation. (BCDT, §2.1, p. 861; §3.3, p. 867.) *Needs:* 0.1, LocalGaloisDeformationRings §3.12, TauCetiRoadmap ClassFieldTheory Layers 7 and 8.

**Checks.**

- the inducing character takes `−1` to `−1`.
- the character for `τ₋₃` takes `1 + 3√−3` to `1`; that for the extended types (0.5) takes it to `ζ`.
- the character for `τ₃` takes `1 + √3` to a nontrivial cube root of unity: `τ₃` is wildly ramified.

### 0.5 The conductor-243 extended types

**Definition.** For `i ∈ ℤ/3`, `τ′_i` is the unique extended 3-type whose restriction to `W_{ℚ₃(√−3)}` corresponds to the character of `ℚ₃(√−3)^×` with values in `ℚ₃(ζ)^×` given by `√−3 ↦ ζ − ζ^{−1}`, `−1 ↦ −1`, `4 ↦ 1`, `1 + 3√−3 ↦ ζ`, `1 + √−3 ↦ ζ^i`. This fixes the full Weil representation, including the value at a uniformizer; its inertial restriction has finite image, but the Weil representation itself does not, and an unramified twist of the inertial restriction alone does not determine `τ′_i`.

- the character determines the rank-two Weil representation `τ′_i`.
- the inducing character takes `√−3`, `−1`, `4`, `1 + 3√−3` and `1 + √−3` to `ζ − ζ^{−1}`, `−1`, `1`, `ζ` and `ζ^i`, respectively.
- restriction to `I₃` gives an irreducible inertial type, forgetting only the Frobenius datum.
- among extensions of that inertial type, the value `ζ − ζ^{−1}` at `√−3` singles out `τ′_i`.
- `σ_{τ′_i}` is a representation of `Ũ₀(3)`, including the action of `w₃`; it is used in 0.8 and in the lifting theorem 6.5.

*Construction.* Check the relations on `ℚ₃(√−3)^×`, induce to `W_{ℚ₃}`, and compare with the definition of extended types (LocalGaloisDeformationRings §3.12) and 0.1 case 3. The determinant is `χ₁χ₂` with `χ₁` of finite order prime to 3 and `χ₂` unramified sending arithmetic Frobenius to 3, as required of an extended type of a Barsotti–Tate representation. (BCDT, §2.1, (2.1.1), p. 861; §3.4, pp. 867–868.) *Needs:* 0.1, LocalGaloisDeformationRings §3.12, TauCetiRoadmap ClassFieldTheory Layers 7 and 8.

**Checks.**

- `(ζ − ζ^{−1})² = −3` in characteristic zero, matching `(√−3)² = −3`; assigning a root of unity to the uniformizer fails.
- the character takes `1 + 3√−3` to `ζ`, not `1`: `τ′_i` is not an extension of `τ₋₃`.
- multiplying the uniformizer value by `−1` keeps the inertial restriction but gives a different extended type.
- at `i = 0, 1, 2` the value on `1 + √−3` is `1, ζ, ζ²`.

### 0.6 Simple admittance for the cubic types

**Theorem.** If `ρ̄ : G₃ → GL₂(𝔽₃)` is continuous and `ρ̄|_{I₃} ≅ (1, ∗; 0, ω)` is très ramifié, then `τ₁` and `τ₋₁` simply admit `ρ̄`. More precisely, the reduction of `σ_{τ₁}` has constituents `σ_{0,0}, σ_{2,0}, σ_{0,1}, σ_{2,1}`, the last two with multiplicity one; that of `σ_{τ₋₁}` has constituents `σ_{0,0}, σ_{2,1}, σ_{0,1}`, the last two with multiplicity one; and the unique constituent admitting `ρ̄` is `σ_{2,1}` in both cases.

*Proof sketch.* `σ_{τ₁}` is induced from `U₀(9)` of a character of order three, so its reduction has the constituents of the reduction of `Ind_{U₀(9)}^{GL₂(ℤ₃)} 1`; by Brauer characters `Ind_{U₀(9)}^{U₀(3)} 1` reduces to `σ′_{0,0}, σ′_{0,0}, σ′_{1,1}`, and induction in stages gives the list. For `τ₋₁`, `σ_{τ₋₁}` is induced from the group of `(a, b; c, d)` with `a ≡ d`, `b + c ≡ 0 mod 3`, and its reduction has the constituents of `1 ⊕ sp_ψ ⊕ Θ(φ)` in the notation of CDT §3.1; CDT Lemma 3.1.1 decomposes these. Then apply PadicLocalLanglandsForGL2Qp §5.13: `σ_{n,m}` admits `ρ̄` iff `m = 1`, `n = 2`. (BCDT, Lemma 2.1.1, p. 861; §§3.1–3.2, pp. 866–867; §1.3, pp. 854–856.) *Needs:* 0.1, 0.3; PadicLocalLanglandsForGL2Qp §§2.8, 5.13.

**Checks.**

- A peu ramifié `ρ̄` of the same shape is also admitted by `σ_{0,1}`, so `τ₁` and `τ₋₁` admit it but not simply: the très hypothesis is used.
- Finding one constituent that admits `ρ̄` proves only admittance; uniqueness and multiplicity one are separate assertions.

### 0.7 Simple admittance for the quadratic types

**Theorem.** If `ρ̄ : G₃ → GL₂(𝔽₃)` is continuous and `ρ̄|_{I₃} ≅ (ω, ∗; 0, 1)` is très ramifié, then `τ₃` and `τ₋₃` simply admit `ρ̄`. Each `σ_{τ±3}` reduces to exactly `σ′_{0,0}` and `σ′_{1,1}` on `U₀(3)`, each with multiplicity one, and `σ′_{0,0}` is the unique constituent admitting `ρ̄`.

*Proof sketch.* `σ_{τ±3}` is induced from the index-two subgroup `{a ≡ d, c ≡ 0 mod 3}` of `U₀(3)` of a character of order three, so its reduction has the constituents of the induced trivial character: the two characters of the quotient of order two. The très rule for `σ′_{m,m}` selects `m = 0`. (BCDT, Lemma 2.1.3, p. 862; §3.3, p. 867; §1.3, pp. 854–856.) *Needs:* 0.1, 0.4; PadicLocalLanglandsForGL2Qp §§2.8, 5.13.

**Checks.**

- The reduction has two one-dimensional constituents, not a `GL₂(𝔽₃)` symmetric-power decomposition (`U_τ = U₀(3)` because `τ±3` is irreducible).
- For a peu ramifié `ρ̄` of this shape, `σ′_{0,0}` admits but does not simply admit: the conclusion fails.

### 0.8 Simple admittance for the extended types

**Theorem.** For every `i ∈ ℤ/3` and continuous `ρ̄ : G₃ → GL₂(𝔽₃)` that is a très ramifié extension `(ω, ∗; 0, 1)` of `G₃`-modules, `τ′_i` simply admits `ρ̄`. The reduction of `σ_{τ′_i}` has constituents `σ′_{{0},1}, σ′_{{1},1}, σ′_{{0},−1}, σ′_{{1},−1}`, the last two with multiplicity one, and the unique constituent admitting `ρ̄` is `σ′_{{0},−1}`.

*Proof sketch.* For the character `χ` of (2.1.1), `χ(1 + x) = ψ(tr(x√−3/54))` for `x ∈ (3√−3)`, which computes the auxiliary character `χ″` of 0.1 case 3: `χ″(√−3) = (ζ − ζ^{−1})^{−1}`. So `σ_{τ′_i}` is induced to `Ũ₀(3)` from a character of the group generated by `w₃` and `{(a, b; 3c, d) : a ≡ d, b + c ≡ 0 mod 3}`, trivial on `w₃` and of order three on the latter; its reduction has the constituents of the reduction of `1 ⊕ 1 ⊕ ν`, with `ν` the character sending `w₃` to `−1`, induced up, which gives the list. By PadicLocalLanglandsForGL2Qp §5.13 only `m = 0` and `a = −1` work, since the quotient character of `ρ̄` is trivial. (BCDT, Lemma 2.1.5, p. 862; §3.4, pp. 867–868; §1.3, pp. 855–856.) *Needs:* 0.1, 0.5; PadicLocalLanglandsForGL2Qp §§2.8, 5.13.

**Checks.**

- The hypothesis is on `ρ̄` as a `G₃`-representation: if the quotient character were the unramified quadratic character, `σ′_{{0},1}` would be selected instead, and the multiplicity of that constituent is not one.
- The admitting constituent has `w₃`-eigenvalue `−1` when the quotient character is trivial.

### Examples

- `ζ = (0, −1; 1, −1) ∈ GL₂(ℤ₃)` has order three and `(ζ − ζ^{−1})² = −3`.
- The admittance computations of 0.6–0.8 are all instances of the rules of PadicLocalLanglandsForGL2Qp §5.13 with `ℓ = 3`, where `ω` has order two and `ω^{1−m}` depends only on `m mod 2`.

### Dependencies

PadicLocalLanglandsForGL2Qp §§0.3, 2.8, 4.4, 5.13; LocalGaloisDeformationRings §3.12 (types, extended types, type quotients); GL2AutomorphicRepresentationsAndTransfer Layers R16.2–R16.3 (local Langlands correspondence, supercuspidal types); AlgebraicModularFormsAndSerreWeights (Serre weights); ArithmeticGaloisRepresentations §1.8; TauCetiRoadmap ClassFieldTheory Layers 7–8, RepresentationTheory.

## Layer W3.1: Local arithmetic of ℚ₃: explicit fields, the six cases and the local companions

This layer collects the arithmetic of `ℚ₃` that the proof needs: the structure of `H¹(G₃, ω)` and its pairing with the unramified line (1.1); the power series attached to a uniformizer that enter the Breuil calculus (1.2); the five families of explicit splitting fields of the wild types, with their Galois groups, uniformizers and descent data (1.3–1.7); two finite group calculations (1.8); the six normal forms of a mod-5 representation of `G₃` with cyclotomic determinant (1.9–1.10); Manoharmayum's local elliptic curves (1.11–1.12); the comparison across primes for potentially good abelian varieties over finite extensions of `ℚ_p`, with number-field action, and its elliptic specialization (1.13); the extended Frobenius sign (1.14); the rationality of the twisted curve `X_ρ̄(5)` over every field of characteristic zero (1.15); and the local companion curves with prescribed 5-torsion and 3-torsion (1.16).

All fields are subfields of the fixed algebraic closure `AlgebraicClosure ℚ₃` (Mathlib `AlgebraicClosure (Padic 3)`); `j` denotes a square root of `−1`. Local reciprocity is normalized so that uniformizers map to arithmetic Frobenius (TauCetiRoadmap ClassFieldTheory §2.6 and Layer 7).

### 1.1 Kummer theory of ℚ₃ in degree three

**Theorem.** Specializing the general Kummer/duality statements of ClassFieldTheory and the local cohomology dimensions of LocalGaloisGroups Layer 1, this target adds the explicit basis `[3], [4]`, its two ramification lines and the restriction criterion over `ℚ₃`. Let `ω` be the mod-3 cyclotomic character of `G₃`, so `𝔽₃(ω) = μ₃`. (1) Kummer theory gives `H¹(G₃, ω) ≅ ℚ₃^×/(ℚ₃^×)³ ≅ 𝔽₃²`, with basis the classes of `3` and `4`; `H⁰(G₃, ω) = 0` and `H²(G₃, ω) ≅ 𝔽₃`. (2) The *unit line* `ℤ₃^×/(ℤ₃^×)³`, spanned by the class of `4`, is one-dimensional. Use the unit-Kummer condition of PadicLocalLanglandsForGL2Qp §0.3: the explicit unit line just computed detects peu ramifié extensions, and its complement detects très ramifié extensions. (3) `H¹(G₃, 𝔽₃) = Hom(ℚ₃^×, 𝔽₃)` is two-dimensional, and its *unramified line* `H¹(G₃/I₃, 𝔽₃) = Hom(ℚ₃^×/ℤ₃^×, 𝔽₃)` is one-dimensional. (4) Under the local duality pairing `H¹(G₃, 𝔽₃) × H¹(G₃, ω) → H²(G₃, ω) ≅ 𝔽₃`, the unramified line and the unit line are exact annihilators of each other; in particular the unramified line pairs nontrivially with every très ramifié class. (5) For a finite **Galois** extension `F′/ℚ₃` not containing `√−3`, restriction `H¹(G₃, ω) → H¹(G_{F′}, ω)` is injective.

- `dim H¹(G₃, ω) = 2`, `dim H¹(G₃, 𝔽₃) = 2`, `dim H²(G₃, ω) = 1`.
- the unit Kummer classes and the unramified additive characters each form a line over `𝔽₃`.
- an extension is peu ramifié exactly when its Kummer class lies on the unit line, and is très ramifié exactly when it lies outside that line.
- under the perfect local duality pairing, the annihilator of the unramified line is precisely the unit line, and conversely.
- injectivity of restriction for finite Galois `F′/ℚ₃` when `ω|_{G_{F′}} ≠ 1`.

*Proof sketch.* (1) is the Kummer isomorphism for `μ₃` (Tau Ceti `TauCeti.ClassFieldTheory.kummerEquiv`, which needs `3` invertible in the field, true in characteristic zero), together with `ℚ₃^× = 3^ℤ × μ₂ × (1 + 3ℤ₃)` and `(1 + 3ℤ₃)/(1 + 9ℤ₃) ≅ ℤ/3` generated by `4`; `H⁰ = 0` because `√−3 ∉ ℚ₃`, and `H²(G₃, μ₃) ≅ 𝔽₃` is the Brauer group statement. (3) is local reciprocity. (4) is the identification of the cup product pairing `H¹(𝔽₃) × H¹(μ₃) → H²(μ₃)` with the pairing `(χ, a) ↦ χ(Art(a))`: a nonzero unramified `𝔽₃`-valued character has kernel `3^{3ℤ}ℤ₃^×` on `ℚ₃^×`, hence kernel exactly the unit line on cube classes, and local duality (Tau Ceti `dualityMap1_kummerCoeff_bijective`) makes the pairing perfect. (5) is inflation–restriction for the normal subgroup `G_{F′} ◁ G₃`, with `H⁰(G_{F′}, ω) = 0`. (BCDT, proof of Lemma 4.7.1, p. 882, citing Serre, *Corps locaux*, Ch. XIV §1 Prop. 3.) *Needs:* PadicLocalLanglandsForGL2Qp §0.3 (the unit-Kummer convention), TauCetiRoadmap LocalGaloisGroups Layer 1 (general local cohomology dimensions), TauCetiRoadmap ClassFieldTheory Layers 5 and 7 (Kummer isomorphism, local Tate duality, local Artin map), Tau Ceti `kummerEquiv`, `dualityMap1_kummerCoeff_bijective`, `localArtinMap`.

The headline `cubeClass_coordinates` states the unique coordinates in `[3], [4]` for every nonzero element of `Q3`.

**Checks.**

- The coordinates of `1, 3, 4, 12, 27, 64, 1/3` are respectively `(0,0), (1,0), (0,1), (1,1), (0,0), (0,0), (2,0)`. In particular `[4] ≠ 0`; `[3]` and `[12]` are très ramifié, whereas `[4]` is peu ramifié. Zero is excluded: choosing the cube factor zero would give all nine coordinate pairs.
- The zero Kummer class, `[4]` and `[3]` have `(peu, très) = (true,false), (true,false), (false,true)`; the split extension is included in the unit line.
- Normalize an unramified character by `χ(3) = 1`. Then `χ(4) = 0` and `χ(27) = 0`, although `27` is not a unit: it is a cube. The kernel in the nine cube classes consists of the three unit classes.
- The non-Galois extension `L = ℚ₃(∛3)` has degree three and does not contain `√−3`, but kills the nonzero Kummer class of `3`. Thus the Galois hypothesis in (5) is necessary; nontriviality of `ω|_{G_L}` alone does not suffice.
- The extension of `1` by `ω` cut out by `ℚ₃(√−3, ∛3)` is très ramifié; the one cut out by `ℚ₃(√−3, ∛4)` (equivalently `∛2`, since `4 = 2²`) is peu ramifié.
- `dim H¹(G₃, ω) = 2`, whereas the Tau Ceti formula `dim H¹(G_K, 𝔽₃) = [K : ℚ₃] + 2` applies only when `μ₃ ⊆ K`; over `ℚ₃` itself `H¹(G₃, 𝔽₃)` has dimension 2, not 3.

### 1.2 Eisenstein and descent-correction data of a uniformizer

**Definition.** Let `ℓ` be an odd prime, `R` a complete discrete valuation ring of mixed characteristic `(0, ℓ)` with perfect residue field `k`, fraction field `F′` and absolute ramification index `e`, `π` a uniformizer, and `Γ` a finite group acting faithfully and continuously on `R`. Define:

- `G_π(u) ∈ W(k)[u]`, of degree `< e` with unit constant term, by `E_π(u) = u^e − ℓ·G_π(u)` being the minimal polynomial of `π` over `W(k)[1/ℓ]`;
- `c_π = −φ(G_π(u)) ∈ (k[u]/(u^{eℓ}))^×`, where `φ` is the `ℓ`-th power map;
- for `g ∈ Γ`, the unique polynomial `H_g(u) ∈ W(k)[u]` of degree `< e` with `g(π) = π·H_g(π)`, viewed as a unit of `W(k)[[u]]` (`H_1 = 1`), and the ring automorphism `ĝ(Σ w_i u^i) = Σ g(w_i)·u^i·H_g(u)^i` of `W(k)[[u]]` and of `k[u]/(u^{eℓ})`;
- `t_g(u) ∈ W(k)[[u]]`, the unique series with `u^ℓH_g(u)^ℓ = u^ℓ(1 + ℓt_g(u))·(φH_g)(u^ℓ(1 + ℓt_g(u)))`, equivalently `ĝ ∘ φ = φ_g ∘ ĝ` for the Frobenius `φ_g` twisted by `1 + ℓt_g`;
- for `g₁, g₂ ∈ Γ` and `h = g₁g₂`, the unique `f_{g₁,g₂} ∈ E_π(u)·W(k)[[u]]` with `ĝ₁ ∘ ĝ₂(u) = ĥ(u(1 + f_{g₁,g₂}(u)))`.

The API of these definitions:

- `G_π`, `c_π`, `H_g`, `t_g` and `f_{g₁,g₂}` satisfy the displayed equations in their specified polynomial, truncated-polynomial and power-series rings.
- the minimal polynomial fixes `G_π` and `c_π`; the degree bound fixes `H_g`, and the displayed power-series equations fix `t_g` and `f_{g₁,g₂}` uniquely.
- if `π` is fixed by `Γ` then `H_g = 1`, `t_g = 0` and `f_{g₁,g₂} = 0`.
- `ĝ₁ ∘ ĝ₂` and `ĥ` (`h = g₁g₂`) agree up to the correction `f_{g₁,g₂}`.

*Construction.* `G_π` from the Eisenstein polynomial; `H_g` exists because `g(π)/π` is a unit of `R = W(k)[π]`. `t_g` is obtained by inverting `u ↦ uH_g(u)` in `uW(k)[[u]]^×` and dividing by `u^ℓ`; `f_{g₁,g₂}` by comparing `ĝ₁ ∘ ĝ₂(u)` with `ĥ(u)` for `h = g₁g₂`, both of which send `π` to `g₁g₂(π)`, so they differ by a multiple of `E_π`. (BCDT, §5.1, (5.1.1), p. 883; §5.4, p. 890; Lemma 5.5.1, p. 894; §5.6, pp. 896–897; §6, p. 899.) *Needs:* Mathlib `WittVector`, `PowerSeries`, `Polynomial.IsEisensteinAt`; TauCetiRoadmap LocalFieldsRamification Layer 3 (Eisenstein generators of totally ramified extensions).

**Checks.**

- For the cyclic cubic field (1.3), `G(u) = u² − 1` and `c_π ≡ 1 − u⁶` in `𝔽₃[u]/(u⁹)`: the minus sign in `c_π = −φ(G)` is visible in the constant term `c_π(0) = 1 = −G(0)`.
- If `π` is `Γ`-invariant, all of `H, t, f` are trivial (the invariant-uniformizer case of 1.2); for the conductor-243 fields `t_{γ₃} ≢ 0` (1.7).
- `H_g` is determined by `g` only up to adding multiples of `E_π(u)`; fixing the representative of degree `< e` makes `ĝ`, and hence `t_g` and `f_{g₁,g₂}`, well defined, and `H_1 = 1` forces `t_1 = 0`.

### 1.3 The cyclic cubic field (`cyclicCubicField`)

**Construction.** Let `π` be a root of `X³ − 3X² + 3` and `F₁ = F′₁ = ℚ₃(π)`. It is a totally ramified cyclic cubic extension with uniformizer `π`; the other roots are `π² − 2π` and `3 + π − π²`, and `γ₃ : π ↦ π² − 2π` generates `Gal(F₁/ℚ₃)`. In `𝔽₃[u]/(u⁹)`: `G(u) = u² − 1`, `c_π = 1 − u⁶`, `H_{γ₃}(u) = u − 2`.

- the minimal polynomial of `π` is `X³ − 3X² + 3`, with the other two roots as displayed.
- `v₃(π) = 1/3`; `[F₁ : ℚ₃] = e = 3`, `f = 1`.
- `cyclicCubic_galois`: `γ₃` has order three and generates the Galois group.
- `G = u² − 1`, `c_π = 1 − u⁶`, `H_{γ₃} = u − 2`.

*Construction.* The polynomial is Eisenstein at 3; substitution shows the displayed elements are roots, so the extension is Galois, and the discriminant `81` is a square. `γ₃(π)/π = π − 2` gives `H_{γ₃}`. Any totally ramified cyclic cubic extension would do for the type `τ₁` (BCDT §4.4); this one is fixed for the calculations. (BCDT, §6.1, pp. 899–900.) *Needs:* 1.2, 0.3, TauCetiRoadmap LocalFieldsRamification Layer 3, TauCetiRoadmap ClassFieldTheory Layer 8, Mathlib `Padic`, `IntermediateField.adjoin`, `AlgebraicClosure`.

**Checks.**

- both displayed conjugates satisfy `X³ − 3X² + 3 = 0`; a sign error in `γ₃` breaks this.
- `G(0) = −1` and `c_π(0) = 1`.
- `γ₃³(π) = π` and `γ₃(π) ≠ π`.

The headline `cyclicCubic_galois` states the degree and generating automorphism of `cyclicCubicField`.

### 1.4 The nonabelian cubic splitting field (`nonabelianCubicSplittingField`)

**Construction.** Let `π` be a root of `X³ − 3X² + 6`, `F₋₁ = ℚ₃(π)` and `F′₋₁ = F₋₁(j)`. Then `F₋₁/ℚ₃` is totally ramified of degree 3 and not Galois, `F′₋₁/F₋₁` is unramified quadratic, and `Gal(F′₋₁/ℚ₃) ≅ S₃` is generated by `γ₂` (fixing `π`, `j ↦ −j`) and `γ₃` (fixing `j`, `π ↦ (jπ² − π + 3(1 − j))/2`), with `γ₂² = γ₃³ = 1` and `γ₂γ₃ = γ₃²γ₂`. Breuil data: `G = u² − 2`, `c_π = −1 − u⁶`, `H_{γ₂} = 1`, `H_{γ₃} = ((j − 1)u² + (3 − j)u − 2)/4`. `F′₋₁` is the unique cubic extension of `ℚ₃(j)` that is Galois and nonabelian over `ℚ₃`.

- degrees 3 and 6, common ramification index 3, residue degrees 1 and 2.
- `γ₂, γ₃` generate with the stated relations.
- `π` is a uniformizer of both fields.
- the four polynomials satisfy `γ(π) = πH_γ(π)` and `c_π = −φ(G)`.

*Construction.* As in 1.3; the discriminant of `X³ − 3X² + 6` is `−324 = −18²`, not a square in `ℚ₃` since `−1` is not, so the Galois closure has group `S₃` and contains `ℚ₃(√−1)`. (BCDT, §6.2, p. 900; §4.4, p. 875.) *Needs:* 1.2, 0.3, TauCetiRoadmap LocalFieldsRamification Layers 2–3, TauCetiRoadmap ClassFieldTheory Layer 8, Mathlib `Padic`, `IntermediateField.adjoin`, `AlgebraicClosure`.

**Checks.**

- the displayed `γ₃(π)` satisfies `X³ − 3X² + 6 = 0`.
- `γ₂γ₃γ₂^{−1} = γ₃^{−1}`: the generators do not commute.
- `c_π(0) = −1`, whereas the cyclic cubic has `c_π(0) = 1`.

The headline `nonabelianCubic_finrank` states the degrees of the root field and `nonabelianCubicSplittingField`, and the failure of normality of the root field.

### 1.5 The positive ramified quadratic field

**Construction.** Let `s² = 3`, `α³ − 3α + 3 = 0`, `β² = s`, and `F′₃ = ℚ₃(s, j, α, β)`: degree 24, `e = 12`, `f = 2`, residue field `𝔽₉`. It is the abelian extension of `ℚ₃(s)` of degree 12 whose norm group is topologically generated by `3, 4, 1 + 3s`, and it is Galois over `ℚ₃`. Fix `q ∈ 1 + 3ℤ₃` with `q² = −5`. `Gal(F′₃/ℚ₃)` is generated by `γ₂` (fixing `α, β`, `j ↦ −j`), `γ₃` (fixing `j, β`, `α ↦ (−2sα² − (3s + q)α + 4s)/(2q)`) and `γ₄` (fixing `α, j`, `β ↦ jβ`), with `γ₂² = γ₃³ = γ₄⁴ = 1`, `γ₂γ₃ = γ₃γ₂`, `γ₄γ₂ = γ₂γ₄^{−1}`, `γ₄γ₃ = γ₃²γ₄`; `γ₄²` has order two and is the unique element of order two of the inertia subgroup over `ℚ₃(s)`. `γ₂` acts on `𝔽₉` by cubing and `γ₃, γ₄` act trivially on it. `π = α/β` is a uniformizer, with Eisenstein polynomial of the form `u¹² − 3G(u)`, and `F₃ = (F′₃)^{γ₂} = ℚ₃(π)`. Breuil data: `G(0) = 1`, `c_π(0) = −1`, `H_{γ₂} = 1`, `H_{γ₄} = −j`, `H_{γ₃} ≡ 1 + u² mod (3, u⁴)`, and `t_g = f_{g,g′} = 0` for `g, g′ ∈ ⟨γ₂, γ₄⟩`.

- the norm group over `ℚ₃(s)` is the closure of `⟨3, 4, 1 + 3s⟩`.
- the generators act as displayed and satisfy the relations; `γ₄²` has order two.
- `v₃(α/β) = 1/12` and `α/β` generates the `γ₂`-fixed field.
- the constant terms and congruences of `G, c_π, H, t, f` as displayed.

*Construction.* Check abelianness over `ℚ₃(s)` from the explicit conjugates of `α`, and the norm group from `N(α/β) = 3`, `N(1 + α) = 5⁴` and the conductor; local existence and uniqueness of class fields identify the field. Choose `γ₄` in the inertia group outside that over `ℚ₃(s)` and normalize it with `γ₄(β) = jβ`. Compute `γ₃(π)/π ≡ 1 + π² mod π⁴`. (BCDT, §6.3, pp. 900–901; §4.5, p. 876. The source states at two places that `γ₄²` has order three; it has order two, since `γ₄²(β) = −β`.) *Needs:* 1.2, 0.4, TauCetiRoadmap LocalFieldsRamification Layers 2–3, TauCetiRoadmap ClassFieldTheory Layer 8 (local reciprocity for finite abelian extensions, `localAbelianGaloisEquiv`; local existence), Mathlib `Padic`, `IntermediateField.adjoin`, `AlgebraicClosure`.

**Checks.**

- `v₃(α/β) = 1/3 − 1/4 = 1/12`.
- `γ₄²(β) = j·jβ = −β ≠ β` and `(γ₄²)² = 1`: `γ₄²` has order two.
- `G(0) = 1` and `c_π(0) = −1` (the opposite signs from 1.6).

The headline `positiveQuadratic_finrank` uses `degreeTwelveSplittingField` to state degree 24.

### 1.6 The negative ramified quadratic field

**Construction.** Let `s² = −3`, `α³ = 4`, `β² = −s`, and `F′₋₃ = ℚ₃(s, j, α, β)`: degree 24, `e = 12`, `f = 2`. Over `ℚ₃(s)` its norm group is topologically generated by `−3, 4, 1 + 3s`. The generators `γ₂, γ₃, γ₄` respectively fix `α, β` and negate `j`; fix `j, β` and send `α ↦ (−1 − s)α/2`; fix `α, j` and send `β ↦ jβ`; as in 1.5, `γ₂² = γ₃³ = γ₄⁴ = 1`, `γ₂γ₃ = γ₃γ₂`, `γ₄γ₂ = γ₂γ₄^{−1}`, `γ₄γ₃ = γ₃²γ₄`, `γ₄²` has order two, the residue field is `𝔽₉`, `γ₂` acts on it by cubing and `γ₃, γ₄` act trivially. The uniformizer is `π = (α − 1)/β`, and `F₋₃ = (F′₋₃)^{γ₂} = ℚ₃(π)`. In the Eisenstein presentation `u¹² − 3G`: `G(0) = −1`, `c_π(0) = 1`; `H_{γ₂} = 1`, `H_{γ₄} = −j`, `H_{γ₃} ≡ 1 + u² mod (3, u⁴)`; corrections vanish on `⟨γ₂, γ₄⟩`.

- the norm subgroup over `ℚ₃(s)`, the three Galois generators and their relations, the uniformizer `(α − 1)/β` with valuation `1/12`, and the values `G(0)`, `c_π(0)`, `H_{γ₂}`, `H_{γ₄}`, `H_{γ₃} mod (3, u⁴)`, with the normalization of 1.5.

*Construction.* As in 1.5. `α − 1` is a root of `(X + 1)³ − 4 = X³ + 3X² + 3X − 3`, which is Eisenstein, so `v₃(α − 1) = 1/3`, while `v₃(β) = 1/4`. (BCDT, §6.4, pp. 901–902. The source gives the uniformizer as `α/β`; since `α³ = 4` is a unit, `v₃(α/β) = −1/4`, and the Eisenstein and descent data must be computed at `(α − 1)/β`. Two Galois-group labels there carry the subscript of the positive field.) *Needs:* 1.2, 0.4, TauCetiRoadmap LocalFieldsRamification Layers 2–3, TauCetiRoadmap ClassFieldTheory Layer 8, Mathlib `Padic`, `IntermediateField.adjoin`, `AlgebraicClosure`.

**Checks.**

- `v₃(α/β) = −1/4` while `v₃((α − 1)/β) = 1/12`: the printed formula is not a uniformizer.
- `N_{F′₋₃/ℚ₃(s)}((α − 1)/β) = −3`: the norm of `α − 1` from `ℚ₃(s, α)` is `3`, raised to the fourth power, and that of `β` is `s⁶ = −27`.
- `G(0) = −1` and `c_π(0) = 1`.

The headline `negativeQuadratic_finrank` states degree 24 on the same carrier.

### 1.7 The three conductor-243 fields

**Construction.** For `i ∈ ℤ/3` let `ĩ ∈ {0, 1, 2}` be its lift, `s² = −3`, `α³ = 3(1 + 3ĩ)`, `β² = −s`, and `F′_i = ℚ₃(s, j, α, β)`: degree 24, `e = 12`, `f = 2`, the abelian extension of `ℚ₃(s)` with norm group topologically generated by `−3, 4, 1 + 9s, 1 + (1 − 3ĩ)s`. The generators: `γ₂(j) = −j`, `γ₂(α) = α`, `γ₂(β) = β` (a Frobenius lift, corresponding to `√−3` under reciprocity); `γ₃` fixes `j, β` and sends `α ↦ (−1 − s)α/2`; `γ₄` fixes `j, α` and sends `β ↦ jβ`; `γ₂² = γ₃³ = γ₄⁴ = 1`, `γ₂γ₃ = γ₃γ₂`, `γ₄γ₂ = γ₂γ₄^{−1}`, `γ₄γ₃ = γ₃²γ₄`, `γ₄²` has order two, the residue field is `𝔽₉`, `γ₂` acts on it by cubing and `γ₃, γ₄` act trivially. `π = α/β` is a uniformizer, `π¹² = −3(1 + 3ĩ)⁴`, and `F_i = (F′_i)^{γ₂} = ℚ₃(π)`. Breuil data: `G = −(1 + 3ĩ)⁴`, `c_π = 1` in `𝔽₃[u]/(u³⁶)`; exactly `H_{γ₃^{±1}} = −(1 ∓ (1 + 3ĩ)^{−2}u⁶)/2`, hence `H_{γ₃^{±1}} ≡ 1 ∓ u⁶ mod 3` and `t_{γ₃^{±1}} ≡ −1 ∓ u⁶ mod (3, u¹²)`; `H_{γ₂} = 1`, `H_{γ₄} = −j`; corrections on `⟨γ₂, γ₄⟩` vanish, and `f_{γ₃^{±1},γ₃^{±1}}`, `f_{γ₃^{±1},γ₃^{∓1}}` vanish modulo `(3, u¹²)`.

- the four norm generators, which distinguish `i = 0, 1, 2` and identify the field by reciprocity.
- the explicit generators realize the presentation, `γ₂` being a Frobenius lift.
- `π = α/β` is a uniformizer with `π¹² = −3(1 + 3ĩ)⁴`.
- `H, t, f` as displayed; in particular `t_{γ₃} ≠ 0`.
- `ĩ` is the unique integer in `{0, 1, 2}` reducing to `i`.

*Construction.* As in 1.5; `π¹² = α¹²/β¹² = (3(1 + 3ĩ))⁴/(−s)⁶ = −3(1 + 3ĩ)⁴`, and `t, f` are computed from the exact `H_{γ₃}` with the formulas of 1.2. (BCDT, §6.5, pp. 902–904; §4.6, p. 877.) *Needs:* 1.2, 0.5, TauCetiRoadmap LocalFieldsRamification Layers 2–3, TauCetiRoadmap ClassFieldTheory Layer 8, Mathlib `Padic`, `IntermediateField.adjoin`, `AlgebraicClosure`.

**Checks.**

- at `i = 2`: `α³ = 21` and `π¹² = −3·7⁴`. Reducing `ĩ` before cubing would lose the field.
- `H_{γ₃} ≡ 1 − u⁶` but `t_{γ₃} ≡ −1 − u⁶`: wild descent is not ordinary commuting descent.
- `γ₂` fixes `α, β` and acts by cubing on `𝔽₉`; an inertia element in its place fails the Frobenius condition.
- `c_π = 1` for all three indices.

The headline `extendedTypeField_finrank` states degree 24 for each of the three indices on the same carrier.

### 1.8 Two finite group calculations

**Theorem.** Fix `ζ ∈ GL₂(𝔽₅)` of order three. (1) A subgroup of `GL₂(𝔽₅)` with a nontrivial normal subgroup of 3-power order is conjugate into the normalizer `N` of the nonsplit Cartan `𝔽₂₅^× ⊂ GL₂(𝔽₅)` containing `ζ`. (2) `N ∩ SL₂(𝔽₅)` is generated by `ζ` and an element `α` with `α² = −1` and `αζα^{−1} = ζ^{−1}`. (3) If `β ∈ 𝔽₂₅^×` has `det β = 3` and `αβα^{−1} = −β`, then `β = ±(ζ − ζ^{−1})`. (4) `SL₂(𝔽₃)` is the unique subgroup of index two of `GL₂(𝔽₃)`, and a subgroup of `GL₂(𝔽₃)` of order at least 24 on which `det` is surjective is all of `GL₂(𝔽₃)`.

- The four assertions respectively describe the Cartan normalizer, its determinant-one subgroup, the determinant-three elements, and the index-two subgroup over 𝔽₃.

*Proof sketch.* (1): the 3-Sylow subgroups of `GL₂(𝔽₅)` have order three and lie in nonsplit Cartans (`3 ∤ 5 − 1`, `3 | 25 − 1`), and a nontrivial 3-subgroup determines its Cartan. (2): `N ∩ SL₂` has order 12: the norm-one elements of `𝔽₂₅^×` (order 6, generated by `−ζ`) and the semilinear elements of determinant one. (3): `αβα^{−1} = β^5` (conjugation by `α` is the Frobenius of `𝔽₂₅`), so `β⁴ = −1`, and with `N(β) = β⁶ = 3` this leaves `±(ζ − ζ^{−1})`, whose norm is `−(ζ − ζ^{−1})² = 3`. (4): the abelianization of `GL₂(𝔽₃)` is `𝔽₃^× ≅ ℤ/2`, its commutator subgroup being `SL₂(𝔽₃)`. (BCDT, proof of Theorem 2.2.1, pp. 863–864, where (1)–(3) are listed as easily verified facts; Shepherd-Barron–Taylor, §1.) *Needs:* ArithmeticGaloisRepresentations §4.2 (Borel and Cartan subgroups), §4.3, Mathlib `Matrix.GeneralLinearGroup`, `Matrix.SpecialLinearGroup`, `GaloisField`.

**Checks.**

- `ζ = (0, −1; 1, −1)` has order three in `GL₂(𝔽₅)` and `(ζ − ζ^{−1})² = −3 = 2` in `𝔽₅`.
- The subgroup of upper triangular matrices of `GL₂(𝔽₅)` has order 80, prime to 3, so it has no nontrivial normal 3-subgroup and (1) does not apply to it.
- `|GL₂(𝔽₃)| = 48` and `|SL₂(𝔽₃)| = 24`; the Borel subgroup of `GL₂(𝔽₃)` has order 12 and surjective determinant, so the bound 24 in (4) is needed.

### 1.9 The six switching cases at three

**Definition.** Fix `ζ ∈ GL₂(𝔽₅)` of order three, with `𝔽₅(ζ) = 𝔽₂₅`. For a continuous `ρ̄ : G₃ → GL₂(𝔽₅)` with cyclotomic determinant and a recorded quadratic character `χ`, define the six predicates (*tags*) below up to conjugacy on the representative `ρ̄ ⊗ χ`, denoted again by `ρ̄`. The values in the tag specify its normalization; 1.10 proves that some `χ` gives one of these tags. In case 3 the twist is chosen so that the character is trivial on the full tame unit group `μ₈ = ⟨ξ⟩`, as well as having the stated uniformizer value:

1. `ρ̄` is tamely ramified.
2. `ρ̄` is given by the character of `ℚ₃^×` (via reciprocity) with `3 ↦ ζ^i(ζ − ζ^{−1})`, `−1 ↦ 1`, `4 ↦ ζ`, for some `i ∈ ℤ/3`.
3. `ρ̄|_{G_{ℚ₃(j)}}` is given by the character of `ℚ₃(j)^×` with `3 ↦ 2`, `ξ ↦ 1`, `4 ↦ 1`, `1 + 3j ↦ ζ`.
4. `ρ̄|_{G_{ℚ₃(√3)}}` is given by the character with `√3 ↦ ζ − ζ^{−1}`, `−1 ↦ −1`, `4 ↦ 1`, `1 + √3 ↦ ζ`.
5. `ρ̄|_{G_{ℚ₃(√−3)}}` is given by the character with `√−3 ↦ ζ − ζ^{−1}`, `−1 ↦ −1`, `4 ↦ 1`, `1 + 3√−3 ↦ 1`, `1 + √−3 ↦ ζ`.
6. `ρ̄|_{G_{ℚ₃(√−3)}}` is given by the character with `√−3 ↦ ζ − ζ^{−1}`, `−1 ↦ −1`, `4 ↦ 1`, `1 + 3√−3 ↦ ζ`, `1 + √−3 ↦ ζ^i`, for some `i ∈ ℤ/3`.

In tag 2 the character valued in `𝔽₂₅^×` acts on the two-dimensional `𝔽₅`-space `𝔽₂₅`. In tags 3–6 it describes the restriction to the quadratic subgroup; the element outside that subgroup acts through the nonsplit Cartan normalizer. Equivalently, embed `𝔽₂₅` in `𝔽̄₅`, induce the **one-dimensional** `𝔽̄₅`-character, and take the resulting two-dimensional representation's `𝔽₅`-form. One does not induce the two-dimensional `𝔽₅` restriction, which would have dimension four. These six tags are not the six conductor exponents of the introduction of the source: tag 1 covers exponents `0, 1, 2`, tags 2–3 have exponent 4, tags 4–5 exponent 3 and tag 6 exponent 5.

- tag 1 iff the wild inertia image is trivial.
- for tags 2–6 the inducing character has the stated uniformizer and unit values.
- membership is invariant under conjugacy; the quadratic twist and the resulting normalized representative are recorded as separate data. Sections 1.16 and 6.3–6.4 use that same representative.
- the predicates concern continuous actions of `G₃` on `𝔽₅²` and restriction to the Galois group of the quadratic subfield.

*Construction.* Direct from local reciprocity (TauCetiRoadmap ClassFieldTheory Layer 8). (BCDT, proof of Theorem 2.2.1, pp. 862–864; Introduction, pp. 846–847.) *Needs:* 0.3, 0.4, 0.5, 1.8, TauCetiRoadmap ClassFieldTheory Layer 8.

**Checks.**

- the 5-torsion of `y² = x³ − x` over `ℚ₃` (good reduction at 3) is in tag 1.
- the unit `1 + 3√−3` has nontrivial image in tag 6 and trivial image in tag 5.
- in tag 2 at `i = 0`, the uniformizer value `ζ − ζ^{−1}` has square `−3 = 2` in `𝔽₅`.
- a representation over `𝔽̄₅` with no model over `𝔽₅` is outside the definition.
- Let `η` be the quadratic character of `ℚ₃(√−3)/ℚ₃`, and `F = ℚ₃(j)`. On `F^×` the twist is `η ∘ N_{F/ℚ₃}`. The norms of `3, 4j, 4, 1 + 3j` are `9, 16, 16, 10`, all killed by `η`, whereas `N(ξ) = ξ⁴ = −1` and `η(−1) = −1`. Thus a twist with character value `−1` at `ξ` is excluded by tag 3; values at `4j` and `4` alone would not exclude it.
- In tag 3, induction of the scalar character over `𝔽̄₅` has dimension two; induction of its restriction-of-scalars representation over `𝔽₅` has dimension four and cannot define `ρ̄`.

### 1.10 Exhaustion by the six cases

**Theorem.** Every continuous `ρ̄ : G₃ → GL₂(𝔽₅)` with cyclotomic determinant is, up to conjugacy and a quadratic twist, in one of the six cases of 1.9.

*Proof sketch.* If wild inertia acts nontrivially its image is a normal subgroup of order three, so by 1.8(1) the image of `G₃` lies in the normalizer of the nonsplit Cartan through `ζ`. Local reciprocity for the fixed field of the Cartan part, which is `ℚ₃`, `ℚ₃(j)`, `ℚ₃(√3)` or `ℚ₃(√−3)`, turns `ρ̄` into a character, whose values on the listed generators are constrained by the conjugation relation and the determinant; 1.8(2)–(3) give the uniformizer value `±(ζ − ζ^{−1})`, and the sign is removed by a quadratic twist. In case 3 a ramified quadratic twist kills any order-two tame unit factor, imposing `ξ ↦ 1`; the unramified quadratic twist does not change the value at `3` on the unramified quadratic subgroup. The normalized representative, including this unit condition, is retained in 1.16 and 6.3–6.4. (BCDT, proof of Theorem 2.2.1, pp. 862–864.) *Needs:* 1.8, 1.9, TauCetiRoadmap ClassFieldTheory Layer 8.

**Checks.**

- The computation is in `GL₂(𝔽₅)`; over `GL₂(𝔽̄₅)` the normalizer statement 1.8(1) has a different form.
- A tamely ramified `ρ̄` is in case 1 with no twist.

### 1.11 Manoharmayum's curves with `e = 3`

**Theorem.** For an elliptic curve `E/ℚ₃` with potentially good reduction put `K = ℚ₃(E[5])`, `K^{nr} = K ℚ₃^{nr}`, and let `e(E)` be the order of `ρ̄_{E,5}(I₃)`. (1) If `e(E₁) = e(E₂) = 3` and `ρ̄_{E₁,5}`, `ρ̄_{E₂,5}` have the same splitting field, they agree up to the unramified quadratic twist, and are equivalent when the splitting field is nonabelian over `ℚ₃`. (2) For `e(E) = 3`, the full field `K` has degree 24 over `ℚ₃`. Choose a Frobenius lift `σ ∈ Gal(K/ℚ₃)` of order eight and put `F = K^{⟨σ⟩}`, a totally ramified cubic field over which `E` has good reduction. In the abelian case `F/ℚ₃` is cyclic and `F = ℚ₃(E[2])`. Up to the unramified quadratic twist, the curves with `e = 3` realize these mod-5 representations: nonabelian, `y² = x³ − 3x + 2b` with `b² − 1 = 3u`, `u ≡ 1 mod 3`, and `y² = x³ + 3⁴x + 2·3⁵b`, `b` a unit; abelian, with the three norm subgroups `N_{F/ℚ₃}(F^×) ⊆ ℚ₃^×` given by `⟨6⟩·(ℚ₃^×)³`, `⟨3⟩·(ℚ₃^×)³`, `⟨12⟩·(ℚ₃^×)³`, the curves `y² = x³ − 3⁴x + 2·3⁵b` with `b ≡ ±2, ±4, ±1 mod 9` respectively and `y² = x³ − 3x + 2b` with `b ≡ ±4, ±13, ±22 mod 27` respectively. (3) For each such `E`, the set `G(E)` of 3-torsion representations `ρ̄_{E′,3}` (up to the unramified quadratic twist) of curves `E′/ℚ₃` with `ρ̄_{E′,5}` equivalent to `ρ̄_{E,5}` or its twist is: in the nonabelian case, the peu ramifié class of shape `(ω, ∗; 0, 1)` and all three très ramifié classes of shape `(1, ∗; 0, ω)`; in each abelian case, the peu ramifié class of shape `(ω, ∗; 0, 1)` and exactly one très ramifié class of shape `(1, ∗; 0, ω)`, the one cut out by `∛12`, `∛6`, `∛3` respectively. Curves with `e = 6` are the ramified quadratic twists of these.

- the splitting field determines the mod-5 representation up to the specified unramified quadratic twist; the families in (2) realize each case; the sets `G(E)` are exactly those in (3).

*Proof sketch.* (1) is a computation in the normalizer of a 3-Sylow subgroup of `GL₂(𝔽₅)` (order 48), with a Frobenius lift of determinant 3. For (2), `K^{nr} = ℚ₃^{nr}(E[2])`; the representation is abelian iff the discriminant is a square, and in the abelian case `F = ℚ₃(E[2])`. The cyclic cubic fields `F`, rather than the full degree-24 fields `K`, are distinguished by the displayed norm subgroups, each of index three in `ℚ₃^×`. (3) comes from the explicit 3-division polynomial `x⁴ + 6ax² + 8bx − 3a²` of `y² = x³ + 3ax + 2b` and the dictionary between `j/1728` modulo cubes and the type of `ρ̄_{E,3}`. (Manoharmayum, Lemma 5.3.1, p. 750; the list before Theorem 5.3.2 and Theorem 5.3.2, p. 751; Propositions 3.5–3.6 and Definition 3.3, pp. 743–744; Proposition 4.2.2, pp. 746–747.) *Needs:* 1.1, TauCetiRoadmap EllipticCurves Layers 2 and 4 (torsion, minimal models, reduction over local fields), TauCetiRoadmap ClassFieldTheory Layer 8 (norm-index equality for abelian extensions), Tau Ceti `weilPairing`, `tateModuleGaloisRepresentation`.

**Checks.**

- `y² = x³ − 3x + 8` (`b = 4`, `b² − 1 = 15 = 3·5`, `5 ≢ 1 mod 3`, `b ≡ 4 mod 27`): abelian, first abelian family; it acquires good reduction over the cyclic cubic field cut out by `x³ + 3x² + 6`, whose discriminant `−1620 = 81·(−20)` is a square in `ℚ₃` since `−20 ≡ 1 mod 3`.
- `y² = x³ − 3x + 4` (`b = 2`, `b² − 1 = 3`, `u = 1`): nonabelian; it acquires good reduction over `ℚ₃(π)`, `π³ − 3π² + 6 = 0`, the field of 1.4.
- In the cube-class coordinates `[3], [4]` of 1.1, the classes of `6, 3, 12` span the distinct lines generated by `(1,2), (1,0), (1,1)`. Each has three of the nine classes, so each displayed norm subgroup has index `9/3 = 3`, agreeing with `[F : ℚ₃] = 3`. For abelian `K`, the norm index is instead `[K : ℚ₃] = 24`.
- `y² = x³ − x` has `e = 1` and is outside the statement.
- `Gal(K/ℚ₃)` has order at most `|GL₂(𝔽₅)| = 480`; the unramified subextensions of `ℚ₃^{nr}` have arbitrarily large residue degrees. Thus the equality with `ℚ₃^{nr}(E[2])` is an equality for `K^{nr}`, never a containment of `ℚ₃^{nr}` in finite `K`.

### 1.12 Manoharmayum's curves with `e = 12`

**Theorem.** (1) If `e(E₁) = e(E₂) = 12` and the mod-5 representations have the same splitting field, they agree up to the unramified quadratic twist. (2) For `e(E) = 12`, the splitting field contains `F = ℚ₃(√Δ(E))`; up to that twist there is exactly one mod-5 representation with `F = ℚ₃(√3)`, and four with `F = ℚ₃(√−3)`, one of conductor exponent 3 and three of conductor exponent 5. Representative families with conductor exponent 3 include: `F = ℚ₃(√3)` for `y² = x³ + 3x + 2b`, `b ≡ ±1, ±4 mod 9`, and for `y² = x³ − 3x + 2·3b`, `b` a unit; `F = ℚ₃(√−3)` for `y² = x³ + 3x + 2·3b`, `b` a unit, and for `y² = x³ − 3x + 2b` with `b² − 1 = 9u`, `u ≡ 1 mod 3`; the conductor-exponent-5 representatives are specified by the table below. Put `K = ℚ₃(E[5])` and `K^{nr} = K ℚ₃^{nr}`. Write `κ ∈ {1,2,4}` for the family with `ℚ₃^{nr}(ζ₃, ∛(3κ)) ⊆ K^{nr}`, and take `b ∈ ℤ₃^×`, `n ≥ 1`. Each displayed congruence includes both signs; ramified quadratic twists give the same list of mod-5 types up to the stated normalization.

| Curve | `κ = 1` | `κ = 2` | `κ = 4` |
|---|---|---|---|
| `y² = x³ ± 3^{n+2}x + 6b` | `b ≡ ±4 mod 9` | `b ≡ ±1 mod 9` | `b ≡ ±2 mod 9` |
| `y² = x³ + 9x + 6b` | `b ≡ ±1 mod 9` | `b ≡ ±2 mod 9` | `b ≡ ±4 mod 9` |
| `y² = x³ − 9x + 6b` | `b ≡ ±2 mod 9` | `b ≡ ±4 mod 9` | `b ≡ ±1 mod 9` |
| `y² = x³ ± 3^{n+2}x + 18b` | `b ≡ ±4 mod 9` | `b ≡ ±2 mod 9` | `b ≡ ±1 mod 9` |

Here the cubic field identifies the representation family; the table does not fix its unramified quadratic twist. (3) For conductor exponent 3, `G(E)` contains every reducible indecomposable class of either shape, peu and très ramifié (and also decomposable and irreducible classes); for conductor exponent 5 it consists exactly of the très ramifié classes of both shapes.

- the splitting field determines the mod-5 representation up to unramified quadratic twist; the quadratic subfield and conductor distinguish the families in (2); their sets `G(E)` are those in (3).

*Proof sketch.* (1): the image is the full normalizer of a 3-Sylow subgroup, and a presentation of the Galois group with a Frobenius lift of image `(2, −1; 1, 1)` after twist leaves one conjugacy class. (2): `F` is the field fixed by a Frobenius lift; the 2-division field identifies it with `ℚ₃(√Δ)`; local class field theory counts the extensions with the required action. (3) from the 3-division polynomial as in 1.11. (Manoharmayum, Lemma 5.4.1, pp. 751–752; lists, pp. 752–753; Theorem 5.4.2, p. 753; Proposition 4.3.1, p. 748.) *Needs:* 1.1, TauCetiRoadmap EllipticCurves Layers 2 and 4, TauCetiRoadmap ClassFieldTheory Layer 8.

**Checks.**

- `y² = x³ + 3x + 2` (`b = 1`): conductor exponent 3, `F = ℚ₃(√3)`, the case of tag 4.
- `y² = x³ + 3x + 6` (`2·3b` with `b = 1`): conductor exponent 3, `F = ℚ₃(√−3)`, the case of tag 5.
- The discriminant of `y² = x³ + 9x − 3` has valuation 5, odd, so `e ∈ {4, 12}` (Manoharmayum, Corollary 4.2.3); writing it as `y² = x³ + 3²x + 2·3b` with `b = −1/2 ≡ 4 mod 9`, it is in the conductor-exponent-5 list, the family with `ℚ₃^{nr}(√−3, ∛12) ⊆ K^{nr}`.

### 1.13 Weil–Deligne types of elliptic curves over ℚ₃ across primes

**General comparison.** Let `F/ℚ_p` be finite, `A/F` an abelian variety with potentially good reduction, and `L → End_F⁰(A)` a number-field action. The `p`-adic Weil–Deligne realization and all prime-to-`p` Tate realizations are scalar extensions, through their coefficient embeddings, of one semisimple `(L ⊗_ℚ ℚ̄)[W_F]`-module, finite free over `L ⊗_ℚ ℚ̄`. For every `λ | p`, the `λ`-adic representation is Barsotti–Tate over every finite extension of `F` on which its Weil–Deligne inertia is trivial. This target includes the comparison for every coefficient factor; it assumes neither dimension one nor `F = ℚ₃`. (CDT, Proposition B.4.2, pp. 564–565.)

**Elliptic specialization.** Let `E/ℚ₃` have potentially good reduction and `ℓ ≠ 3`. The Weil–Deligne representation `WD(V₃(E))` (defined since `V₃(E)` is potentially Barsotti–Tate) and `V_ℓ(E)|_{W_{ℚ₃}}` are semisimple and come from one semisimple `ℚ̄[W_{ℚ₃}]`-module; in particular `WD(V₃(E))|_{I₃} ≅ V_ℓ(E)|_{I₃} ⊗ ℚ̄₃` as representations with finite image. `V₃(E)` is Barsotti–Tate over every finite extension `L/ℚ₃` over which this common inertia representation is trivial, equivalently over which `E` has good reduction. For `ℓ = 5`, reduction modulo 5 is injective on the finite inertia image (its order is prime to 5 when `e(E) ∈ {3, 12}`), so `ρ̄_{E,5}|_{I₃}` determines the inertial type of `V₃(E)`.

- the common semisimple Weil-group module gives every coefficient factor of the potentially good abelian variety after scalar extension.
- for a finite extension `L/ℚ₃`, `V₃(E)` is Barsotti–Tate over `L` if and only if `E` has good reduction over `L`, equivalently if and only if inertia of `L` acts trivially on the common Weil realization.
- when `e(E) ∈ {3, 12}`, the inertial type of `V₃(E)` is the lift of `ρ̄_{E,5}|_{I₃}`.

*Proof sketch.* Over a Galois extension `F/ℚ₃` where `E` has good reduction, both sides are computed from the special fibre of the Néron model with the Weil group acting through descent and Frobenius: on `V_ℓ` by the reduction isomorphism, on `D′` by the Dieudonné module of the reduction; their characteristic polynomials agree (independence of `ℓ` for endomorphisms of an abelian variety over a finite field), and semisimplicity follows from the finite image of inertia and the semisimplicity of Frobenius on abelian varieties over finite fields. (Conrad–Diamond–Taylor, Lemma B.4.1 and Proposition B.4.2 with the following remark, pp. 563–565.) *Needs:* TauCetiRoadmap EllipticCurves Layer 4 (Néron–Ogg–Shafarevich), ArithmeticGaloisRepresentations §6.3 (reduction and Euler factors), FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.27 (Weil–Deligne types of potentially Barsotti–Tate representations), PadicHodgeTheory §§8.3, 9.3 (good reduction and crystalline representations).

**Checks.**

- For the zero abelian variety the common module has rank zero and each realization is zero. For `A = E × E` with `L = ℚ`, the common module is the direct sum of two elliptic modules; its rank is four and its Frobenius polynomial is `(X² − a₃X + 3)²`, testing the general dimension.
- For `E` with good reduction at 3, both sides are unramified and the statement is the equality of Frobenius characteristic polynomials `X² − a₃X + 3`.
- For `y² = x³ − 3x + 8` (`e = 3`), the inertial type of `V₃(E)` is the cubic type `τ₁` up to twist, read off from `ρ̄_{E,5}`.
- The statement is about potentially good reduction; a Tate curve over `ℚ₃` has `N ≠ 0` and is outside it.
- For `y² = x³ − x`, `a₃ = 0` and `a₉ = a₃² − 2·3 = −6`. Arithmetic Weil Frobenius at `𝔽₉` has polynomial `(X + 3)²`, while the covariant crystalline `φ²` of PadicHodgeTheory §8.3 has polynomial `(X + 1/3)²`. Inversion changes eigenvalue `−1/3` to `−3`; equating these two Frobenius operators without inversion fails this example.

### 1.14 The extended local Frobenius sign

**Theorem.** Let `E : Y² = X³ + AX + B` be a minimal equation over `ℚ₃` with `A ≡ B + 3 ≡ 0 mod 9` (curves of conductor `3⁵ = 243` at 3). Then `ρ̄_{E,3}` is a très ramifié extension of shape `(ω, ∗; 0, 1)`, and on `G_{ℚ₃(√−3)}` the 5-torsion representation is given by the character with `√−3 ↦ δ(ζ − ζ^{−1})`, `−1 ↦ −1`, `4 ↦ 1`, `1 + √−3 ↦ ζ^i`, `1 + 3√−3 ↦ ζ`, for some `i ∈ ℤ/3` and with `δ = +1`.

*Proof sketch.* Let `F = ℚ₃(√−3, β, α)` with `β² = −√−3` and `α³ + Aα + B = 9√−3`. It is totally ramified abelian of degree 6 over `ℚ₃(√−3)` with uniformizer `ϖ = α/β`, and `Y ↦ ϖ¹⁵Y`, `X ↦ ϖ¹⁰X + α` gives good reduction `Y² = X³ − X − 1` over `𝔽₃`. That curve has only the point at infinity over `𝔽₃`, so arithmetic Frobenius of `W_F` has trace `3 + 1 − 1 = 3` on `E[5]`. Writing `s = √−3`, one has `N_{F/ℚ₃(s)}(ϖ) = (9s − B)²/(−3s) ≡ s(1 − 3s)(1 − 2(B + 3)/3) mod 9s·𝒪_{ℚ₃(s)}`. The extra unit belongs to `1 + 3ℤ₃`, on which the character is trivial since `4 ↦ 1` and `4` topologically generates that group. Reciprocity therefore gives `tr(δ(ζ − ζ^{−1})ζ^{−1}) = 3`, which forces `δ = 1`. (BCDT, the paragraph before Lemma 2.3.1 and Lemma 2.3.1 with proof, pp. 865–866.) *Needs:* 1.7, 1.12, TauCetiRoadmap EllipticCurves Layer 4, TauCetiRoadmap ClassFieldTheory Layer 8, ArithmeticGaloisRepresentations §6.3.

**Checks.**

- `y² = x³ + 9x − 3` satisfies `A = 9 ≡ 0` and `B + 3 = 0 ≡ 0 mod 9`; its discriminant `−16(4·729 + 27·9) = −16·3159 = −16·3⁵·13` is nonzero of valuation 5 < 12, so the equation is minimal.
- `Y² = X³ − X − 1` has no affine `𝔽₃`-point (`x³ − x − 1 = −1` for every `x ∈ 𝔽₃`, a non-square), so `#E(𝔽₃) = 1` and the trace is 3.
- At `A = 9, B = −12`, `N(ϖ) = s(−11 + 24s) ≡ s(7 − 3s) mod 9s`; the factor `7 ∈ 1 + 3ℤ₃` contributes character value 1, so `δ = 1`. At `B = 6` the factor is `4`, giving `s(4 − 3s)`. The shorter congruence `s(1 − 3s)` holds only when `B ≡ −3 mod 27`.
- With `δ = −1` the trace would be `−3`: the sign is determined, not just up to `±1`.

### 1.15 The twisted curve `X_ρ̄(5)` is a projective line

**Matrix Hilbert 90.** The headlines `matrixHilbert90` and `specialLinearHilbert90` state the following assertions with the Krull topology on `G_K` and the discrete topology on the matrix groups. For any field `K`, a separable closure `Kˢ` with the discrete topology, and `n ≥ 1`, every continuous cocycle `c : G_K → GLₙ(Kˢ)` for the natural coefficient action satisfies `c(gh) = c(g)·g(c(h))` and has the form `c(g) = B⁻¹g(B)` for some `B ∈ GLₙ(Kˢ)`. If `c` takes values in `SLₙ(Kˢ)`, one can choose `B ∈ SLₙ(Kˢ)`. The target is the vanishing of this nonabelian first cohomology, including the special-linear variant used in Shepherd-Barron–Taylor, proof of Lemma 1.1, author-copy p. 3. One proof reduces continuity to a finite Galois extension, applies Artin independence to obtain an invariant basis for its semilinear action, then adjusts the trivializing matrix by a matrix over `K` with the inverse determinant. Its determinant lies in `K^×` because `det c(g) = 1`. *Needs:* Mathlib `linearIndependent_algHom_toLinearMap`, `groupCohomology.H1ofAutOnUnitsUnique` after finite-Galois reduction, `SeparableClosure`, the Krull topology and matrix groups; TauCetiRoadmap ClassFieldTheory Layer 5. This target supplies the matrix result rather than identifying scalar Hilbert 90 with it.

**The equivariant icosahedral lift.** The headline `equivariantIcosahedralLift` uses the real-bodied definition `levelFiveConjugate(t,x) = diag(t,1) x diag(t,1)⁻¹` on `SL₂(𝔽₅)`, whose matrix entries are `(x₀₀, t x₀₁; t⁻¹ x₁₀, x₁₁)` for `t ∈ 𝔽₅^×`. Let `K` have characteristic zero. Fix the faithful projective action `a : PSL₂(𝔽₅) → PGL₂(K̄)` on the geometric level-five curve, obtained from the `μ₅ × ℤ/5` marking. For `d_g = diag(χ₅(g),1)` it satisfies `g(a(x)) = a(d_g x d_g⁻¹)`. Prove that there is a unique homomorphism `b : SL₂(𝔽₅) → SL₂(K̄)` whose projectivization is `a` composed with the central quotient. It is faithful, sends `−I` to `−I`, and obeys `g(b(x)) = b(d_g x d_g⁻¹)`. Its API is diagonal conjugation as a group automorphism, the identity action at `t = 1`, composition for multiplication of `t`, and preservation of `−I`. The Lean signature allows any character `χ : G_K → 𝔽₅^×` satisfying this same equivariance law, so the geometric case takes `χ = χ₅`. The pullback double cover is the nontrivial Schur cover; uniqueness follows from perfectness, and implies the stated equivariance. (Shepherd-Barron–Taylor, proof of Lemma 1.1, author-copy p. 3.) *Needs:* TauCetiRoadmap RepresentationTheory/InductionRestriction Layer 7 (factor sets, Schur multipliers and representation groups), and the level-five projective action from the paired modular-curve construction.

**The twisted curve over a field.** Let `K` have characteristic zero and `ρ̄ : G_K → GL₂(𝔽₅)` be continuous, with `det ρ̄ = χ₅`, and fix a perfect alternating `G_K`-equivariant pairing on its finite étale realization `V_ρ̄/K` with values in `μ₅`. Define `Y_ρ̄(5)/K` by the construction of ModularCurves §5C: take the frame torsor `Isom((ℤ/5)²,V_ρ̄)`, the locus in its product with `Y_full(5)_K` where the two pairings agree, and its quotient by simultaneous change of frame by `GL₂(𝔽₅)`. Prove that the quotient is a smooth affine curve representing isomorphism classes of pairs `(E/T, ι : E[5] ≅ V_{ρ̄,T})` preserving the pairings, for every `K`-scheme `T`, and that it carries the universal elliptic curve `ℰ_ρ̄ → Y_ρ̄(5)`. Its smooth proper compactification `X_ρ̄(5)` is the normalization of `ℙ¹_{j,K}` in this curve. After a finite separable extension admitting a frame of pairing value `ζ`, both curves identify with the fixed-pairing level-five curves; the universal family and the identifications descend. Over `ℚ` these are the curves of ModularCurves §5C and ModularCurvesPartII §5.14. The latter's field-extension clause starts from a paired module over `ℚ`; it does not construct a twist for an arbitrary `G_K`-module.

- the quotient represents pairs over every `K`-scheme, and formation of the quotient, universal family and compactification commutes with field extension.
- a paired frame gives the fixed-pairing level-five curve; a frame change transports both the curve and universal family by the same matrix.
- the smooth affine curve is the elliptic locus of its smooth proper compactification, with finite cuspidal complement.

This is the level-five extension of the rational-base construction, with the same frame descent; it imposes no global origin on `ρ̄`. (Shepherd-Barron–Taylor §1, author-copy pp. 2–3; the twist and its family precede Lemma 1.1.) *Needs:* TauCetiRoadmap ModularCurves Layers 0D–0E, 2F, 5B–5C (finite étale groups, pairing, fine moduli, quotient and effective descent); ModularCurvesPartII §§4.10, 5.13–5.14, 6.5 (fixed-pairing compactification and connectedness).

**Checks.**

- For `V_ρ̄ = E₀[5]` over any characteristic-zero `K`, `(E₀,id)` is a point of the quotient and the universal fibre is `E₀`, with its original pairing. An arbitrary scalar multiple of the marking need not preserve that pairing.
- Over an algebraic closure there are `|GL₂(𝔽₅)| = (25−1)(25−5) = 480` frames and four possible primitive pairing values. Imposing equality of pairings and dividing by the diagonal action leaves one connected fixed-pairing curve; omitting the pairing condition leaves four components.
- The element `−I` fixes the isomorphism class of `(E,ι)` via `[−1]_E`, but fixes no frame. Thus the diagonal action on the product with the frame torsor is free, including over `j = 0,1728`; the universal family descends with its marking. A cusp supplies no elliptic fibre.

**Theorem.** Let `K` be a field of characteristic zero and `ρ̄ : G_K → GL₂(𝔽₅)` continuous with `det ρ̄ = χ₅`, the mod-5 cyclotomic character. Let `Y_ρ̄(5)` be the twisted modular curve over `K` just constructed (over `ℚ`, the curve of TauCetiRoadmap ModularCurves §5C; the fine moduli curve of pairs `(E, ι)` with `ι : E[5] ≅ ρ̄` carrying the Weil pairing to the pairing of `ρ̄`, with its universal elliptic curve `ℰ_ρ̄ → Y_ρ̄(5)`), and `X_ρ̄(5)` its smooth compactification just constructed, agreeing over `ℚ` with ModularCurvesPartII §5.14. Then `X_ρ̄(5) ≅ ℙ¹_K`. Consequently `Y_ρ̄(5)(K)` is infinite, and there is an elliptic curve `E/K` with `E[5] ≅ ρ̄` as `G_K`-modules, compatibly with the pairings; for `K` a local field, the noncuspidal `K`-points form a nonempty open subset of `ℙ¹(K)`.

- `X_ρ̄(5) ≅ ℙ¹_K`.
- the universal pair `(ℰ_ρ̄, ι)` over `Y_ρ̄(5)`; for `x ∈ Y_ρ̄(5)(K)`, the fibre `ℰ_x` has `ℰ_x[5] ≅ ρ̄`.
- some `E/K` realizes `ρ̄` on `E[5]`.

*Proof sketch.* Use the fine level structure `μ₅ × ℤ/5`, with its standard alternating pairing, as the base curve over `ℚ`; its determinant is `χ₅`. Its compactification is a projective line over `ℚ`: it has genus zero and a rational point, for instance the one given by the curve `y² − 10xy − 11y = x³ − 11x²`. After identifying geometric bases, the determinant-one twisting cocycle is `c(g) = ρ̄(g)·diag(χ₅(g)^{−1}, 1)` in `SL₂(𝔽₅)`, for the cyclotomic conjugation action. Its projective image twists the base curve through `PSL₂(𝔽₅) ⊂ PGL₂(K̄) = Aut(ℙ¹_{K̄})`. This uses the `μ₅ × ℤ/5` base, rather than a constant symplectic level structure over `ℚ`. The equivariant icosahedral lift above maps this cocycle to `SL₂(K̄)`; matrix Hilbert 90 above trivializes it. A trivial twist of `ℙ¹` is `ℙ¹_K`. Cusps are finitely many, so noncuspidal points exist. (Shepherd-Barron–Taylor, §1, Lemma 1.1 and Theorem 1.2 with proofs, pp. 285–286; in the author-hosted version the lemma is on p. 3, it writes `ℙ¹/ℚ` where `ℙ¹/K` is meant, and its proof names a lift `SL₅(𝔽₅) → SL₂(K̄)` where `SL₂(𝔽₅)` is meant.) *Needs:* TauCetiRoadmap ModularCurves §5C, ModularCurvesPartII §5.14 (compactified twisted curves), ModularCurvesPartII §§4.10, 6.5 (*geometric irreducibility of the twisted curve*), Mathlib `Matrix.SpecialLinearGroup`, matrix Hilbert 90 and the equivariant icosahedral lift above, TauCetiRoadmap RepresentationTheory/InductionRestriction Layer 7.

**Checks.**

- For `K = ℝ`, conjugation on `ℂ` and `B = diag(i,−i) ∈ SL₂(ℂ)` give `B⁻¹B̄ = −I`; also `(−I)·conj(−I) = I`. The trivializing matrix may have determinant one even for a nontrivial cocycle.
- For `B = (i,1;0,−i)` over `ℂ`, `det B = 1` and `B⁻¹B̄ = (−1,−2i;0,−1)`, whereas `B̄B⁻¹ = (−1,2i;0,−1)`. The former satisfies `c(conj)·conj(c(conj)) = I` and pins the order in the coboundary formula.
- At `n = 1`, `SL₁` is trivial and `GL₁` gives scalar Hilbert 90; for the trivial Galois group every cocycle has value `I`.
- if `B⁻¹g(B)` lies in `SL₂`, `d = det B ∈ K^×`, and `diag(d⁻¹,1)B` has determinant one and gives the same cocycle.
- At `t = 2` and `x = (1,1;0,1)`, `levelFiveConjugate` gives `(1,2;0,1)`; inverse conjugation would give `(1,3;0,1)`.
- At `t = 1`, `levelFiveConjugate` fixes `(1,1;1,2)`, whose determinant is `2−1 = 1`; a map sending every input to the identity fails.
- For every `t`, `levelFiveConjugate` fixes `−I`, of determinant one; multiplication by a nontrivial scalar would change this value.
- The central element of order two in the icosahedral lift maps to `−I`, whose projectivization is the identity; mapping it to `I` would factor through `A₅`, which has no faithful two-dimensional characteristic-zero representation.
- The identity in the projective action lifts to `I`; replacing every value of a lift by its negative fails at the identity, since it would give `b(1) = −I`.
- both `g(b(−I))` and `b(d_g(−I)d_g⁻¹)` are `−I`. For two lifts the quotient is a character `SL₂(𝔽₅) → {±1}`, which is 1 by perfectness.
- For `ρ̄ = E₀[5]` with `E₀ = y² = x³ − x` over `ℚ₃`, the point `(E₀, id)` is a `ℚ₃`-point of `Y_ρ̄(5)`.
- the argument uses the vanishing of `H¹(G_K, SL₂(K̄))`, and for level 4 the analogous statement fails (Shepherd-Barron–Taylor, remark after Theorem 1.2: some `ρ̄ : G_ℚ → GL₂(ℤ/4)` with cyclotomic determinant is not realized on any 4-torsion).
- A cusp of `X_ρ̄(5)` is not an elliptic curve: the conclusion uses `Y_ρ̄(5)`, not `X_ρ̄(5)`.

### 1.16 Local curves with prescribed paired torsion

**Construction.** For a continuous `ρ̄ : G₃ → GL₂(𝔽₅)` with cyclotomic determinant in one of the six cases of 1.9 for the fixed normalized representative of 1.10, construct `E₁/ℚ₃` and an isomorphism `α : 𝔽₅² → E₁[5](ℚ̄₃)` of `G₃`-modules and choose the `μ₅`-valued alternating form on `ρ̄` by pulling the Weil pairing back along `α`, such that `ρ̄_{E₁,3}` has the following form: in case 1, no condition; in cases 2–3, `ρ̄_{E₁,3}|_{I₃} ≅ (1, ∗; 0, ω)` très ramifié; in cases 4–5, `ρ̄_{E₁,3}|_{I₃} ≅ (ω, ∗; 0, 1)` très ramifié; in case 6, `ρ̄_{E₁,3} ≅ (ω, ∗; 0, 1)` on all of `G₃`, très ramifié, and indecomposable on restriction to the splitting field of `ρ̄`. More precisely, in case 6 every très ramifié `ρ̄₃ : G₃ → GL₂(𝔽₃)` of either shape `(ω, ∗; 0, 1)` or `(1, ∗; 0, ω)` and every `i` is realized together with the exact `𝔽₅`-character, including the uniformizer value.

- the curve and the symplectic identification exist in every case.
- the 3-torsion has exactly the prescribed shape and très ramification.
- in case 6, every prescribed pair (très `ρ̄₃` of either shape, index `i`) is realized.
- `α` carries the chosen pulled-back form to the Weil pairing; this is the form subsequently used in 6.3.
- in case 6 the companion can be chosen indecomposable over the splitting field of `ρ̄`.

*Construction.* Case 1: any curve with the given 5-torsion, which exists by 1.15 over `K = ℚ₃`. Cases 2–3 have inertia image of order three: in case 3 the value at `ξ` is 1. Apply 1.11(3), which supplies `(1, ∗; 0, ω)` très ramifié 3-torsion over every `e = 3` mod-5 representation, matching the unramified twist. Cases 4–5: 1.12(3) at conductor exponent 3. Case 6: in the family `A ≡ B + 3 ≡ 0 mod 9`, `ρ̄_{E,3}` is très ramifié of shape `(ω, ∗; 0, 1)`, and all nine pairs `(ρ̄_{E,3}, i)` occur (the three très ramifié classes times three indices) with `δ = +1` by 1.14; twisting by quadratic characters gives the other shape. Of the three très ramifié lines, two are not split over the splitting field of `ρ̄`; choose one of those. Pull back the Weil pairing along `α`; this pairing, with values in `μ₅`, is the one carried to the global twisted curve in 6.3. (BCDT, proof of Theorem 2.2.1, p. 864; §2.3 and Corollary 2.3.2, pp. 865–866 (the corollary names the target group `GL₃(𝔽₃)` where `GL₂(𝔽₃)` is meant); Manoharmayum, Theorem 5.3.2, p. 751, and §5.4, pp. 751–753.) *Needs:* 1.10, 1.11, 1.12, 1.14, 1.15, TauCetiRoadmap EllipticCurves Layers 2 and 4, Tau Ceti `weilPairing`.

**Checks.**

- `y² = x³ − x` has good reduction at 3: its 5-torsion is in case 1.
- `y² = x³ − 3x + 8`: abelian `e = 3` 5-torsion, so case 2 up to twist.
- `y² = x³ − 3x + 4`: nonabelian `e = 3` 5-torsion, case 3. Its `−3` twist `y² = x³ − 27x − 108` has `e = 6` and character value `−1` at `ξ`, so it is excluded from the normalized tag until twisted back. The très ramifié shape `(1, ∗; 0, ω)` becomes `(ω, ∗; 0, 1)` under this ramified twist (1.11(3)).
- `y² = x³ + 3x + 2`: conductor exponent 3 with quadratic field `ℚ₃(√3)`, case 4 up to twist (1.12).
- `y² = x³ + 3x + 6`: conductor exponent 3 with quadratic field `ℚ₃(√−3)`, case 5 up to twist (1.12).
- `y² = x³ + 9x − 3`: in the conductor-243 family, with très ramifié 3-torsion of shape `(ω, ∗; 0, 1)` on `G₃` and positive uniformizer sign (1.14): case 6 for its index `i`.

### Examples

- cyclic cubic (`e = 3`, `f = 1`), nonabelian cubic (`e = 3`, `f = 2`), and the three families of degree 24 with `e = 12`, `f = 2`; the uniformizers `π`, `π`, `α/β`, `(α − 1)/β`, `α/β`.
- Constant terms `c_π(0)`: `+1, −1, −1, +1, +1` in the order of 1.3–1.7.

### Dependencies

Layer W3.0 (the types); TauCetiRoadmap ClassFieldTheory Layers 5, 7 and 8, LocalFieldsRamification Layers 2–3, EllipticCurves Layers 2 and 4; Tau Ceti `kummerEquiv`, `dualityMap1_kummerCoeff_bijective`, `localArtinMap`, `weilPairing`, `tateModuleGaloisRepresentation`; ArithmeticGaloisRepresentations §4.2, §4.3, §6.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.27; PadicHodgeTheory §§8.3, 9.3.

## Layer W3.2: Breuil modules with wild descent and the finite-flat deformation conditions

This layer builds the tools of the local proof. It first sets up, for an odd prime `ℓ` and a complete discrete valuation ring `R` of mixed characteristic `(0, ℓ)` with perfect residue field `k`, Breuil's classification of finite flat `R`-group schemes killed by `ℓ` (2.1), its rank-one and extension calculus (2.2), and the translation of descent data along a possibly wildly ramified Galois extension (2.3); then the lattice of models with descent, Dieudonné-module conditions, and weak and strong filtrations (2.4). With these it defines the three kinds of deformation condition used at `ℓ = 3` — finite flat with descent over the cubic fields (2.5), annihilation of the special-fibre Dieudonné module by an operator ideal for the quadratic and extended fields (2.6–2.7) — and the three comparison maps `Θ₀, Θ₁, Θ_ω` that bound their tangent spaces (2.8–2.9). It ends by showing that the characteristic-zero points of the cubic and quadratic types satisfy their conditions (2.10–2.11); the extended analogue needs the classification of Layer W3.5 and is 5.11.

The tame theory with ordinary commuting descent and the opposite monodromy normalization is FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.31–§R07.4.35. What is new here is the wild case: descent operators no longer commute with `φ₁` but satisfy a corrected relation involving the monodromy operator, and their composites carry correction operators.

### 2.1 Breuil modules and Breuil's classification

**Definition.** Fix a uniformizer `π` of `R`, with Eisenstein polynomial `E_π(u) = u^e − ℓ·G_π(u)` over `W(k)` (1.2), and let `φ` be the `ℓ`-th power map of `k[u]/(u^{eℓ})` and `c_π = −φ(G_π(u))`, a unit. Use the underlying triple `(M, M₁, φ₁)` of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.34, with `M` finite free over `k[u]/(u^{eℓ})`, `M₁ ⊇ u^eM`, and `φ₁` semilinear with generating image; impose no descent data and no tameness hypothesis. Morphisms are the filtration-preserving module maps commuting with `φ₁`. A complex `0 → M′ → M → M″ → 0` is *exact* when it is exact on underlying modules, equivalently when the sequences of `M`'s and of `M₁`'s are both exact, equivalently when it is exact modulo `u`. The Frobenius of `M` is `φ(m) = c_π^{−1}·φ₁(u^e·m)`, and `M` carries a unique additive *monodromy* operator `N` with `N(sx) = N(s)x + sN(x)` for `N = u·d/du` on scalars (so `N(u) = +u`), `N ∘ φ₁ = φ ∘ N` on `M₁` and `N(M) ⊆ uM`; morphisms commute with `N`.

**Theorem (Breuil).** (The polynomial `G_π(u)` and the group scheme `G_π(M)` of a Breuil module share the letter, following the source; the argument distinguishes them.) There is a contravariant equivalence `M_π` from commutative finite flat `R`-group schemes killed by `ℓ` to Breuil modules, with quasi-inverse `G_π`. A group of order `ℓ^r` has a Breuil module of rank `r`. There is a canonical isomorphism `D(G) ⊗_{k, Frob} k ≅ M_π(G)/u·M_π(G)` with the contravariant Dieudonné module of the special fibre, under which `F ⊗ Frob` corresponds to `φ` and `V ⊗ Frob^{−1}` to the composite `M/uM → M₁/uM₁ → M/uM` inverse to `φ̄₁` followed by inclusion. A complex of finite flat group schemes killed by `ℓ` is short exact if and only if the corresponding complex of Breuil modules is exact. The construction commutes with unramified base change of the residue field (`M ⊗_k k′`, `φ₁ ⊗ φ`). Actions of a finite `𝔽_ℓ`-algebra `A` on `G` correspond to `A`-linear structures on `M_π(G)`, and then `M_π(G)` is a module over `A ⊗_{𝔽_ℓ} k[u]/(u^{eℓ})` with `φ` acting `A`-linearly. In formulas for power series such as 1.2, `(φH)(v)` means applying Witt Frobenius to the coefficients of `H` and then substituting `v`; it does not apply the substitution `u ↦ u^ℓ` twice.

- Breuil modules form an additive category, with short exact sequences characterized by the equivalent underlying-module and modulo-`u` criteria above; no abelian-category structure is asserted.
- `φ(m) = c_π^{−1}φ₁(u^e m)`.
- the monodromy operator satisfies `N(u) = u`, `N ∘ φ₁ = φ ∘ N` and `N(M) ⊆ uM`, and commutes with every Breuil-module morphism.
- a morphism is an isomorphism iff it is one on underlying modules (because `φ̄₁ : M₁/uM₁ → M/uM` is bijective).
- the equivalence `M_π` sends order `ℓ^r` to rank `r`, preserves and reflects exact sequences contravariantly, identifies special-fibre Dieudonné modules modulo `u`, and commutes with unramified base change.

*Proof sketch.* The exactness criteria follow from Nakayama and the bijectivity of `φ̄₁`. `N` is unique because the difference of two such operators is linear, commutes with `φ₁`, and maps `M` into `u^{ℓ^n}M` for all `n`; it is constructed by successive approximation `N_{j+1}(s ⊗ φ₁(x)) = N(s) ⊗ φ₁(x) + sφ(N_j(x))`, which stabilizes. The equivalence is Breuil's, via the syntomic sheaf `O^{cris}_{1,π}` (Breuil 2000, §2.1.1, Prop. 2.1.2.2, Thms 3.3.7 and 4.2.1.6); the Dieudonné comparison combines Breuil's identification of `M/uM` with the crystalline Dieudonné module of the special fibre and Berthelot–Breen–Messing 4.2.14; exactness uses that a complex of finite flat group schemes over `R` is exact iff its special fibre is. (BCDT, §5.1, Lemmas 5.1.1–5.1.2 and Theorem 5.1.3, pp. 883–886; Corollary 5.4.2, p. 890.) *Needs:* 1.2, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.18 (Breuil's `S`-modules and the Dieudonné crystal) and §R07.4.34 (Breuil modules over `k[u]/(u^{ep})` in the tame setting), §R07.2.6 (the contravariant Dieudonné module).

**Checks.**

- The constant group scheme `UT₃(𝔽₃)` over `ℤ₃` has order 27, is finite étale and is killed by cubing: for a strictly upper triangular matrix `A`, `(1 + A)³ = 1 + A³ = 1`. The elementary matrices `1 + E₁₂` and `1 + E₂₃` have commutator `1 + E₁₃ ≠ 1`, so it is excluded by commutativity.
- The rank-one module with `M₁ = M` and `φ₁(e) = e` (that is `r = 0`, below) has `φ = c_π^{−1}φ₁(u^e·)`, which is zero modulo `u` when `e ≥ 1`; correspondingly `F = 0` on the Dieudonné module of `μ_ℓ`.
- The étale module `M₁ = u^e·M`, `φ₁(u^e e) = c_π(0)·e`, has `φ(e) = e` modulo `u`: `F` is bijective, as on the Dieudonné module of `ℤ/ℓ`.
- On a rank-one module `N(e) = 0` on its standard generator and `N ∘ φ₁ = 0` (2.2), but `N(ue) = ue ≠ 0`; on the cubic extensions of 3.2, `N(e_ω) = c·u⁶e₁ ≠ 0` for `c ≠ 0`: the monodromy operator is not identically zero.
- The sign `N(u) = +u` is fixed here; the tame theory of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.31 uses `N(u) = −u`, and the formulas of 2.3 change sign under that convention.

### 2.2 Rank-one Breuil modules and their extensions

**Definition.** For `0 ≤ r ≤ e` and `a ∈ k^×` let `M(r, a) = k[u]/(u^{eℓ})·e` with `M(r, a)₁ = u^r·M(r, a)` and `φ₁(u^r e) = a·e`, and `G(r, a) = G_π(M(r, a))`. For `0 ≤ r, s ≤ e`, `a, b ∈ k^×` and `f ∈ u^{max(0, r+s−e)}·k[u]/(u^{eℓ})`, let `M(s, b; r, a; f)` be free on `e, e′` with `M₁ = ⟨u^s e, u^r e′ + f·e⟩`, `φ₁(u^s e) = b·e`, `φ₁(u^r e′ + f e) = a·e′`: an extension of `M(r, a)` by `M(s, b)`. The same definitions with coefficients in `k′k = k′ ⊗_{𝔽_ℓ} k` for a finite extension `k′/𝔽_ℓ` linearly disjoint from `k` give the modules `M(k′; r, a)` and `M(k′; s, b; r, a; f)` with a `k′`-action, where `φ` is the identity on `k′`.

**Theorem.** (1) Every rank-one Breuil module is isomorphic to some `M(r, a)`. (2) There is a nonzero morphism `M(r, a) → M(r′, a′)` iff `r′ ≥ r`, `r′ ≡ r mod (ℓ − 1)` and `a/a′ ∈ (k^×)^{ℓ−1}`; such morphisms are `e ↦ b·u^{ℓ(r′−r)/(ℓ−1)}e′` with `b^{ℓ−1} = a/a′`. (3) `M(r, a) ≅ M(r′, a′)` iff `r = r′` and `a/a′ ∈ (k^×)^{ℓ−1}`. (4) The Breuil modules of the models of a fixed finite flat `F′`-group of order `ℓ` are totally ordered by the existence of nonzero morphisms. (5) `N(e) = 0` on the standard generator of `M(r, a)` and `N ∘ φ₁ = 0`; on an arbitrary `h(u)e`, `N(h(u)e) = u·h′(u)e`. (6) `G(r, a)` is étale iff `r = e` and multiplicative iff `r = 0`. (7) `G(0, 1) ≅ μ_ℓ` and `G(e, c_π(0)) ≅ ℤ/ℓ`. (8) The Cartier dual of `G(r, c_π(0))` is `G(e − r, 1)`. (9) Every extension of `M(r, a)` by `M(s, b)` is some `M(s, b; r, a; f)`, and `M(s, b; r, a; f) ≅ M(s, b; r, a; f′)` as extensions iff `f′ − f = u^s·h − (b/a)·u^r·h^ℓ` for some `h`, by an isomorphism fixing `e` and sending `e′ ↦ e′ − (b/a)h^ℓ e`. (10) The coefficient versions hold with `(k^×)^{ℓ−1}` replaced by `{φ(b)/b}` and `h^ℓ` by `φ(h)`.

- every rank-one module has the normal form `M(r,a)`; the morphisms and isomorphisms are exactly (2)–(3), models of a fixed generic fibre are ordered as in (4), monodromy is given by (5), and étaleness, multiplicativity, constant models and Cartier duality obey (6)–(8).
- every extension has the displayed filtration and Frobenius normal form, and two forms define the same marked extension exactly under the gauge relation (9); with coefficient actions the corresponding criterion is (10).

*Proof sketch.* (1)–(3), (5) are direct calculations with the semilinear `φ₁`; (4) holds because two finite flat groups of order `ℓ` have isomorphic generic fibres iff there is a nonzero map one way; (6) and (7) compute the Dieudonné module through 2.1 and use that a finite flat group is étale iff its special fibre is; the affine algebra of `G(r, a)` is `R[X]/(X^ℓ + (π^{e−r}ã/G_π(π))X)`, which identifies the constant group; (8) follows from (4) and (7). (9)–(10) are direct calculations with the gauge `e′ ↦ e′ − (b/a)h^ℓ e`; `f` must be divisible by `u^{max(0, r+s−e)}` for `M₁ ⊇ u^eM`. (BCDT, §5.2, Lemmas 5.2.1–5.2.4, pp. 886–888.) *Needs:* 2.1.

**Checks.**

- `M(r, a)` with `r = e` and `a = c_π(0)` is the étale module of `ℤ/ℓ`; with `a = −c_π(0)` (a non-`(ℓ−1)`-th-power ratio when `ℓ = 3` and `k = 𝔽₃`) it is a different étale group over residue field `𝔽₃`, the unramified quadratic twist. Over `𝔽₉`, `−1 = j²`, so the same two modules are isomorphic; the residue-field hypothesis matters.
- For `ℓ = 3`, `e = 3`: nonzero maps `M(1, δ) → M(3, δ)` exist (`r′ − r = 2 ≡ 0 mod 2`), none `M(1, δ) → M(2, δ)`.
- The gauge relation at `(s, r) = (1, 2)`, `e = 3`, `b/a = δ`: `f′ − f = u·h − δu²h³` kills every non-constant `f`, leaving `f = c` (compare 3.2).
- Even at rank one, `N(ue) = ue` in `k[u]/(u^{eℓ})·e`. As `e ≥ 1` and `ℓ > 2`, this element is nonzero; replacing generator-wise vanishing by an identically zero operator violates the Leibniz rule.
- An extension datum `f` not divisible by `u^{r+s−e}` when `r + s > e` does not define a Breuil module (`M₁ ⊉ u^eM`).

### 2.3 Wild descent data on Breuil modules

**Definition.** Let a finite group `Γ` act faithfully and continuously on `R`, so `F′/F₀` is Galois with group `Γ` for `F₀ = F′^Γ`, possibly wildly ramified. Use the data `ĝ`, `H_g`, `t_g` and `f_{g₁,g₂}` of 1.2 (with `H₁ = 1`), and for `x ∈ M₁` let the *correction operator* `1_{g₁,g₂}` of a Breuil module be the `k`-linear map with `1_{g₁,g₂}(φ₁(x)) = (1 + (Σ_{i=1}^{ℓ−1} (−1)^{i−1} f_{g₁,g₂}^i / i)·N)(φ₁(x))` and `1_{g₁,g₂}(u^iφ₁(x)) = u^i(1 + f_{g₁,g₂})^i·1_{g₁,g₂}(φ₁(x))`. A *descent datum* on a finite flat `R`-group `G` is a family of isomorphisms `[g] : G → ᵍG` with `[gh] = ᵍ[h] ∘ [g]`; it is not Grothendieck descent along `R/R^Γ`, which may be ramified, but it gives by étale descent a finite flat `F₀`-group with `(G, [g])_{F₀} ×_{F₀} F′ ≅ G ×_R F′`, and a semilinear `Γ`-action on `D(G)` commuting with `F` and `V`.

**Theorem.** (1) Descent data on a finite flat `R`-group `G` killed by `ℓ` are equivalent to additive bijections `ĝ : M_π(G) → M_π(G)`, `g ∈ Γ`, preserving `M₁` and satisfying `ĝ(w·u^i·m) = g(w)(uH_g(u))^i·ĝ(m)` for `w ∈ k`, the *corrected Frobenius relation* `ĝ ∘ φ₁ = (1 + t_g(u)·N) ∘ φ₁ ∘ ĝ` on `M₁`, and `1̂ = id`, `ĝ₁ ∘ ĝ₂ = ĥ ∘ 1_{g₁,g₂}` for `h = g₁g₂`. The equivalence is functorial and compatible with Dieudonné theory: the semilinear action on `D(G)` and `ĝ mod u` correspond under 2.1. (2) It suffices to give `γ̂_j` for generators `γ_j` of a presentation `θ : Γ_d → Γ` by a free group, satisfying the first two conditions, and for every word `γ` in a set of normal generators of `ker θ` the relation `γ̂ = 1_γ` (the correction operator of `f_γ` with the scalar action `γ̂(u) = u(1 + f_γ(u))` (equivalently `H_γ = 1 + f_γ`)). (3) If `π` is `Γ`-invariant one may take `H_g = 1`; then `t_g = 0`, all corrections vanish, and descent data are semilinear `Γ`-actions commuting with `φ₁` (ordinary étale descent). (4) A finite flat `R`-group of order `ℓ` whose generic fibre carries descent data has a unique compatible descent datum; if `M_π(G) ≅ M(r, a)` and `γ` lies in the wild inertia subgroup `Γ₁` (so it fixes `k`, has `ℓ`-power order and satisfies `γ(π)/π ≡ 1 mod π`), then `γ̂(e) = H_γ(u)^{−rℓ/(ℓ−1)}·e`, where the root is the one with constant term 1.

- descent data correspond to the corrected semilinear operators of (1), can be specified on generators with the corrected relations of (2), reduce to commuting semilinear descent under (3), and on rank-one models have the uniqueness and wild-inertia formula of (4).
- the displayed correction operators determine composition and presentation relations, and specialize to the identity when their correction series vanish.
- Breuil modules with descent data, an additive category; a complex is exact if its underlying complex of Breuil modules is.

*Proof sketch.* Base change by a continuous automorphism `g` of `R` is computed through the syntomic sheaves: `M_π(ᵍG)` is `M_π(G)` with the twisted structure `(ĝ, φ_g, N_g)`, and Lemma 5.5.1 identifies `φ_g` through `t_g`; maps `G → ᵍG` become maps commuting with `φ₁` up to the factor `1 + t_gN` (Corollary 5.5.7). Composites differ from the composite automorphism by the correction `1_{g₁,g₂}` (Lemma 5.4.8). For (2), the relations of `Γ` are generated by `ker θ`. For (4), the models of the generic fibre are totally ordered (2.2(4)), so each `[γ]` preserves each model; `γ̂(e) = ξ_γ·e` with `ξ_γ = H_γ^{rℓ}ξ_γ^ℓ`, so `ξ_γ = ε_γ·H_γ^{−rℓ/(ℓ−1)}` with `ε_γ ∈ 𝔽_ℓ^×`, and `ε_γ = 1` because an element of `ℓ`-power order acts trivially on the one-dimensional `M/uM`. (BCDT, §5.4, Corollary 5.4.2 and Lemma 5.4.8, pp. 890–894; Lemma 5.5.1 and Corollary 5.5.7, pp. 894–896; Theorem 5.6.1 and Corollary 5.6.2, pp. 896–898; Lemma 5.7.1, pp. 898–899.) *Needs:* 2.1, 2.2, 1.2, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.7 (Galois descent for Dieudonné modules).

**Checks.**

- For an unramified Galois extension with `π ∈ F₀`, (3) gives ordinary commuting semilinear descent. In a nontrivial tame totally ramified extension with `π^d ∈ F₀`, an inertia generator sends `π` to `ζ_dπ ≠ π`; that is not the invariant-uniformizer case.
- In an unramified quadratic extension at `ℓ = 3`, take `π = 3` and the rank-one module of the unramified quadratic twist of `μ₃`. Its nontrivial residue automorphism has `H_γ = 1` but `γ̂(e) = −e`. This is descent data commuting with `φ₁`; it disproves the rank-one formula without `γ ∈ Γ₁`.
- For the conductor-243 fields, `H_{γ₃} ≡ 1 − u⁶` but `t_{γ₃} ≡ −1 − u⁶` modulo `(3, u¹²)` (1.7): `ĝ ∘ φ₁` and `φ₁ ∘ ĝ` differ, so a descent datum commuting with `φ₁` is wrong there.
- Rank one, `r = 0` (`μ_ℓ`): `γ̂(e) = e` for every wild `γ`; `r = e` (`ℤ/ℓ`): `γ̂(e) = H_γ^{−eℓ/(ℓ−1)}e`, which is `e` modulo `u` and need not be identically `e`.

### 2.4 Models with descent, Dieudonné ideals and filtrations

**Definition.** Keep `R`, `Γ`, `F₀ ⊆ F′` as in 2.3, now with `ℓ` arbitrary. Let `FD_{F′/F₀}` be the additive category of commutative finite flat `R`-group schemes of `ℓ`-power order with descent data, with closed subobjects stable under the descent data and their quotients. Let `W(k)[F, V][Γ]` be the `W(k)`-algebra generated by `F`, `V` and `[g]` (`g ∈ Γ`) with `[gh] = [g][h]`, `[g]F = F[g]`, `[g]V = V[g]`, `FV = VF = ℓ`, `[g]x = g(x)[g]`, `Fx = Frob(x)F`, `Vx = Frob^{−1}(x)V`; for a two-sided ideal `I`, `FD_{F′/F₀,I}` is the full subcategory of objects of `ℓ`-power order whose Dieudonné module is killed by `I`. A *model* of a finite flat `F₀`-group `G` is an object with an identification of its `F₀`-fibre with `G`. For a finite nonempty set `Σ` of objects of `FD_{F′/F₀,(I,ℓ)}` with `Hom(G_i, G_j) = Hom` of generic fibres `= 0` for `i ≠ j` and a finite field for `i = j`, a *`Σ`-filtration* of an `F₀`-group is a filtration with graded pieces among the generic fibres of `Σ`; an object of `FD_{F′/F₀,I}` is *weakly filtered by `Σ`* if some filtration by closed subobjects has graded pieces in `Σ`, and *strongly filtered* if moreover every `Σ`-filtration of its generic fibre induces such a filtration. When weak implies strong, `FD_{F′/F₀,I,Σ}` denotes the full subcategory of weakly filtered objects.

**Theorem.** (1) Schematic closure gives a bijection between subgroups of `(G, [g])_{F₀}` and closed finite flat subgroups with descent of `(G, [g])`. (2) Isomorphism classes of models with descent of `G` form a sublattice of the lattice of all models over `R`; if two objects of `FD_{F′/F₀,I}` have isomorphic `F₀`-fibres, the sup and inf of the two models are again objects of `FD_{F′/F₀,I}`; `FD_{F′/F₀,I}` is closed under closed subobjects with descent and their quotients. (3) If `G₁, G₂` are the only local-local models of their generic fibres and `0 → G₁ → G → G₂ → 0` is exact, then `G` is the only local-local model of its generic fibre; and if every model in `FD_{F′/F₀,I}` of an extension `0 → G₁ → G → G₂ → 0` induces sub and quotient isomorphic to fixed models of `G₁, G₂`, then `G` has at most one model in `FD_{F′/F₀,I}`. (4) (Jordan–Hölder) `Σ`-filtrations of an `F₀`-group have the same length and graded pieces, and extend from subobjects and quotients. Products of weakly filtered objects are weakly filtered; subobjects and quotients of strongly filtered objects whose generic fibres admit `Σ`-filtrations are strongly filtered. (5) If weak implies strong for `Σ`, two objects of `FD_{F′/F₀,I,Σ}` with identified generic fibres are isomorphic by a unique isomorphism compatible with the identifications. (6) (Weak-to-strong criterion) If for all `G′, G″ ∈ Σ` the map `Ext¹_{FD_{F′/F₀,(I,ℓ)}}(G″, G′) → Ext¹_{𝔽_ℓ[G_{F₀}]}(G″_{F₀}, G′_{F₀})` is injective, every weakly filtered object is strongly filtered. (7) If `Σ = {G}` is a singleton and `0 → G₁ → G → G₂ → 0` in `FD_{F′/F₀,I}` satisfies the `Hom` condition for `{G₁, G₂}` and the `Ext` injectivity of (6) for all pairs from `{G₁, G₂}`, then weakly filtered by `{G}` implies strongly filtered by `{G}`.

- generic subgroups have unique schematic closures with descent; models are closed under the sup, inf and subquotient operations of (2); uniqueness holds under (3); filtrations have the graded-piece invariance and closure properties of (4), the model comparison of (5), and the weak-to-strong criteria (6)–(7).
- the ring `W(k)[F, V][Γ]` has the stated semilinear relations; membership in its ideal subcategory means that every element of `I` acts as zero on the special-fibre Dieudonné module.

*Proof sketch.* (1) is schematic closure (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20) applied over `F′` and made `Γ`-stable by uniqueness. (2) follows from Raynaud's construction of sup and inf from subgroups and quotients of `G₁ × G₂`, using that Cartier duals of local-local groups are local-local. (3): two such models with a map between them give a map of short exact sequences whose outer maps are isomorphisms (a power of each is the identity on the generic fibre, hence the identity), and the five lemma in fppf sheaves concludes. (4) is the usual Jordan–Hölder argument. (5) by induction on the rank, using (2) to reduce to a map between the two models. (6) by induction on the length: for a closed subgroup `H` whose generic fibre is in `Σ`, either it is the first piece, or it maps isomorphically onto its image in the quotient and the `Ext` injectivity splits the pullback. (7) combines (6) for `{G₁, G₂}` with the injectivity of `Ext¹`. (BCDT, §4.1, Lemmas 4.1.1–4.1.4 and Corollary 4.1.5, pp. 868–870; §4.2, Lemmas 4.2.1–4.2.4 and Corollary 4.2.5, pp. 870–874.) *Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20, §R07.1.24 (models of a generic group), §R07.2.5 (the Dieudonné ring), §R07.2.6, §R07.2.7.

**Checks.**

- The constant group `ℤ/3` over the cubic field `F₁` has two models, `G(3, 1)` and `G(1, 1)` (3.1); both carry the standard descent, so they are two distinct models with descent of the same generic fibre: uniqueness in (3) needs its hypotheses.
- `Σ = {G(1, δ), G(2, 1)}` (cubic case) satisfies the `Hom` condition: the two generic fibres `ℤ/3` and `μ₃` are non-isomorphic, and each has endomorphisms `𝔽₃`.
- On `D(μ₃)` with its canonical descent the inertia acts trivially, so `[γ₄²] + 1` acts by `2 ≠ 0`: `μ₃` is not an object of the quadratic category of 2.6, matching 4.1, where `r = 0` is excluded.
- Over `𝔽₉ = 𝔽₃(j)`, `D(μ₃)` has `F = 0` and `V(x) = x³`. Thus `V(j) = −j`, as the relation `Vj = Frob⁻¹(j)V` requires; making the coefficient algebra central would incorrectly give `V(j) = j`. Both `FV` and `VF` vanish, agreeing with multiplication by 3 on this module.
- For the singleton `Σ = {G(1,1)}` over `F₁`, the zero object has the empty filtration, and `G(1,1) × G(1,1)` has two graded pieces in `Σ`. Its generic fibre is `(ℤ/3)²`; every composition series has length two and constant graded pieces. A proposed filtration with a single graded piece is not a `Σ`-filtration.
- The generic fibre of `μ₃` is the nontrivial character `ω`, so it has no filtration by the generic fibre of this singleton `Σ`. In particular it is not weakly filtered by `Σ`; annihilation by an ideal alone cannot replace the graded-piece condition.

### 2.5 The cubic finite-flat deformation conditions

**Definition.** Let `ρ̄` be normalized by an unramified twist to the nonsplit très ramifié extension `0 → 1 → ρ̄ → ω → 0` over `𝔽₃`, and let `S(ρ̄)` be the category of finite-length `ℤ₃[G₃]`-modules admitting a finite filtration with all graded pieces isomorphic to `ρ̄` (LocalGaloisDeformationRings §8.6). For `δ = ±1`, `S_δ ⊆ S(ρ̄)` is the full subcategory of modules isomorphic, as `ℤ₃[G₃]`-modules, to `(G, [g])_{ℚ₃}(ℚ̄₃)` for some finite flat `𝒪_{F′_δ}`-group `G` with descent data relative to `F′_δ/ℚ₃` (1.3, 1.4). The groups may be killed by any power of 3. For each deformation category `S` used here, let `S[3]` be its full subcategory of modules killed by 3, with exact sequences inherited from `𝔽₃[G₃]`-modules. Its Yoneda self-extensions, with middle term in `S[3]`, give `H¹_S(G₃, ad ρ̄)`; intersecting with `H¹(G₃, ad⁰ρ̄)` gives the fixed-determinant tangent (BCDT §4.3, p. 875).

- membership is the existence of such a model with descent and an equivariant identification of its generic fibre.
- morphisms are all `G₃`-equivariant maps in `S(ρ̄)`.
- `S_δ` is closed under finite products and `S(ρ̄)`-subobjects and quotients.
- `S_δ` is a deformation condition in the sense of LocalGaloisDeformationRings §8.6; its fixed-determinant ring `R^{ε, S_δ}_{V,𝒪}` has tangent space `H¹_{S_δ}(G₃, ad⁰ρ̄)`.

*Construction.* Closure under subobjects and quotients is 2.4(1)–(2); products are clear. (BCDT, §4.4, p. 875, using §4.1, pp. 868–870, and §4.3, pp. 874–875.) *Needs:* 2.4, 1.3, 1.4, LocalGaloisDeformationRings §8.6.

**Checks.**

- the zero module belongs to `S_δ`. A self-extension over `𝔽₃[ε]/(ε²)` is killed by 3 and belongs to `S_δ[3]` when its model satisfies the condition; multiplication by `ε` has kernel and image both equal to the residual module.
- the split module `1 ⊕ ω` is not in `S_δ`: it is not even in `S(ρ̄)`, since a two-dimensional module with a `ρ̄`-filtration is isomorphic to `ρ̄`.
- a ramified model with semilinear descent counts; no model over `ℤ₃` is required (a model over `ℤ₃` of `ρ̄` would make `ρ̄` finite flat over `ℤ₃`, which a très ramifié extension of `ω` by `1` is not).
- for a Barsotti–Tate lift of type `τ_δ`, every finite quotient of its Tate lattice belongs to `S_δ` (2.10); restricting the category to groups killed by 3 would lose this.

### 2.6 The quadratic special-fibre condition

**Definition.** Let `ρ̄` be normalized to the très ramifié extension `0 → ω → ρ̄ → 1 → 0`, and `δ = ±3`. Let `I_δ` be the two-sided ideal of `W(𝔽₉)[F, V][Gal(F′_δ/ℚ₃)]` generated by `F + V` and `[γ₄²] + 1`, where `γ₄²` is the element of order two of the inertia subgroup of `Gal(F′_δ/ℚ₃(√δ))` (1.5, 1.6). Then `S_δ ⊆ S(ρ̄)` is the full subcategory of generic fibres of objects of `FD_{F′_δ/ℚ₃, I_δ}`, with no bound on the torsion exponent. The condition is on the special-fibre Dieudonné module.

- a model belongs iff `F + V = 0` and `[γ₄²] = −1` on its Dieudonné module.
- the operator algebra includes the Witt Frobenius and the residue action of descent.
- the category is closed under finite products and `S(ρ̄)`-subobjects and quotients; its fixed-cyclotomic deformation ring has tangent `H¹_{S_δ}(G₃, ad⁰ρ̄)` (LocalGaloisDeformationRings §8.6).

*Construction.* Stability under subobjects and quotients is 2.4(1)–(2). (BCDT, §4.5, pp. 876–877.) *Needs:* 2.4, 1.5, 1.6, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.5, LocalGaloisDeformationRings §8.6.

**Checks.**

- if `F + V = 0` then `F² = −FV = −3`, not `+3`.
- a nonzero special-fibre module on which `[γ₄²]` acts by `+1` is excluded, since `1 + 1 = 2` is invertible.
- As an operator-module test, take `D = 𝔽₉²`, `γ₂(x,y) = (x³,y³)`, `γ₄(x,y) = (jx,−jy)`, `γ₃ = 1` and `F = V = 0`. The descent-group relations hold, `F + V = 0` and `γ₄² + 1 = 0` on this nonzero module. The unit ideal would exclude it. This test asserts no integral finite-flat lift.

### 2.7 The extended special-fibre condition

**Definition.** Let `i ∈ ℤ/3` and `ρ̄` the très ramifié extension `0 → ω → ρ̄ → 1 → 0` of `G₃`-modules (the whole group, not only inertia). Let `I_i` be the two-sided ideal of `W(𝔽₉)[F, V][Gal(F′_i/ℚ₃)]` generated by `F + V`, `[γ₄²] + 1` and `([γ₃] − [γ₃^{−1}])[γ₂] − F`, with `γ₂, γ₃, γ₄` the generators of 1.7 (`γ₂` corresponds to `√−3` under local reciprocity over `ℚ₃(√−3)` and is a Frobenius lift). `S_i ⊆ S(ρ̄)` is the full subcategory of generic fibres of objects of `FD_{F′_i/ℚ₃, I_i}`. Changing the choice of `√−3` changes the reciprocity generators compatibly and leaves `I_i` unchanged.

- annihilation means `F + V = 0`, `[γ₄²] = −1` and `F = ([γ₃] − [γ₃^{−1}])[γ₂]`.
- the ideal does not depend on the choice of `√−3`.
- membership is the existence of an ideal-annihilated model with descent; the category is closed under finite products and `S(ρ̄)`-subobjects and quotients as in 2.5.
- the identity is on the contravariant Dieudonné module, where `[γ₂]` acts through the residue Frobenius, so both sides of the third generator are Frobenius-semilinear.

*Construction.* As 2.6; the filtered subcategories `S_{i,(r,s)}` used for the tangent bounds are defined in 5.6, once the residual models are classified. (BCDT, §4.6, pp. 877–880; §6.5, pp. 902–904.) *Needs:* 2.4, 2.6, 1.7, 0.5.

**Checks.**

- on `D = 𝔽₉²`, take `F = V = 0`, `γ₃(x,y) = (x+y,y)`, `γ₄(x,y) = (jx,−jy)` with `j² = −1`, and `γ₂(x,y) = (x³,y³)`. These satisfy the descent group relations, `F + V = 0` and `γ₄² = −1`. But `(γ₃ − γ₃^{−1})γ₂(0,1) = (−1,0) ≠ 0 = F(0,1)`. Thus the third generator excludes an actual module admitted by the first two; an inertial condition alone is weaker.
- As an operator-module test, use the nonzero `D = 𝔽₉²` of 2.6 with `γ₃ = 1` and `F = V = 0`. Every generator of `I_i` acts by zero, whereas the unit ideal would exclude it. No integral finite-flat lift is asserted.
- Keep `γ₂, γ₄` above but take `γ₃(x,y) = (x+y,y)`, `F(x,y) = (−y³,0)` and `V = −F`. These are Frobenius- and inverse-Frobenius-semilinear, since Frobenius has order two on `𝔽₉`. They commute with descent and satisfy `FV = VF = 0 = 3` and `F = (γ₃ − γ₃⁻¹)γ₂`. At `(0,1)` the correct side is `(2,0)`, while its negative is `(1,0)`. This operator-module test distinguishes the sign without asserting an integral lift.

### 2.8 The three comparison maps

**Construction.** Let `χ = ω` for the cubic categories and `χ = 1` for the quadratic and extended ones, and fix a nonsplit très ramifié `0 → χω → ρ̄ → χ → 0` over `𝔽₃` (with `ω² = 1`, this is the normalized `ρ̄` of 2.5–2.7). All extension groups in this construction are in continuous `𝔽₃[G₃]`-modules; for a deformation condition `S`, restrict to `Ext¹_{S[3]}(ρ̄, ρ̄)`. Pulling a self-extension of `ρ̄` back along `χω ↪ ρ̄` and pushing it out along `ρ̄ ↠ χ` gives `Θ₀ : Ext¹(ρ̄, ρ̄) → Ext¹(χω, χ) = H¹(G₃, ω)`. On `ker Θ₀` the extension diagram defines `Θ₁ : ker Θ₀ → Ext¹(χ, χ) = H¹(G₃, 𝔽₃)` and `Θ_ω : ker Θ₀ → Ext¹(χω, χω) = H¹(G₃, 𝔽₃)`, which are then restricted to `H¹(I₃, 𝔽₃)`. In a basis with `ρ̄ = (χω, ∗; 0, χ)`, a cocycle `φ = (φ₁₁, φ₁₂; φ₂₁, φ₂₂) ∈ Z¹(G₃, ad ρ̄)` represents the extension `(ρ̄, φρ̄; 0, ρ̄)`; then `Θ₀[φ] = [φ₂₁]`, and if `φ₂₁ = 0`, `Θ₁[φ] = [φ₂₂]` and `Θ_ω[φ] = [φ₁₁]`. The class lies in `H¹(G₃, ad⁰ρ̄)` iff `[φ₁₁ + φ₂₂] = 0`; hence `Θ₁ = −Θ_ω` on `H¹(G₃, ad⁰ρ̄) ∩ ker Θ₀`.

- the pullback–pushout construction gives a linear map from self-extensions of `ρ̄` to `H¹(G₃,ω)`.
- on `ker Θ₀`, the two diagonal constructions give classes in `H¹(G₃,𝔽₃)` and then their restrictions to `H¹(I₃,𝔽₃)`.
- the entry formulas, using a representative with `φ₂₁ = 0` for the diagonal maps.
- `Θ₁ = −Θ_ω` on the trace-zero part of `ker Θ₀`.
- pullback, pushout and restriction agree with the coefficient and restriction maps of continuous cohomology (Tau Ceti `ContinuousCohomology.coeffMap`, `ContinuousCohomology.res`).

*Construction.* Use the long exact `Ext` sequences of the subobject and quotient; changing the splitting adds a coboundary, so the diagonal classes are well defined on `ker Θ₀`. Identify `Ext¹` with continuous `H¹` of the adjoint representation, using `ρ̄^∨ ≅ ρ̄ ⊗ ω`. (BCDT, §4.7, pp. 880–881.) *Needs:* LocalGaloisDeformationRings §1.4, Tau Ceti `ContCohomology.Z1`, `ContCohomology.H1`, `ContinuousCohomology.coeffMap`, `ContinuousCohomology.res`, `AbsoluteGaloisGroup`, Mathlib `Matrix.trace`.

**Checks.**

- On the matrix `E₂₁`, the entry formulas give `(Θ₀, Θ₁, Θ_ω) = (1,0,0)`; on `diag(1,−1)` they give `(0,−1,1)`. These are entry-formula checks, not assertions that arbitrary constant matrices are cocycles. Three zero maps fail both checks.
- the split self-extension maps to zero under all three maps.
- a cocycle with only the upper-right entry nonzero has `Θ₀ = Θ₁ = Θ_ω = 0`.
- for `φ = (a, b; 0, −a)` (trace zero, `φ₂₁ = 0`), `Θ₁ = [−a] = −Θ_ω`: the fixed-determinant condition is one relation between the diagonal classes, not two separate vanishing conditions.

### 2.9 The très ramifié tangent-kernel criterion

**Theorem.** With `ρ̄` and `χ` as in 2.8: (1) `0 → ρ̄ ⊗ χ → ad⁰ρ̄ → ω → 0` is an exact sequence of `G₃`-modules, the first map sending `(x, y)` to `(−y/2, x; 0, y/2)` and the second taking the lower-left entry; hence `H¹(G₃, ad⁰ρ̄) ∩ ker Θ₀ = H¹(G₃, ρ̄ ⊗ χ)`. (2) The sequence `0 → 𝔽₃ → H¹(G₃, ω) → H¹(G₃, ρ̄ ⊗ χ) → H¹(I₃, 𝔽₃)` is exact (no surjectivity at the right end is claimed), and the last map is `Θ_ω = −Θ₁`. (3) Consequently `Θ₁` and `Θ_ω` have the same kernel on `H¹(G₃, ad⁰ρ̄) ∩ ker Θ₀`, of dimension one. (4) If `S` is a deformation condition (LocalGaloisDeformationRings §8.6) on which `Θ₀` vanishes and one of `Θ₁, Θ_ω` vanishes, then `dim_{𝔽₃} H¹_S(G₃, ad⁰ρ̄) ≤ 1`.

*Proof sketch.* (1) is a matrix computation. For (2), the long exact sequence of `0 → ω → ρ̄ ⊗ χ → 1 → 0` reduces the claim to injectivity of `H¹(G₃/I₃, 𝔽₃) → H¹(G₃, 𝔽₃) → H²(G₃, ω)`. By local Tate duality an unramified class mapping to zero is orthogonal to the image of `H⁰(G₃, 𝔽₃) → H¹(G₃, ω)` coming from the Cartier-dual extension; that image is a Kummer class outside the unit line because the extension is très ramifié, and the unramified line pairs nontrivially with every non-unit Kummer class (1.1). (3) `H¹(G₃, ω)` is two-dimensional and the connecting `𝔽₃` is a line. (BCDT, §4.7, Lemma 4.7.1 and Corollary 4.7.2, pp. 881–882.) *Needs:* 2.8, 1.1, LocalGaloisDeformationRings §8.6, TauCetiRoadmap ClassFieldTheory Layer 5 (local Tate duality).

**Checks.**

- For a peu ramifié `ρ̄` the image of `H⁰` is a unit Kummer class, which pairs trivially with the unramified line, and (2) fails: the très hypothesis is used.
- (4) gives an upper bound only.

### 2.10 Cubic type points satisfy the finite-flat condition

**Theorem.** For the normalized `ρ̄` of 2.5 and `δ = ±1`, the type quotient `R^{τ_δ}_{V,ℤ₃}` of the universal deformation ring is a quotient of `R^{ε, S_δ}_{V,ℤ₃}`. Equivalently, for every Barsotti–Tate lift of type `τ_δ` with determinant `ε`, every finite 3-power quotient of its Tate lattice lies in `S_δ`.

*Proof sketch.* `τ_δ` is trivial on the inertia of `F′_δ`, so the lift is Barsotti–Tate over `F′_δ`. Tate's theorem extends its 3-divisible group over `𝒪_{F′_δ}`, and uniqueness of the extension carries the descent data and the coefficient action; its finite levels and their coefficient-lattice quotients are objects with descent. Intersecting the point kernels defining the type quotient (LocalGaloisDeformationRings §3.12) gives the factorization, for all finite coefficient extensions. (BCDT, §4.4, p. 875; §1.1, pp. 850–851.) *Needs:* 2.5, 0.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.22, §R07.1.25 and §R07.4.30, LocalGaloisDeformationRings §3.12 and §1.12.

**Checks.**

- A residual model of `ρ̄` alone does not prove the statement: every torsion level must lie in `S_δ`.
- If `R^{τ_δ} = 0` the statement is empty and true.

### 2.11 Quadratic type points satisfy the operator condition

**Theorem.** For `δ = ±3` and the normalized `ρ̄` of 2.6, `R^{τ_δ}_{V,ℤ₃}` is a quotient of `R^{ε, S_δ}_{V,ℤ₃}`. For a Barsotti–Tate lift of type `τ_δ` with determinant `ε`, the Dieudonné module of its 3-divisible model over `𝒪_{F′_δ}` satisfies `[γ₄²] = −1` and `F + V = 0`, so every finite coefficient-lattice quotient lies in `S_δ`.

*Proof sketch.* Extend the 3-divisible group with descent by Tate's theorem and compare its rational Dieudonné module with the Weil–Deligne representation of the lift (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.27). `WD(γ₄²) = −1`; for the element `γ̃₂` corresponding to `√δ`, `WD(γ̃₂²)` is a scalar but `WD(γ̃₂)` is not, and `det WD(γ̃₂) = 3`, so `WD(γ̃₂²) = −3`; on the Dieudonné module this gives `[γ₄²] = −1` and `F² = −3`, hence `F = −V`. Torsion-free lattices inherit these identities, and so do all torsion quotients. (BCDT, §4.5, pp. 876–877.) *Needs:* 2.6, 0.4, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.22, §R07.1.25, §R07.4.27 and §R07.4.30, LocalGaloisDeformationRings §3.12.

**Checks.**

- The sign is `F² = −3`, the one compatible with `FV = 3` and `F = −V`.
- An unramified twist of the lift changes `WD(γ̃₂)` by a sign but not `WD(γ̃₂²)`, so the condition is twist-invariant, as an inertial condition should be.

### Examples

- Over the cubic field `F₁` (`e = 3`, `ℓ = 3`) the models of `ℤ/3` are `M(3, 1)` and `M(1, 1)` and those of `μ₃` are `M(2, 1)` and `M(0, 1)` (3.1): within a chain `r` is fixed modulo `ℓ − 1 = 2`.
- The cocycle of the très ramifié extension `0 → ω → ρ̄ → 1 → 0` attached to the Kummer class of `3` lies outside the unit line of `H¹(G₃, ω)`; that of the class of `4` lies on it and gives a peu ramifié extension.

### Dependencies

Layer W3.1 (uniformizer data, the explicit fields, Kummer theory of `ℚ₃`); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20, §R07.1.22, §R07.1.25, §R07.1.24, §R07.2.5–§R07.2.7, §R07.4.18, §R07.4.27, §R07.4.30, §R07.4.34; LocalGaloisDeformationRings §1.4, §1.12, §3.12, §8.6; TauCetiRoadmap ClassFieldTheory Layer 5; Tau Ceti continuous cohomology.

## Layer W3.3: The cubic types

This layer proves that the two cubic types `τ₁` and `τ₋₁` of 0.3 are weakly acceptable for a très ramifié residual representation whose inertia restriction has the shape `(1, ∗; 0, ω)`. Throughout, `δ = ±1`, `F = F_δ` and `F′ = F′_δ` are the cubic fields of 1.3 (`δ = 1`, where `F = F′`) and 1.4 (`δ = −1`), `e = 3`, and the descended Breuil modules `M` have scalars `S₉ = 𝔽₃[u]/(u⁹)`. Put `k′ = 𝔽₃` for `δ = 1` and `k′ = 𝔽₉` for `δ = −1`; over `F′` the module is `M′ = k′ ⊗_{𝔽₃} M` over `k′[u]/(u⁹)`. All descent operators act on `M′`, with `γ̂₂` cubing coefficients when `δ = −1`. After an unramified twist, `ρ̄` is the nonsplit extension `0 → 1 → ρ̄ → ω → 0`, and `S_δ` is the category of 2.5. The rank-one and extension calculus is that of 2.2, the descent calculus that of 2.3. Throughout Layers W3.3–W3.5, an `Ext` of Breuil modules means extensions with middle module killed by 3; integral deformation categories still allow every 3-power torsion exponent. Breuil modules are contravariant: an extension of Breuil modules `0 → M′ → M → M″ → 0` corresponds to an extension of group schemes `0 → G(M″) → G(M) → G(M′) → 0`.

The argument has three steps. The rank-one and rank-two models are listed (3.1–3.5). A rank-three calculation shows that `Θ₀` vanishes on self-extensions in `S_δ[3]` (3.6), and two separate diagonal arguments, one for each sign, show that `Θ_ω` vanishes (3.7). The tangent bound (3.8) then follows from 2.9, and weak acceptability (3.9) from 2.10.

### 3.1 Rank-one models over the cubic fields

**Theorem.** Over `𝒪_F` the finite flat models of the constant group `ℤ/3` are `G(3, δ) ≅ ℤ/3` and `G(1, δ)`, and the models of `μ₃` are `G(0, 1) ≅ μ₃` and `G(2, 1)`. Here `G(r, a)` is the group scheme of the rank-one Breuil module `M(r, a) = S₉·e` with `M(r, a)₁ = S₉·uʳe` and `φ₁(uʳe) = a·e`. The models `G(1, δ)` and `G(2, 1)` are local-local. After base change to `𝒪_{F′}`, each of the four models carries exactly one descent datum over `ℚ₃` compatible with the canonical descent datum on the generic fibre; this is the *standard* descent datum.

*Proof sketch.* Apply the rank-one classification of 2.2 with `e = 3` and `G(0) = −δ`, so that the étale model is `M(3, δ)` and the multiplicative model is `M(0, 1)`; the models of a group of order three are the `M(r, a)` with `r` in one residue class modulo `ℓ − 1 = 2` and `a` in the matching class of `𝔽₃^×`. Uniqueness of compatible descent is the rank-one descent statement of 2.3 (an element of `3`-power order acts trivially on `M/uM`). (BCDT, §7.1, p. 904; Lemma 5.2.1, pp. 886–887; Lemma 5.7.1, pp. 898–899.) *Needs:* 1.3, 1.4, 2.2, 2.3.

**Checks.**

- The constant group sits at `r = 3` and `μ₃` at `r = 0`; the local-local models are `r = 1` (constant generic fibre) and `r = 2` (generic fibre `μ₃`).
- `G(1, δ)` and `G(3, δ)` have isomorphic generic fibres and there is a nonzero morphism `M(1, δ) → M(3, δ)`, `e ↦ u³e′`; there is none in the other direction.
- The Cartier dual of `G(1, δ)` is `G(2, 1)` (rank-one duality `G(r, c_π(0)) ↔ G(e − r, 1)`).

### 3.2 The peu ramifié cubic extensions

**Theorem.** The extensions of `M(2, 1)` by `M(1, δ)` are the Breuil modules `M_c`, `c ∈ 𝔽₃`, free over `S₉` on `e₁, e_ω`, with

```text
(M_c)₁ = ⟨ u·e₁ ,  u²·e_ω + c·e₁ ⟩,    φ₁(u·e₁) = δ·e₁,   φ₁(u²·e_ω + c·e₁) = e_ω,
N(e₁) = 0,   N(e_ω) = c·u⁶·e₁ .
```

The standard descent data of 3.1 extend uniquely to `k′ ⊗_{𝔽₃} M_c` over `k′[u]/(u⁹)`. The generic fibres are extensions `0 → ω → ρ → 1 → 0` of `G₃`-modules that are peu ramifié, the split one at `c = 0`, and every peu ramifié extension of this shape occurs for some `c`.

*Proof sketch.* The normal form comes from the extension gauge of 2.2 at `(s, r) = (1, 2)`: `f ∈ u^{max(0, r+s−e)} S₉ = S₉` modulo `u·h − δ·u²·h³`, which leaves the constant term. The value of `N` follows from `N ∘ φ₁ = φ ∘ N`, `c_π = −φ(G) = −(u² − δ)³ = δ − u⁶` in `S₉` and the vanishing of `φ₁` on `u³M₁`. Uniqueness of descent: the extension of group schemes is the unique local-local one with its generic fibre (2.4), and `H¹(G₃, ω) → H¹(G_{F′}, ω)` is injective: `F′` does not contain `√−3` (for `δ = 1`, `F′ = F₁` has degree three; for `δ = −1`, the only quadratic subfield of `F′₋₁` is `ℚ₃(√−1)`), so `ω` is nontrivial on `G_{F′}` and inflation–restriction has zero kernel. Existence of a nonsplit peu class with a local-local model: Manoharmayum's cubic curves furnish an elliptic curve whose 3-torsion is such an extension (1.11); since the peu classes form a line, all of them occur. (BCDT, Lemma 7.2.1 and proof, pp. 904–905; Manoharmayum, Theorem 5.3.2, p. 751.) *Needs:* 3.1, 2.2, 2.3, 2.4, 1.1, 1.11.

**Checks.**

- At `c = 1` the monodromy is nonzero: `N(e_ω) = u⁶e₁`. A computation that sets `N = 0` on every extension is wrong here.
- The Breuil extension is of `M(2, 1)` by `M(1, δ)`, while the Galois extension has `ω` as subobject and `1` as quotient: contravariance reverses the order.
- `c = 0` gives the split module `M(1, δ) ⊕ M(2, 1)` and the split representation `ω ⊕ 1`; its zero Kummer class is peu ramifié.
- For `δ = −1`, `γ̂₂(je₁) = −jγ̂₂(e₁)` belongs to `𝔽₉ ⊗_{𝔽₃} M_c`. For `δ = 1`, `𝔽₃ ⊗_{𝔽₃} M_c = M_c`. No tensor product of the Breuil module with the characteristic-zero ring is used.

### 3.3 Generic descent over an auxiliary cyclic cubic field

**Theorem.** Let `F̃/ℚ₃` be any totally ramified abelian cubic extension and `𝒢` a local-local finite flat `𝒪_{F̃}`-group scheme killed by 3 whose generic fibre is an extension of `ℤ/3` by `μ₃`. Then `𝒢 ×_{𝒪_{F̃}} F̃ ≅ G ×_{ℚ₃} F̃` for a finite flat group scheme `G` over `ℚ₃`. Only the generic fibre descends; nothing is asserted about a model over `ℤ₃`.

*Proof sketch.* As in 3.2 (with `δ = 1` and `F̃` in place of `F₁`), `M_π(𝒢) ≅ M_c` for some `c ∈ 𝔽₃`. `Gal(F̃/ℚ₃)` has order 3 and can only act trivially on a one-dimensional `𝔽₃`-space, so each class lies in `H¹(G_{F̃}, ω)^{Gal(F̃/ℚ₃)}`, which is the image of `H¹(G₃, ω)` because `H⁰(G_{F̃}, ω) = 0` (Hochschild–Serre). (BCDT, Lemma 7.2.2 and proof, p. 905.) *Needs:* 3.2, 1.1.

**Checks.**

- For `F̃ = F₁` and `c = 0` the descended group is `ℤ/3 × μ₃` over `ℚ₃`.
- The degree-six nonabelian field `F′₋₁` is outside the hypothesis. Its descent group has a quotient of order two, so the order-three argument for a one-dimensional class space cannot be used there; 3.7 treats that field separately. This observation alone is not a counterexample to generic descent.

### 3.4 Cubic models of the très ramifié residual representation

**Theorem.** The extensions of `M(1, δ)` by `M(2, 1)` are the nine modules `M_{c,c′}`, `c, c′ ∈ 𝔽₃`, free on `e₁, e_ω` with

```text
(M_{c,c′})₁ = ⟨ u²·e_ω ,  u·e₁ + (c + c′u)·e_ω ⟩,   φ₁(u²e_ω) = e_ω,   φ₁(u·e₁ + (c + c′u)e_ω) = δ·e₁ .
```

Each has a unique descent datum compatible with the standard ones; its generic fibre is an extension `0 → 1 → ρ → ω → 0`, peu ramifié exactly when `c = 0`; and the Frobenius `F` of the special-fibre Dieudonné module vanishes exactly when `c = 0`. Consequently every model with descent of the normalized très ramifié `ρ̄` is some `M_{c,c′}` with `c ≠ 0`.

*Proof sketch.* The gauge relation `f′ − f = u²h − δ^{-1}·u·h³` reduces the extension class `f ∈ S₉` to a polynomial of degree at most one. A model of `ρ̄` killed by 3 is local-local: its connected–étale sequence and that of its Cartier dual would split `ρ̄` otherwise, so its rank-one pieces are `G(2, 1)` and `G(1, δ)`. The map `(c, c′) ↦` generic class is injective (2.3) and lands in `H¹(G₃, ω) ≅ 𝔽₃²` (1.1); a très ramifié example from Manoharmayum's families (1.11) shows `c ≠ 0` is the très direction, and `F` is read off from Theorem 5.1.3(3) of 2.1: `F` corresponds to `φ = c_π^{-1}φ₁(u³·)`. (BCDT, Lemma 7.2.3 and Corollary 7.2.4, p. 906.) *Needs:* 3.1, 3.2, 2.1, 2.2, 2.3, 1.1, 1.11, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20 (schematic closure).

**Checks.**

- `c = 0` is the peu line; `c′` alone does not detect très ramification (`M_{0,1}` is peu).
- For `c = 1, c′ = 0`, the second filtration generator `u·e₁ + e_ω` has a unit coefficient on `e_ω`, which is what makes the special-fibre Frobenius nonzero.
- The nine modules give nine pairwise non-isomorphic extension classes, matching `#H¹(G₃, ω) = 9`.

### 3.5 Diagonal cubic extensions and their descent constants

**Theorem.** The self-extensions of `M(1, δ)` are parametrized by `b + b′u` (`b, b′ ∈ 𝔽₃`), with filtration `⟨u·e, u·e′ + (b + b′u)·e⟩` and Frobenius images `δe, δe′`; those of `M(2, 1)` by `(a + a′u)·u`, with filtration `⟨u²·e, u²·e′ + (a + a′u)·u·e⟩` and Frobenius images `e, e′`. The generic extension splits over an unramified extension of `ℚ₃` exactly when the first parameter (`b`, resp. `a`) vanishes. Over the nonabelian field `F′₋₁`, the compatible descent operator `γ̂₃` acts on `e` by `H_{γ₃}³` (resp. `H_{γ₃}⁶`) and sends `e′` to that multiple of `e′` plus an off-diagonal term whose constant is `−b·H′_{γ₃}(0)` (resp. `−a·H′_{γ₃}(0)`): the same sign in both cases.

*Proof sketch.* The normal forms come from the gauge relation. Splitting over an unramified extension is solving an Artin–Schreier equation `x³ − x = (constant)` over the residue field. For the descent constants, compare constant terms in `γ̂₃ ∘ φ₁ = (1 + t_{γ₃}N) ∘ φ₁ ∘ γ̂₃` on the filtration generator, using the values of `H_{γ₃}` from 1.4 and the conjugation `γ₂γ₃γ₂ = γ₃²`. For `M(2, 1)` the comparison is made on the generator `u²e′ + (a + a′u)u·e`; the proof in the source writes a different generator at this point. (BCDT, Lemmas 7.2.5–7.2.6 and proofs, pp. 906–908.) *Needs:* 3.1, 2.2, 2.3, 1.4.

**Checks.**

- `b = b′ = 0` (resp. `a = a′ = 0`) gives the split self-extension.
- `b = 0, b′ = 1` gives a nonsplit generic extension that splits over an unramified extension (the Artin–Schreier equation is solved over the residue field extension).
- The off-diagonal constants for `r = 1` and `r = 2` have the same sign. With the opposite sign on the constant of `M(1, δ)`, the equation of 3.7(ii) would read `(−a − b)H′_{γ₃}(0) = b·H′_{γ₃}(0)`, which does not force `a = 0`.

### 3.6 Rank-three splitting and the vanishing of `Θ₀`

**Theorem.** Let `𝒢` be a finite flat `𝒪_F`-group scheme with descent, killed by 3, carrying a filtration by closed group subschemes `𝒢₁ ⊂ 𝒢₂ ⊂ 𝒢`, with `𝒢₁ ≅ G(1, δ)`, `𝒢₂/𝒢₁ ≅ G(2, 1)` and `𝒢/𝒢₂ ≅ G(1, δ)`. Assume the generic fibre of `𝒢₂`, with its descent, is the normalized très extension `0 → 1 → ρ̄ → ω → 0`. Then the quotient of `𝒢` by its first piece is split. Consequently `Θ₀ = 0` on `Ext¹_{S_δ[3]}(ρ̄, ρ̄)` for both `δ = ±1`.

*Proof sketch.* The Breuil module has a basis with filtration `⟨u·e₁, u²·e_ω + b·e₁, u·e′₁ + (c + c′u)·e_ω + f·e₁⟩` and `c ≠ 0` by 3.4. The condition `u³·M ⊆ M₁` forces `u` to divide `bc + bc′u − u²f`, so `b = 0`, and 3.2 then splits the quotient. For a self-extension `E` of `ρ̄` in `S_δ[3]`, pulling back along `1 ↪ ρ̄` and pushing out along `ρ̄ ↠ ω` has a model of this shape by schematic closure; splitting over `F′` and the injectivity of `H¹(G₃, ω) → H¹(G_{F′}, ω)` give `Θ₀(E) = 0`. (BCDT, Lemma 7.3.1 and Corollary 7.3.2, pp. 908–909.) *Needs:* 2.5, 2.8, 3.2, 3.4, 2.4, 1.1, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20.

**Checks.**

- With `c = 0` (a peu residual model) the divisibility gives no constraint on `b`: the très hypothesis is used.
- `b = 0` and `f = 0` gives the split rank-three object `M_{c,c′} ⊕ M(1, δ)`.

### 3.7 The two diagonal vanishing arguments

**Theorem.** (i) For `δ = 1`, `Θ_ω` vanishes on the fixed-determinant tangent `H¹_{S₁}(G₃, ad⁰ρ̄)`. (ii) For `δ = −1`, `Θ_ω` vanishes on all of `Ext¹_{S₋₁[3]}(ρ̄, ρ̄)`. The fixed-determinant restriction in (i) is part of the statement.

*Proof sketch.* (i) If a fixed-determinant class had nonzero diagonal inertia class, its restriction to inertia would be killed over a uniquely determined auxiliary totally ramified cyclic cubic extension `F̃`; over `F̃` a rank-two local-local subquotient appears whose generic fibre descends to `ℚ₃` by 3.3, and injectivity of restriction then contradicts the nonzero inertia class. (ii) Use the rank-four filtration of a self-extension in `S₋₁[3]`, with residual parameter `c ≠ 0`; the descent operator `γ̂₃` has the cross term `g·e_ω` on the second lifted vector and the fourth row acts on `e′₁` (the display in the source has two index slips at this point). Preservation of the filtration gives `g(0) = c·H′_{γ₃}(0)` and `h_ω(0) − h₁(0) = b·H′_{γ₃}(0)`, and the two negative diagonal constants of 3.5 give `(−a + b)H′_{γ₃}(0) = b·H′_{γ₃}(0)`; since `H′_{γ₃}(0) = (3 − j)/4 ≢ 0` (1.4), `a = 0` and the diagonal extension is unramified. (BCDT, Theorem 4.7.3(2)–(3), p. 882; §7.4, pp. 909–911.) *Needs:* 3.3, 3.4, 3.5, 3.6, 2.9, 2.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20.

**Checks.**

- In (ii), `H′_{γ₃}(0) ≠ 0` is used: for a descent operator with `H′(0) = 0` the equation is empty. The corrected matrix indices are part of the argument; with the indices as printed the equation does not arise.
- In (i), an unramified diagonal class (first parameter zero) is not excluded: only its inertia restriction must vanish.

### 3.8 The cubic tangent bound

**Theorem.** For the normalized très ramifié `ρ̄` and `δ = ±1`, `dim_{𝔽₃} H¹_{S_δ}(G₃, ad⁰ρ̄) ≤ 1`.

*Proof sketch.* By 3.6 and 3.7 the fixed-determinant tangent lies in `ker Θ₀ ∩ ker Θ_ω`, which has dimension one by 2.9. (BCDT, Theorem 4.4.1, p. 875; Theorem 4.7.3, p. 882.) *Needs:* 3.6, 3.7, 2.9.

This is an upper bound only; no smoothness or equality is asserted.

### 3.9 Weak acceptability of the cubic types

**Theorem.** Let `ρ̄ : G₃ → GL₂(𝔽₃)` be continuous with `ρ̄|_{I₃} ≅ (1, ∗; 0, ω)` très ramifié. Then `τ₁` and `τ₋₁` are weakly acceptable for `ρ̄`: for every coefficient ring `𝒪`, the type quotient `R^{τ_δ}_{V,𝒪}` is zero or a quotient of `𝒪[[X]]`. This does not identify it with `𝒪[[X]]`, assert formal smoothness, or assert that type points exist.

*Proof sketch.* Twist by an unramified character to reach the normalized form (types are inertial, so twisting does not change them). Take `𝒪 = ℤ₃`: the type quotient is a quotient of `R^{ε, S_δ}_{V,ℤ₃}` by 2.10, whose tangent space has dimension at most one by 3.8, so it is a quotient of `ℤ₃[[X]]`. Pass to any `𝒪` by the change-of-coefficients isomorphism of LocalGaloisDeformationRings §1.12. (BCDT, Theorem 2.1.2, p. 862; §4.4, p. 875.) *Needs:* 3.8, 2.10, LocalGaloisDeformationRings §3.12 (type quotients) and §1.12 (change of coefficients).

**Checks.**

- weak acceptability does not assert a lift of type `τ_δ`.
- The residual representation is over `𝔽₃`; a representation defined only over a larger field is outside the statement.
- A peu ramifié `ρ̄` of this shape is outside the hypothesis; for it, 3.6 gives no information.

### Examples

- The curves `y² = x³ − 3x + 8` and `y² = x³ − 3x + 4` over `ℚ₃` (1.11) acquire good reduction over a cyclic, respectively nonabelian, cubic field; a twist of their 3-adic Tate modules has type `τ₁`, respectively `τ₋₁`.
- In `S₉`, `c_π = −(u² − δ)³ = δ − u⁶`, so `c_π(0) = δ`; this constant is the only place where the two signs differ in 3.1–3.4.

### Dependencies

Layers W3.1 (the cubic fields and Kummer theory of `ℚ₃`) and W3.2 (Breuil modules with wild descent, finite flat filtrations, the categories `S_δ`, the comparison maps); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20; LocalGaloisDeformationRings §1.12 and §3.12.

## Layer W3.4: The ramified quadratic types

This layer proves that `τ₃` and `τ₋₃` (0.4) are weakly acceptable for a très ramifié residual representation with `ρ̄|_{I₃} ≅ (ω, ∗; 0, 1)`. After an unramified twist `ρ̄` is the nonsplit extension `0 → ω → ρ̄ → 1 → 0`, and `S_{±3}` is the category of 2.6, cut out by the operator ideal generated by `F + V` and `[γ₄²] + 1`. The splitting fields `F′_{±3}` (1.5, 1.6) and the three conductor-243 fields `F′_i` (1.7) all have `e = 12`, `f = 2`, residue field `𝔽₉`, and a Galois group generated by `γ₂` (a Frobenius lift of order 2), `γ₃` (wild inertia, order 3) and `γ₄` (tame inertia, order 4), with `γ₄²` the unique element of order two in the inertia subgroup over the quadratic subfield. Write `S₃₆ = 𝔽₃[u]/(u³⁶)` and `S′₃₆ = 𝔽₉[u]/(u³⁶)`. A model over `𝒪_{F′}` has Breuil module `M′` over `S′₃₆`. Unramified descent by `γ̂₂` gives its module `M` over `S₃₆`, with `M′ ≅ 𝔽₉ ⊗_{𝔽₃} M`; the normal forms and adapted bases below are for `M`, while all descent operators act on `M′`, with `γ̂₂` cubing coefficients. The rank-one and adapted-basis results 4.1–4.2 are stated for all five degree-twelve fields because Layer W3.5 uses them for `F′_i` as well.

We write `M′_{r,χ}` for the rank-one Breuil module with descent (over `F′`) whose generic fibre is the character `χ ∈ {1, ω}` and whose filtration is `u^r·M`.

### 4.1 Rank-one descent in the degree-twelve families

**Theorem.** Let `F′` be one of `F′₃, F′₋₃, F′_i` with uniformizer `π` and Eisenstein polynomial `u¹² − 3G(u)`, and `c₀ := c_π(0)` (so `c₀ = −1` for `F′₃` and `c₀ = 1` for `F′₋₃` and `F′_i`). The models over `𝒪_F` of the constant group are `M(r, c₀)` and those of `μ₃` are `M(r, 1)`, for even `r ∈ {0, 2, …, 12}`; the constant model is `r = 12` and the multiplicative model `r = 0`. After extending scalars to `𝔽₉`, the descent datum compatible with the generic fibre is `γ̂₂(e) = e`, `γ̂₄(e) = −(−j)^{r/2}·e` for the constant character and `γ̂₄(e) = (−j)^{r/2}·e` for `ω`, and `γ̂₃^{±1}(e) = H_{γ₃^{±1}}^{−3r/2}·e`. The special-fibre involution `[γ₄²]` acts by `−1` exactly when `r ∈ {2, 6, 10}`.

*Proof sketch.* The rank-one classification of 2.2 with `e = 12` lists the models; the models of a fixed group of order three have `r` in one residue class modulo `ℓ − 1 = 2`, here the even one. The tame descent `γ̂₄` is fixed by Frobenius compatibility (`H_{γ₄} = −j`, `t_{γ₄} = 0`) and by comparing with the two extreme models, whose descent is the canonical one; uniqueness of compatible descent (2.3) gives the wild operator. Since `γ₄` acts trivially on `𝔽₉`, `[γ₄²]` acts by the square of the `γ̂₄`-eigenvalue, `(−j)^r = (−1)^{r/2}`, which is `−1` exactly when `r ≡ 2 mod 4`. (BCDT, Lemma 8.1.1, pp. 911–912; Lemma 9.1.1, p. 919.) *Needs:* 1.5, 1.6, 1.7, 2.2, 2.3.

**Checks.**

- `r = 12` (étale, constant character): `γ̂₄(e) = −(−j)⁶e = e`, the trivial action, as it must be on an étale model of a constant group.
- `r = 4`: `[γ₄²] = (−1)^{r/2} = +1`, so `M(4, c₀)` is excluded by the operator ideal although it is a legitimate model of the constant group.
- `c₀ = c_π(0)` is `−1` for `F′₃` and `+1` for `F′₋₃`, so the étale models of the two quadratic families have different Frobenius constants.

### 4.2 Adapted bases for filtered descent models

**Theorem.** In any of the five degree-twelve families, let `𝒢` be a finite flat model with descent, killed by 3, whose generic fibre is filtered with graded pieces among `1` and `ω`, and whose induced Breuil filtration has graded pieces `M′_{r_j, χ_j}` with `r_j ∈ {2, 6, 10}`. Then `[γ₄²] = −1` on the special fibre, and the module `M` over `S₃₆` obtained by unramified descent from `M′ = M_π(𝒢)` has a basis `e_j` adapted to the filtration, lying in `φ₁(M₁)`, mapping to the standard generator of each graded piece, and consisting of eigenvectors of `γ̂₄` after extension of scalars to `𝔽₉`.

*Proof sketch.* `[γ₄²]` is an involution of order dividing two acting by `−1` on each graded piece (4.1), and an involution with that property is `−1` because 2 is invertible. Lift generators inductively inside the image of `φ₁` as `γ̂₄`-eigenvectors (the eigenspace decomposition exists over `𝔽₉`), then average a lift with its `γ̂₂`-transform; division by two is allowed, the relation `γ₄γ₂ = γ₂γ₄^{−1}` preserves the eigenvalue, and the average lies in the `𝔽₃`-span of `φ₁(M₁)`. (BCDT, Lemma 8.1.2, p. 912; Lemma 9.1.2, p. 919.) *Needs:* 4.1, 2.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20.

**Checks.**

- For a rank-one model the adapted basis is the standard generator.
- For `M′_{2,1} ⊕ M′_{2,ω}`, the standard generators are a basis of the descended `M` over `S₃₆`; on `M′` their `γ̂₄`-eigenvalues are `j, −j`. Since `j² = −1` has no solution in `𝔽₃`, multiplication by `j` requires `S′₃₆`. Also `γ̂₂(je) = j³e = −je`, while `γ̂₂(e) = e`.
- If some `r_j = 4` the hypothesis fails and `[γ₄²]` is not `−1` (4.1).

### 4.3 The unique residual model

**Theorem.** For `δ = ±3`, the normalized très ramifié `ρ̄` has exactly one model with descent over `𝒪_{F′_δ}` annihilated by `I_δ`, up to isomorphism compatible with the generic identification. Its Breuil module is an extension `0 → M′_{10,1} → M′(ρ̄) → M′_{2,ω} → 0`, and the Frobenius `F` of its special-fibre Dieudonné module is nonzero.

*Proof sketch.* By 4.1 both rank-one weights lie in `{2, 6, 10}`; use an adapted basis (4.2) and the extension gauge of 2.2. Pairs `(r, s)` with `r > s` are excluded by generic splitting, Cartier duality and the nonzero très class. For `(6, 6)` the constant term of the `γ₃` descent equation excludes one sign, and the other sign gives only peu ramifié generic fibres (compare the local curves of 1.16); for `(2, 6)` the analogous constant equation has no solution over `𝔽₃` in one sign and only peu fibres in the other; `(6, 10)` is dual to `(2, 6)`. Only `(2, 10)` remains, and its extension parameters inject into generic `Ext`, which gives uniqueness. Existence: Manoharmayum's degree-twelve curves (1.12) have très ramifié 3-torsion of this shape and, by the cross-prime comparison 1.13, 3-adic Tate modules of type `τ_{±3}`; their 3-torsion has a model annihilated by `I_δ` by 2.11. The good special fibre of this elliptic curve has Frobenius and Verschiebung of degree three, whereas its 3-torsion has order nine. Thus neither operator kills the whole 3-torsion, and the Dieudonné comparison of 2.1 gives `F ≠ 0` on the residual model. The identities `F + V = 0` and `FV = 3` alone would not prove this: on a module killed by 3 they also allow `F = V = 0`. (BCDT, Proposition 8.2.1, pp. 912–917.) *Needs:* 2.6, 2.11, 4.1, 4.2, 2.2, 2.3, 1.12, 1.13, 1.16, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20.

**Checks.**

- The weight pair is `(2, 10)` (sub `M′_{10,1}`, quotient `M′_{2,ω}`), not `(10, 2)`: the reversed order is the split class.
- the integral model, with its nonzero special-fibre Frobenius, is unique.
- The peu ramifié extensions of the same shape are realized by `(6, 6)`-models, so the très hypothesis is what removes `(6, 6)`.

### 4.4 Pushout–pullback vanishing

**Theorem.** For the residual model `M′(ρ̄)` of 4.3, pulling back along `M′_{10,1} → M′(ρ̄)` and pushing out along `M′(ρ̄) → M′_{2,ω}` sends every self-extension killed by 3 in the Breuil descent category annihilated by `I_{±3}` to zero in `Ext¹(M′_{10,1}, M′_{2,ω})`. Consequently `Θ₀ = 0` on `Ext¹_{S_{±3}[3]}(ρ̄, ρ̄)`.

*Proof sketch.* A reversed rank-two extension has filtration `⟨u²e_ω, u¹⁰e′₁ + (c + c′u)·e_ω⟩`; the `γ̂₄`-eigenvalues force `c′ = 0`. If `c ≠ 0`, a rank-three subquotient has filtration generators `u²e_ω, u¹⁰e′₁ + e_ω, u²e′_ω + h·e′₁ + (b + b′u)e_ω` with `h = a + a′u⁴ + a″u⁸`, and `u¹²M ⊆ M₁` forces `a = 0`; the resulting residual model has zero special-fibre Frobenius, contradicting 4.3. So `c = 0`. The contravariant translation, with schematic closures, gives `Θ₀ = 0`. (BCDT, Lemma 8.3.1 and Corollary 8.3.2, pp. 917–918.) *Needs:* 4.2, 4.3, 2.8, 2.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20.

**Checks.**

- The contradiction uses the nonzero Frobenius of 4.3; the tame involution alone does not exclude `c ≠ 0`.
- `c = c′ = 0` is the split reversed extension.

### 4.5 Unramified diagonal extensions

**Theorem.** The generic-fibre images of `Ext¹(M′_{10,1}, M′_{10,1})` and `Ext¹(M′_{2,ω}, M′_{2,ω})` lie in the unramified line of `H¹(G₃, 𝔽₃)`. Consequently `Θ_ω = 0` on `Ext¹_{S_{±3}[3]}(ρ̄, ρ̄)`.

*Proof sketch.* By Cartier duality it suffices to treat weight two. The gauge relation leaves `h = c + c′u + c″u²`, and the tame descent forces `c = c′ = 0`. Over a residue-field extension containing a root of `a³ = a + c″` the module splits; this is an unramified extension of `ℚ₃`, so the inertia restriction of the generic class vanishes. (BCDT, Lemma 8.3.3, pp. 918–919; Theorem 4.7.4, p. 882.) *Needs:* 4.2, 4.3, 4.4, 2.8, 2.3.

**Checks.**

- `c″ = 0` gives the split self-extension; `c″ = 1` gives a nonsplit unramified one (an Artin–Schreier extension of `𝔽₉`).
- The splitting field is unramified over `ℚ₃`; splitting over the totally ramified `F₃` alone would not kill the inertia class.

### 4.6 The quadratic tangent bound

**Theorem.** For the normalized très ramifié `ρ̄` and `δ = ±3`, `dim_{𝔽₃} H¹_{S_δ}(G₃, ad⁰ρ̄) ≤ 1`.

*Proof sketch.* 4.4 and 4.5 put the fixed-determinant tangent in `ker Θ₀ ∩ ker Θ_ω`, a line by 2.9. (BCDT, Theorem 4.5.1, p. 877; Theorem 4.7.4, p. 882. The comparison at the end of §8.3, p. 918, refers to Theorem 4.4.1 where Theorem 4.5.1 is meant.) *Needs:* 4.4, 4.5, 2.9.

### 4.7 Weak acceptability of the ramified quadratic types

**Theorem.** Let `ρ̄ : G₃ → GL₂(𝔽₃)` be continuous with `ρ̄|_{I₃} ≅ (ω, ∗; 0, 1)` très ramifié. Then `τ₃` and `τ₋₃` are weakly acceptable for `ρ̄`.

*Proof sketch.* After an unramified twist and with `𝒪 = ℤ₃`, the type quotient factors through `R^{ε, S_δ}_{V,ℤ₃}` (2.11), whose tangent has dimension at most one (4.6). Change coefficients by LocalGaloisDeformationRings §1.12. (BCDT, Theorem 2.1.4, p. 862; §4.5, pp. 876–877.) *Needs:* 4.6, 2.11, LocalGaloisDeformationRings §3.12 and §1.12.

**Checks.**

- Weak acceptability allows the zero ring and asserts no formal smoothness.
- The hypothesis is on `ρ̄|_{I₃}` only, unlike the extended case of Layer W3.5, which needs the full `G₃`-shape.

### Examples

- The curves `y² = x³ + 3x + 2` and `y² = x³ + 3x + 6` (1.12) have conductor exponent 3 at 3 and `e = 12`, with quadratic field `ℚ₃(√3)` and `ℚ₃(√−3)` respectively; their Tate modules have types `τ₃` and `τ₋₃` up to twist.
- On `M′_{2,1}`: `γ̂₄(e) = −(−j)e = j·e`, so `[γ₄²] = j² = −1`, as required by the ideal.

### Dependencies

Layers W3.1 (the degree-twelve fields, Manoharmayum's curves, the cross-prime comparison) and W3.2 (Breuil modules with descent, the categories `S_{±3}`, the comparison maps); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20; LocalGaloisDeformationRings §1.12 and §3.12.

## Layer W3.5: The conductor-243 extended types

This layer proves that each extended type `τ′_i`, `i ∈ ℤ/3` (0.5), is weakly acceptable for a continuous `ρ̄ : G₃ → GL₂(𝔽₃)` that is, as a representation of the whole of `G₃`, a très ramifié nonsplit extension `0 → ω → ρ̄ → 1 → 0`. Here the inertial condition is not enough and the full Weil class of `τ′_i`, including its value at a uniformizer, enters through the third generator of the operator ideal `I_i` of 2.7. The fields are the `F′_i` of 1.7 (`e = 12`, `f = 2`); as in Layer W3.4 their descended modules use `S₃₆` and their primed modules use `S′₃₆`, and `M′_{r,χ}` is as in Layer W3.4.

The argument differs from the quadratic case. There is no single residual model: models of `ρ̄` annihilated by `I_i` fall into four families indexed by weight pairs `(r, s) ∈ {(2,6), (6,10), (2,10), (6,6)}` (5.1–5.2), each giving a filtered deformation condition `S_{i,(r,s)}` (5.6) whose tangent space is at most a line (5.7–5.8). For the three pairs other than `(6, 6)` the deformation ring turns out to be `𝔽₃[[T]]`, killed by 3 (5.9–5.10), so no characteristic-zero point can use them; the type points therefore factor through the exceptional `(6, 6)` condition (5.11), and weak acceptability follows (5.12).

### 5.1 The four residual model families

**Construction.** In the category of Breuil modules with descent over `F′_i` annihilated by `I_i`, construct for `(r, s) ∈ {(2,6), (6,10), (2,10)}` and parameters `(c, c₁) ∈ 𝔽₃²` the extension `0 → M′_{s,1} → M′_{r,s}(c, c₁) → M′_{r,ω} → 0` whose descended module `M` has basis `e₁, e′_ω` over `S₃₆`, with `M′ = 𝔽₉ ⊗_{𝔽₃} M` over `S′₃₆`, and filtration `⟨u^s·e₁, u^r·e′_ω + h·e₁⟩`, `φ₁` sending the two generators to `e₁` and `e′_ω`, `N(e₁) = N(e′_ω) = 0`, and

```text
(r,s) = (2,6):   h = c·u²,  γ̂₃^{±1}: e₁ ↦ e₁,               e′_ω ↦ (1 ± u¹⁸)(e′_ω ± c₁u⁶·e₁)
(r,s) = (6,10):  h = c·u⁶,  γ̂₃^{±1}: e₁ ↦ (1 ∓ u¹⁸)e₁,     e′_ω ↦ e′_ω ± c₁u⁶·e₁
(r,s) = (2,10):  h = c·u⁸,  γ̂₃^{±1}: e₁ ↦ (1 ∓ u¹⁸)e₁,     e′_ω ↦ (1 ± u¹⁸)(e′_ω ± c₁u¹²·e₁)
```

with `γ̂₄`-eigenvalues `(−j, −j)`, `(j, j)`, `(j, −j)` on `(e₁, e′_ω)` respectively. For `(6, 6)` and `(c, c′) ∈ 𝔽₃²`: filtration `⟨u⁶·e₁, u⁶·e′_ω + (c + c′u⁴)·e₁⟩`, `N(e′_ω) = c′u³⁰·e₁`, `γ̂₄`-eigenvalues `(−j, j)`, and `γ̂₃^{±1}(e′_ω) = e′_ω + (±c ∓ c′u¹² − c′u³⁰)·e₁`, `γ̂₃^{±1}(e₁) = e₁`. In every case `γ̂₂` acts by the Frobenius of `𝔽₉` on coefficients. The descent operators are the corrected wild ones of 2.3, not a semilinear group action commuting with `φ₁`.

- for each pair and parameters, the data define an `I_i`-annihilated Breuil module with descent, hence (2.1, 2.3) a finite flat model with descent.
- the filtration, `φ₁`, `N` and descent operators are exactly the displayed ones.
- the module is a strict extension of `M′_{r,ω}` by `M′_{s,1}`.
- the special-fibre Frobenius is zero in the first three families, and in `(6, 6)` it vanishes exactly when `c = 0`.
- the contravariant generic fibre is an extension of `1` by `ω` of `𝔽₃[G₃]`-modules.

*Construction.* Start from the general extension polynomial of 2.2, reduce it with the gauge relation and the tame eigenbasis of 4.2, then solve the wild equation `γ̂₃ ∘ φ₁ = (1 + t_{γ₃}N) ∘ φ₁ ∘ γ̂₃` with `t_{γ₃^{±1}} ≡ −1 ∓ u⁶` (1.7), together with the cocycle relation between `γ̂₃` and `γ̂₃^{−1}` and the correction terms `f_{γ,γ′}`. In the `(6, 6)` family the third generator of `I_i` identifies the wild constant with `c`. Check filtration containment `u¹²M ⊆ M₁`, generation by `φ₁`, and the monodromy relation `N ∘ φ₁ = φ ∘ N`. (BCDT, Proposition 9.2.1 and its proof, pp. 920–927.) *Needs:* 2.7, 4.1, 4.2, 2.1, 2.2, 2.3, 1.7, Mathlib `AdjoinRoot`, `Submodule.span`.

**Checks.**

- at zero parameters each family is the split extension with the canonical rank-one descent of 4.1.
- in `(6, 6)` with `c′ = 1`, `N(e′_ω) = u³⁰e₁ ≠ 0` in `S₃₆`: a descent calculus with `N = 0` (tame descent) fails here.
- in `(6, 6)` with `c = 1` the special-fibre Frobenius is nonzero, while in the `(2, 6)` family it is zero for every parameter: the four families are not one family.
- in `(2, 10)` with `c₁ = 1`, the `γ̂₃` cross term begins at `u¹²`, not `u⁶` as in `(2, 6)`.
- in `(6, 6)`, both `γ̂₃` and `γ̂₃^{−1}` contain the term `−c′u³⁰·e₁` with the same sign: the inverse is not the naive sign change.
- At `(c,c′) = (1,0)`, `(1,u⁶)` belongs to `⟨(u⁶,0),(1,u⁶)⟩`, but `(0,1)` does not: its second coordinate is not divisible by `u⁶`. Replacing this submodule by the whole module fails the second test. In `⟨(u⁶,0),(u²,u⁶)⟩`, every first coordinate is divisible by `u²`, so `(1,u⁶)` does not belong; this distinguishes the unit cross term.
- in `(6, 6)` with `c = 1, c′ = 0`, the second filtration generator is `u⁶e′_ω + e₁`, whose `e₁`-coefficient is a unit, and the special-fibre Frobenius is nonzero; replacing the forward polynomial `c + c′u⁴` by the diagonal self-extension polynomial `cu² + c′u⁶` of 5.4 would make this coefficient divisible by `u²` and lose the family.

### 5.2 Classification and generic `Ext` of the extended models

**Theorem.** (i) Every object killed by 3 of the `I_i`-annihilated descent category whose generic fibre is isomorphic to the fixed nonsplit très ramifié `ρ̄` lies in one of the four families of 5.1. (ii) For every parameter value, including zero, the generic fibre identifies the `Ext`-group of each family with `H¹(G₃, ω) ≅ 𝔽₃²`. In the three families other than `(6, 6)` the generic class splits over `F_i` (equivalently `F′_i`) iff `c = 0`, splits over `ℚ₃` iff `c = c₁ = 0`, and is peu ramifié iff `c₁ = 0`. In `(6, 6)` the same three conditions are `c + c′ = 0`, `c = c′ = 0` and `c = 0`. (iii) The canonical rank-one morphisms `u⁶` from `(6, 6)` to `(2, 6)` and to `(6, 10)` send the parameters `(c, c′)` to `(c + c′, c)`.

*Proof sketch.* (i) Take the schematic closure of the generic `ω`-line and use an adapted basis and the ideal: every other weight pair forces the generic extension to split over `ℚ₃`, which the très hypothesis excludes. This exclusion is not claimed for split generic fibres. (ii) Compute the kernel of generic `Ext` over `F_i`, then which splittings descend to `ℚ₃`; injectivity and a parameter count give the isomorphisms. (iii) Compute the induced map on extension polynomials, including the change of lifted basis. Finally, the two très ramifié paired local curves that do not split over `F_i` (1.16) have nonzero special-fibre Frobenius, so their `(6, 6)` lines are `c′ = 0` and `c = c′`; the remaining line not split over `F_i`, `c = 0`, is the peu line. (BCDT, Theorem 4.6.1(1)–(3), p. 877; Proposition 9.2.1 and its proof, pp. 920–927, especially pp. 922–923 and 925–927.) *Needs:* 5.1, 1.16, 1.1, 2.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20.

**Checks.**

- the object `M′_{2,1} ⊕ M′_{2,ω}` is annihilated by `I_i` (its special fibre has `F = V = 0`), is a model of the split generic extension, and has weight pair `(2, 2)`, which is none of the four: part (i) needs the nonsplit hypothesis.
- In `(6, 6)` the line `c + c′ = 0` is the line of classes split over the type field, not the peu line.
- `(c, c′) = (1, 0)` maps to `(1, 1)` in `(2, 6)`: nonzero `c₁`, so a très class goes to a très class.

### 5.3 Reversed extensions

**Theorem.** For `(r, s) ∈ {(2,6), (6,10), (2,10)}`, `Ext¹(M′_{s,1}, M′_{r,ω}) = 0` in the `I_i`-annihilated descent category. For `(6, 6)` the generic fibre gives instead an isomorphism `Ext¹(M′_{6,1}, M′_{6,ω}) ≅ H¹(G₃, ω) ≅ 𝔽₃²`; the reversed family has filtration `⟨u⁶e_ω, u⁶e′₁ + (c + c′u⁴)e_ω⟩`, `φ₁`-images `e_ω, e′₁`, `N(e′₁) = c′u³⁰e_ω`, `γ̂₄`-eigenvalues `(j, −j)`, `γ̂₂` the coefficient Frobenius, and `γ̂₃^{±1}(e′₁) = e′₁ + (±c ∓ c′u¹² − c′u³⁰)e_ω`.

*Proof sketch.* Reduce the reversed extension polynomial as in 5.1. In the three nonexceptional pairs the ideal and the wild descent equations force every parameter to vanish (use Cartier duality for `(6, 10)`). For `(6, 6)` the computation keeps two parameters, and generic splitting plus descent give the isomorphism. (BCDT, Lemmas 9.3.1–9.3.2, pp. 927–929.) *Needs:* 5.1, 4.2, 2.3.

**Checks.**

- The vanishing does not extend to `(6, 6)`: there the reversed `Ext` is two-dimensional.
- At `c = c′ = 0` the reversed `(6, 6)` extension is split.

### 5.4 Diagonal extensions at weights two, six and ten

**Theorem.** For `r ∈ {2, 10}` and `χ ∈ {1, ω}`, the generic fibre embeds `Ext¹(M′_{r,χ}, M′_{r,χ})` into `H¹(G₃, 𝔽₃)` with image exactly the unramified line. For `r = 6` it is an isomorphism onto the whole of `H¹(G₃, 𝔽₃)` (dimension two). At `r = 6` the self-extensions have filtration `⟨u⁶e, u⁶e′ + (cu² + c′u⁶)e⟩`, `φ₁`-images `e, e′`, `N(e′) = −c·u²⁴·e`, `γ̂₃` fixing `e` and `γ̂₃^{±1}(e′) = e′ + c(±u⁶ ± u¹⁸ − u²⁴ ± u³⁰)e`; the class is unramified exactly when `c = 0`.

*Proof sketch.* At `r = 2` the gauge and the `γ̂₄` action leave only `h = cu²`, and an unramified residue extension solving `a³ = a + c` splits it; `r = 10` is dual. At `r = 6` the gauge leaves degrees two and six; solve the corrected wild Frobenius equation and compute `N`. Splitting after unramified extension happens exactly on `c = 0`; full faithfulness of the generic fibre and the dimension count give the image statements. (BCDT, Lemmas 9.3.3–9.3.4, pp. 929–931.) *Needs:* 4.1, 4.2, 2.3, 1.1.

**Checks.**

- At `r = 6`, `c = 1`, `c′ = 0` gives a ramified diagonal class: the blanket statement "diagonal self-extensions are unramified" is false at weight six.
- At `r = 2`, `c = 1` gives a nonsplit class; it splits over the unramified extension whose residue field contains a root of `a³ = a + 1`, a cubic extension of the residue field.

### 5.5 Coefficient actions preserve the four weight pairs

**Theorem.** Let `k/𝔽₃` be a finite extension and `𝒢` an `I_i`-annihilated finite flat model with descent carrying a `k`-action whose generic fibre is `ρ̄ ⊗_{𝔽₃} k`. Then `𝒢` has a descent-compatible filtration with generic pieces `ω ⊗ k` and `k`, whose Breuil weights `(r_ω, r₁)` form one of the pairs `(2,6), (6,10), (2,10), (6,6)`; the Breuil modules of these two graded pieces, descended to the degree-twelve totally ramified field `F_i`, are free of rank one over `k[u]/(u³⁶)`, with Frobenius coefficients in `k^×`. Over `F′_i` they are obtained by base change to `(k ⊗_{𝔽₃} 𝔽₉)[u]/(u³⁶)`; no linear-disjointness assumption on `k` and `𝔽₉` is made.

*Proof sketch.* Take the schematic closure of the generic `ω ⊗ k`-line, which is unique and `k`-stable, and apply the coefficient version of the rank-one classification (2.2). Projecting to an `𝔽₃`-copy of `ρ̄` and using a finite flat quotient rules out `r₁ = 2`; an `𝔽₃`-subobject rules out `r_ω = 10`. The remaining pairs are the four families, and changing basis by Frobenius puts the coefficients in uniform form. (BCDT, Theorem 4.6.1(3), p. 878; §9.4, pp. 931–932.) *Needs:* 5.2, 4.1, 2.2, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20.

**Checks.**

- For `k = 𝔽₃` this is 5.2(i).
- For `k = 𝔽₉`, `k ⊗_{𝔽₃} 𝔽₉ ≅ 𝔽₉ × 𝔽₉`; each graded piece has scalar rank one, while the whole residual module has scalar rank two. Treating the coefficient tensor product as a field or the whole model as rank one fails these dimensions.
- The filtration is a filtration of the integral object with descent, not only of its semisimplified generic fibre.

### 5.6 The four filtered deformation conditions

**Definition.** Fix `i` and one of the four pairs, and let `G_{i,(r,s)}` be the residual model of 5.2 with its generic identification with `ρ̄`. Let `S_{i,(r,s)}` be the full subcategory of `S(ρ̄)` (finite-length `ℤ₃[G₃]`-modules with a filtration by copies of `ρ̄`) consisting of generic fibres of `I_i`-annihilated models with descent that are weakly filtered by the singleton `{G_{i,(r,s)}}`: some filtration by closed subobjects with descent has all graded pieces isomorphic to `G_{i,(r,s)}`. All torsion exponents are allowed.

- membership means the existence of such a weakly filtered model with the given generic fibre.
- changing the basis of `G_{i,(r,s)}`, or replacing it by an isomorphic model with the same generic identification, gives the same category.
- the category is closed under finite products and under `S(ρ̄)`-subobjects and quotients.
- weakly filtered objects are strongly filtered (every generic `ρ̄`-filtration lifts with graded pieces `G_{i,(r,s)}`); also every object is strongly filtered by the two rank-one pieces.
- the fixed-cyclotomic-determinant deformation ring of this condition is the ring of LocalGaloisDeformationRings §8.6, with tangent space `H¹_{S_{i,(r,s)}}(G₃, ad⁰ρ̄)`.

*Construction.* The singleton satisfies the `Hom` condition (endomorphisms `𝔽₃`, nothing else) and, by 5.2(ii) and 5.3–5.4, the injectivity of `Ext¹` of its rank-one pieces into generic `Ext¹`. The weak-to-strong criterion and the closure properties of 2.4 then give the strong filtration, closure under subquotients and independence of the chosen residual model. (BCDT, §4.6, p. 878; §§4.1–4.2, pp. 868–874; Theorem 4.6.1, pp. 877–878.) *Needs:* 2.7, 2.4, 5.2, 5.3, 5.4, LocalGaloisDeformationRings §8.6.

**Checks.**

- the zero module, with the empty filtration, belongs to every `S_{i,(r,s)}`.
- `ρ̄` itself belongs, through the one-step filtration by `G_{i,(r,s)}`.
- the split module `1 ⊕ ω` does not belong: it has no filtration with graded pieces the nonsplit `ρ̄`.
- the 9-torsion of the 3-divisible group of a lift of extended type `τ′_i` (5.11) is strongly filtered by `G_{i,(6,6)}` and is killed by 9 but not by 3: membership does not bound the torsion exponent. For an elliptic lift this is `E[9]`, with `3E[9] = E[3] ≠ 0`; it belongs to `S_{i,(6,6)}` but not `S_{i,(6,6)}[3]`, and supplies no adjoint tangent cocycle.

### 5.7 Vanishing of the comparison maps

**Theorem.** For all four pairs, `Θ₀ = 0` on `Ext¹_{S_{i,(r,s)}[3]}(ρ̄, ρ̄)`. For the three nonexceptional pairs, `Θ₁ = 0` if `r ≠ 6` and `Θ_ω = 0` if `s ≠ 6` (so at least one diagonal comparison vanishes); for `(6, 6)`, `Θ_ω = 0`.

*Proof sketch.* For the nonexceptional pairs, 5.3 kills `Θ₀` and the extreme-weight case of 5.4 kills the indicated diagonal map. For `(6, 6)`: a rank-three subquotient of a self-extension killed by 3 has filtration `⟨u⁶e_ω, u⁶e′₁ + (b + b′u⁴)e_ω, u⁶e′_ω + (c + c′u⁴)e′₁ + f·e_ω⟩` with `c ≠ 0`, and `u¹²M ⊆ M₁` forces `b = b′ = 0`, which kills `Θ₀`. Then `f = a₂u² + a₆u⁶`, the rank-four filtration has second diagonal term `h ≡ −a₂u² mod u⁶`, and the corrected wild descent on the fourth generator forces `a₂c·u²` to be divisible by `u⁶`, so `a₂ = 0`; the remaining diagonal class has only the `u⁶` parameter and is unramified by 5.4. The calculation uses a finite-flat self-extension killed by 3 and `c ≠ 0`, so it applies to all self-extensions killed by 3 in the category. (BCDT, Theorem 4.7.5, p. 882; §9.6, pp. 935–937.) *Needs:* 5.2, 5.3, 5.4, 5.6, 2.8, 2.3.

**Checks.**

- At `(6, 6)` the weight-six diagonal `Ext` is two-dimensional (5.4), so `Θ_ω = 0` does not follow from 5.4 alone; the rank-four compatibility is what kills the ramified parameter.
- In `(2, 6)`, `r = 2 ≠ 6` gives `Θ₁ = 0` while `s = 6` gives no information on `Θ_ω`.

### 5.8 The four extended tangent bounds

**Theorem.** For every `i ∈ ℤ/3` and each pair `(r, s)`, `dim_{𝔽₃} H¹_{S_{i,(r,s)}}(G₃, ad⁰ρ̄) ≤ 1`.

*Proof sketch.* By 5.7 the fixed-determinant tangent lies in `ker Θ₀` and in the kernel of one diagonal map; both diagonal maps have the same one-dimensional kernel there (2.9). (BCDT, Theorem 4.6.2, p. 878; §9.6, pp. 935–937.) *Needs:* 5.7, 2.9.

### 5.9 Characteristic-three Artin deformations

**Construction.** Fix a nonexceptional pair `(r, s)` with `t = 2, 6, 8` for `(2,6), (6,10), (2,10)` respectively, residual parameters `(c, c₁)` with `c₁ ≠ 0`, and `N ≥ 1`. Over `A_N = 𝔽₃[T]/(T^N)` let `M_N` be the Breuil module over `A_N[u]/(u³⁶)` with basis `e₁, e′_ω`, filtration `⟨u^s·e₁, u^r·e′_ω + (c + T)u^t·e₁⟩`, `φ₁` sending the generators to `e₁, e′_ω`, `N(e₁) = N(e′_ω) = 0` (extended by `N(u) = u` and the Leibniz rule), Frobenius `A_N`-linear with `u ↦ u³` and `T ↦ T`, and the descent operators of 5.1 with the same `c₁`. Its group scheme `G_N` is a finite flat model with descent annihilated by `I_i` and by `F`, and its generic fibre `ρ_N` is a free rank-two `A_N`-module with determinant `ω` that reduces to `ρ̄` at `T = 0`. Bases are chosen compatibly for the reductions `A_N → A_M` for `1 ≤ M ≤ N`. For `N ≥ 2` the reduction of `ρ_N` modulo `T²` is not isomorphic to the constant deformation `ρ̄ ⊗ A₂`.

- the data define a model with `A_N`-action, annihilated by `I_i` and with `F = 0`.
- the cross term is `(c + T)u^t`, and Frobenius fixes `A_N`.
- for `1 ≤ M ≤ N`, reduction `A_N → A_M` sends `ρ_N` to `ρ_M`; for `1 ≤ M < N`, multiplication by `T^{N−M}` gives an exact sequence `0 → M_M → M_N → M_{N−M} → 0` of Breuil modules.
- the generic fibre is free of rank two over `A_N` with determinant `ω`.
- for `N ≥ 2`, the `A₂`-specialization is a nontrivial deformation.

*Construction.* Substitute `c + T` into the normal forms of 5.1 with an `A_N`-linear `u`-Frobenius and check corrected descent, generation, the ideal and `F = 0` on the special fibre. Multiplication by `T^{N−M}` gives the exact sequences, and contravariant generic fibres and order counts give freeness and residual compatibility. The rank-one generic pieces are `A_N(ω)` and `A_N`, so the determinant is `ω`. For `N = 2` the two rank-one comparison maps and a nonsplit rank-two subquotient with cross term `u^t`, together with the generic `Ext` isomorphism of 5.2, show the self-extension is nontrivial. (BCDT, Theorem 4.6.3, p. 878, and §9.5, pp. 932–935. In the source the varying representation is written with the residual symbol and coefficients `k[[T]]/(T^N)`, and the nontriviality clause is stated for all `N ≥ 1`; it holds for `N ≥ 2`, and at `N = 1` the representation is `ρ̄`.) *Needs:* 5.1, 5.2, 5.6, 2.1, 2.3, Mathlib `AdjoinRoot`, `Submodule.span`.

**Checks.**

- at `N = 1`, `T = 0` and `M₁` is the residual family at `(c, c₁)`.
- at `N = 2`, `T ≠ 0` and `T² = T³ = 0`, and the generic self-extension is nonzero although the special-fibre Frobenius is zero.
- at `N = 2`, `φ(T) = T`, whereas the absolute cube map would send `T` to `T³ = 0`: the Frobenius is `A_N`-linear, acting only on `u` and on the residue field.
- for `(2, 10)` the cross term is `(c + T)u⁸`.
- At `(N,M) = (2,1)`, multiplication by `T` gives lengths `1 → 2 → 1` on the coefficient rings and Breuil ranks `2 → 4 → 2` over `𝔽₃[u]/(u³⁶)`. The exact-sequence clause excludes `M = N`, since `M₀` is not defined.

### 5.10 The three purely characteristic-three deformation rings

**Theorem.** For each `i` and each nonexceptional pair, `R^{ε, S_{i,(r,s)}}_{V,ℤ₃} ≅ 𝔽₃[[T]]` as complete local `ℤ₃`-algebras. In particular the whole ring is killed by 3 and has no homomorphism to a ring of characteristic zero.

*Proof sketch.* The tangent bound 5.8 and the compatible nontrivial deformations 5.9 for every `N` give `R/(3) ≅ 𝔽₃[[T]]`; uniqueness of strongly filtered models (2.4) shows that `F = 0` on the Dieudonné module of the model attached to every Artinian quotient of `R/(3)`. Now let `R → A` be any Artinian quotient with model `𝒢` and contravariant Dieudonné module `D = D(𝒢)`. Exactness of the Dieudonné functor (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.8) applied to the models of `3G` and `G/3G` (which exist by 2.4) identifies `D(G/3G)` with `D[3] = ker(3 : D → D)` and `D(3G)` with `3D`. Since `G/3G` lies over an Artinian quotient of `R/(3)`, `F` kills `D[3]`; and `F + V = 0`, `FV = 3` give `F² = −3`. If `9x = 0` then `3x ∈ D[3]`, so `3·Fx = F(3x) = 0`, so `Fx ∈ D[3]` and `−3x = F²x = 0`. Hence `D[9] = D[3]`, and since `D` has finite `3`-primary length, `D = D[3]`, i.e. `3D = 0`. So `D(3G) = 0`, `3G = 0`, and as the generic representation is free over `A`, `3A = 0`. Pass to the limit. (BCDT, Corollary 4.6.4 and proof, pp. 878–879. The argument above replaces the step of the printed proof that writes `F` as `3F′` with `F′` an endomorphism of `D`, which assumes that an endomorphism of `3D` extends to `D`.) *Needs:* 5.6, 5.8, 5.9, 2.4, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.2.5 and §R07.2.8, LocalGaloisDeformationRings §8.6.

**Checks.**

- on `D = (ℤ/9)²` the additive map `F(x, y) = (−3y, x)` satisfies `F² = −3`, but `F(3, 0) = (0, 3) ≠ 0`, so `F` does not kill `D[3]`, and indeed `3D ≠ 0`. Dropping the hypothesis `F|_{D[3]} = 0` loses the conclusion.
- Residual vanishing of `F` alone is not enough: the argument uses `F|_{D[3]} = 0` at every Artinian level.
- The ring has no `ℤ₃`-point; in particular no characteristic-zero lift of `ρ̄` satisfies a nonexceptional condition.

### 5.11 Extended type points select the exceptional model

**Theorem.** For `ρ̄` as in this layer, the extended-type quotient `R^{τ′_i}_{V,ℤ₃}` is a quotient of `R^{ε, S_{i,(6,6)}}_{V,ℤ₃}`. Every Barsotti–Tate lift of extended type `τ′_i` has an integral 3-divisible model with descent annihilated by `I_i`, and the coefficient-lattice torsion levels of that model are strongly filtered by one and the same residual model `G_{i,(r,s)}`; the rings of 5.10 force `(r, s) = (6, 6)`.

*Proof sketch.* Tate's theorem (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.22, §R07.1.25, §R07.4.30) extends the 3-divisible group over `𝒪_{F′_i}` with descent and coefficient action. Its Weil–Deligne representation has `WD(γ₄²) = −1`, `WD(γ̃₂²) = −3` and `WD(γ̃₂)(WD(γ₃) − WD(γ₃)^{−1}) = 3` for the element `γ̃₂` attached to `√−3` by local reciprocity; on the Dieudonné module this gives `[γ₄²] = −1`, `F² = −3` and `F = ([γ₃] − [γ₃^{−1}])[γ₂]`, i.e. annihilation by `I_i` (2.7). At the first torsion level apply 5.5 and the weak-to-strong criterion: the level is strongly filtered by its rank-one pieces, hence by a single `G_{i,(r,s)}`; all higher levels are successive extensions of copies of the first, so the same `(r, s)` works at every level. A characteristic-zero point cannot factor through a ring killed by 3, so `(r, s) = (6, 6)`; intersecting the point kernels gives the factorization. (BCDT, §4.6, pp. 879–880.) *Needs:* 0.5, 2.7, 5.5, 5.6, 5.10, 2.4, FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.22, §R07.1.25 and §R07.4.30, LocalGaloisDeformationRings §3.12.

**Checks.**

- Choosing `(r, s)` separately at each torsion level would not give a single deformation condition; the strong filtration keeps it fixed.
- The argument uses the full Weil class of `τ′_i` (the third generator of `I_i` comes from the uniformizer value); an inertial condition gives only the quadratic ideal of Layer W3.4.

### 5.12 Weak acceptability of the extended types

**Theorem.** For every `i ∈ ℤ/3` and every continuous `ρ̄ : G₃ → GL₂(𝔽₃)` that is a très ramifié extension `0 → ω → ρ̄ → 1 → 0` of `G₃`-modules, the extended type `τ′_i` is weakly acceptable for `ρ̄`.

*Proof sketch.* With `𝒪 = ℤ₃`, 5.11 factors the extended-type quotient through `R^{ε, S_{i,(6,6)}}`, whose tangent has dimension at most one (5.8); change coefficients by LocalGaloisDeformationRings §1.12. No twist is used: the hypothesis already fixes the full `G₃`-shape, and the Weil class of `τ′_i` is kept. (BCDT, Theorem 2.1.6, p. 862; §4.6, pp. 877–880.) *Needs:* 5.8, 5.11, LocalGaloisDeformationRings §3.12 and §1.12.

**Checks.**

- The hypothesis is on `ρ̄` as a `G₃`-representation; a representation that only restricts to inertia as `(ω, ∗; 0, 1)` très ramifié but has the opposite quotient character on Frobenius is outside the statement.
- Weak acceptability allows the zero ring.

### Examples

- The local curve `y² = x³ + 9x − 3` (1.16) has très ramifié 3-torsion of shape `(ω, ∗; 0, 1)` on `G₃` and 3-adic Tate module of extended type `τ′_i` for its index `i`; by 5.11 its 3-adic deformation point lies on the `(6, 6)` condition.
- The weight pairs and their `γ̂₄`-eigenvalues: `(2,6) ↦ (−j, −j)`, `(6,10) ↦ (j, j)`, `(2,10) ↦ (j, −j)`, `(6,6) ↦ (−j, j)`.

### Dependencies

Layers W3.1 (the fields `F′_i`, Kummer theory of `ℚ₃`, the paired local curves), W3.2 (Breuil modules with wild descent, finite flat filtrations, the ideal `I_i`, the comparison maps) and W3.4 (degree-twelve rank-one descent and adapted bases); FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20, §R07.1.22, §R07.2.5, §R07.2.8, §R07.4.30; LocalGaloisDeformationRings §1.12, §3.12, §8.6.

## Layer W3.6: Global switching and the modularity theorems

This layer assembles the proof. Given `ρ̄ : G_ℚ → GL₂(𝔽₅)`, absolutely irreducible with cyclotomic determinant, it finds an elliptic curve `E/ℚ` with `E[5] ≅ ρ̄`, surjective `ρ̄_{E,3}`, and 3-adic local behaviour chosen among the cases of Layer W3.1 (6.1–6.3). The 3-adic Tate module of `E` then has one of the wild types of Layer W3.0 (6.4); since `ρ̄_{E,3}` is modular by Langlands–Tunnell (6.6), the lifting theorems (6.5) with the admittance of Layer W3.0 and the weak acceptability of Layers W3.3–W3.5 make `V₃(E)` modular (6.8), hence `E`, hence `ρ̄` (6.7, 6.10). The tame case uses Conrad–Diamond–Taylor's theorem for curves whose conductor is not divisible by 27 (6.9). Finally every `E/ℚ` is modular by switching to the prime 5 (6.11–6.13).

*Modular* is used as follows. A continuous `ρ : G_ℚ → GL₂(K)`, `K/ℚ_ℓ` finite, is modular if `ρ ⊗ ℚ̄_ℓ ≅ ρ_{f,λ}` for a weight-two newform `f` (the representation attached to `f` at a prime `λ | ℓ`, ArithmeticGaloisRepresentations Layer 6 and AutomorphicGaloisRepresentations §1.5); a residual `ρ̄ : G_ℚ → GL₂(k)` is modular if it is the reduction of a modular `ρ`, equivalently if it arises from a weight-two newform (AlgebraicModularFormsAndSerreWeights Layer R15.6, *modularity predicates and their comparisons*). An elliptic curve `E/ℚ` is modular in the sense of EllipticCurveModularity Layer R29.6: it has an attached rational weight-two newform, equivalently a surjection `J₀(N_E) → E`, equivalently a nonconstant `X₀(N_E) → E` sending `∞` to the origin (*the three equivalent modularity formulations*); only the conditional comparisons of that layer are used, never its unconditional existence theorem.

### 6.1 Local constancy of the 3-torsion near a 3-adic point

**Theorem.** Let `ρ̄ : G_ℚ → GL₂(𝔽₅)` be continuous with cyclotomic determinant, let `ℰ → Y_ρ̄(5)` be the universal curve of 1.15, and let `x₀ ∈ Y_ρ̄(5)(ℚ₃)`. There is a nonempty open neighbourhood `U` of `x₀` in `Y_ρ̄(5)(ℚ₃)` (for the 3-adic topology) such that for every `x ∈ U` the `G₃`-modules `ℰ_x[3](ℚ̄₃)` and `ℰ_{x₀}[3](ℚ̄₃)` are isomorphic.

*Proof sketch.* `ℰ[3] → Y_ρ̄(5)` is finite étale (3 is invertible on a `ℚ`-scheme); locally it is cut out by the 3-division polynomial of a Weierstrass model. By Krasner's lemma, for `x` close enough to `x₀` the roots of the specialized division polynomials are close to those at `x₀` and generate the same fields, and matching each point with its nearest neighbour gives a `G₃`-equivariant bijection; it is additive because the group law is given by rational functions continuous in `x`. The isomorphism is of full `G₃`-modules, not only of inertial semisimplifications. (BCDT, proof of Theorem 2.2.1, p. 864, where `U` is asserted.) *Needs:* 1.15, Mathlib `IsKrasner`, `IsKrasner.krasner` (`Mathlib/Analysis/Normed/Field/Krasner.lean`), TauCetiRoadmap EllipticCurves Layer 2.

**Checks.**

- At `x = x₀` the statement is trivial; the content is uniformity on a neighbourhood.
- For a fixed nonabelian degree-three mod-5 type, the families of 1.11–1.12 contain both peu ramifié and très ramifié 3-torsion. The corresponding fibres lie in the same twisted mod-5 curve, after transporting the pairing as in 1.16, but have different 3-torsion. Thus the neighbourhood cannot in general be the whole `Y_ρ̄(5)(ℚ₃)`.

### 6.2 The degree-24 three-torsion cover

**Theorem.** Let `ρ̄` be as in 6.1. Let `Y′_ρ̄ → Y_ρ̄(5)` be the quotient of the scheme of pairs `(a, b)` in `ℰ[3] ×_Y ℰ[3]` with nontrivial Weil pairing `e₃(a, b) ≠ 1` by the relation `(a, b) ∼ (−a, b)`. Then `Y′_ρ̄ → Y_ρ̄(5)` is finite étale of degree 24, and `Y′_ρ̄` is geometrically irreducible: over `ℚ̄` it is isomorphic to a modular curve of level 15 with fixed pairings. Consequently, for every nonempty open `U ⊆ Y_ρ̄(5)(ℚ₃)` there is `x ∈ Y_ρ̄(5)(ℚ) ∩ U` whose fibre in `Y′_ρ̄` is one Galois orbit of size 24, and then the image of `G_ℚ` on `ℰ_x[3]` is all of `GL₂(𝔽₃)`.

*Proof sketch.* There are 48 ordered bases of `𝔽₃²` and the relation has classes of size two. The sign relation exchanges the two values `e₃(a, b) = ζ₃^{±1}`, so it glues the two components on which the 3-adic pairing is fixed; using simultaneous sign change `(a, b) ∼ (−a, −b)` instead would leave two components. Geometric irreducibility follows from that of fixed-pairing modular curves (ModularCurvesPartII §§4.10, 6.5). Since `Y_ρ̄(5)` is an open subset of `ℙ¹_ℚ` (1.15), Hilbert irreducibility with local conditions (InverseGaloisAndArithmeticFundamentalGroups Layer IG.2, §IG.2.7, *Hilbert specialization with local conditions*) gives a rational point in `U` with irreducible fibre. A fibre of size 24 means `[ℚ(ℰ_x[3]) : ℚ] ≥ 24`, so the image has index at most two in `GL₂(𝔽₃)`; it contains `SL₂(𝔽₃)` by 1.8(4), and the determinant is the mod-3 cyclotomic character, which is surjective over `ℚ`. (Shepherd-Barron–Taylor, Theorem 1.2 and its proof, pp. 285–286; BCDT, proof of Theorem 2.2.1, p. 864, which uses Ekedahl's effective Hilbert irreducibility theorem.) *Needs:* 1.8, 1.15, 6.1, ModularCurvesPartII §§4.10, 6.5 (*geometric connectedness of a fixed-pairing curve*), §§5.1, 5.15 (level curves and level maps), InverseGaloisAndArithmeticFundamentalGroups §IG.2.7, TauCetiRoadmap EllipticCurves Layer 2 (Weil pairing; Tau Ceti `weilPairing`).

**Checks.**

- `48/2 = 24` is the degree; the quotient by `±1` acting on both entries would also have degree 24 but two geometric components.
- the full degree 24 is needed.
- The determinant argument uses `ℚ(ζ₃) ≠ ℚ`; over a field containing `ζ₃` the conclusion would only be `SL₂(𝔽₃)`.

### 6.3 A global companion with prescribed local 3-torsion

**Construction.** Let `ρ̄ : G_ℚ → GL₂(𝔽₅)` be continuous with cyclotomic determinant. Use a global quadratic twist whose restriction gives the normalized representative of 1.10, including `ξ ↦ 1` in case 3, and retain that representative throughout the construction. Such a global twist exists since each square class in `ℚ₃^×` has a rational representative. Let `E₁/ℚ₃` and `α : ρ̄|_{G₃} ≅ E₁[5]` be a local companion as in 1.16, and choose the alternating pairing on `ρ̄`, with values in `μ₅`, to be the one transported from the Weil pairing of `E₁` by `α`. Then `(E₁, α)` is a `ℚ₃`-point of `Y_ρ̄(5)`; let `U` be a neighbourhood as in 6.1. By 6.2 there is `(E, β) ∈ Y_ρ̄(5)(ℚ) ∩ U`: an elliptic curve `E/ℚ` with an isomorphism `β : ρ̄ ≅ E[5]` of `G_ℚ`-modules compatible with the pairings, with `ρ̄_{E,3} : G_ℚ → GL₂(𝔽₃)` surjective, and with `E[3]|_{G₃} ≅ E₁[3]` as `G₃`-modules. Absolute irreducibility of `ρ̄` is not needed for the construction.

- for the chosen pairing and any nonempty `U`, such a rational noncuspidal point exists.
- `β` is `𝔽₅[G_ℚ]`-linear and carries the pairing to the Weil pairing.
- `E[3]|_{G₃} ≅ E₁[3]` as continuous `G₃`-modules.
- the image of `G_ℚ` on `E[3]` is `GL₂(𝔽₃)`.
- any smaller nonempty open neighbourhood also contains such a point.

*Construction.* Combine 1.15 (so `Y_ρ̄(5)` is a nonempty open of `ℙ¹_ℚ` with a universal curve), 6.1 and 6.2. The pairing on `ρ̄` is chosen after the local identification `α`; one does not claim that an arbitrary fixed symplectic form on `ρ̄` can be moved to the Weil pairing of `E₁` by an automorphism of `ρ̄`. (BCDT, proof of Theorem 2.2.1, p. 864; Shepherd-Barron–Taylor §1, Lemma 1.1 and Theorem 1.2, pp. 285–286; Manoharmayum §2.2, pp. 737–738.) *Needs:* 1.10, 1.15, 1.16, 6.1, 6.2, TauCetiRoadmap ModularCurves §5C.

**Checks.**

- in the tame case 1 the construction runs with no condition on `E₁[3]`.
- in case 6 the full `G₃`-extension `E₁[3]`, including its indecomposability over the splitting field of `ρ̄`, is carried to `E[3]|_{G₃}`; preserving only the inertial semisimplification would lose case 6.
- the mod-3 determinant of `E` is the cyclotomic character, with nontrivial image over `ℚ`, so `SL₂(𝔽₃) ⊆ image` upgrades to `GL₂(𝔽₃)`.
- the point is in `Y_ρ̄(5)`, not at a cusp of `X_ρ̄(5)`, so it is an elliptic curve.

### 6.4 From five-torsion to the six three-adic types

**Theorem.** Let `E` be a companion from 6.3 for `ρ̄` in case `c ∈ {1, …, 6}` of 1.9 using exactly the normalized representative passed to 6.3. In case 1, a quadratic twist of `V₃(E)` is either ordinary or potentially Barsotti–Tate of a tamely ramified type, and the conductor of `E` is not divisible by 27. In cases 2, 3, 4, 5, `V₃(E)` is potentially Barsotti–Tate of type `τ₁, τ₋₁, τ₃, τ₋₃` respectively. In case 6 it is potentially Barsotti–Tate of extended type `τ′_i`, with the same `i` and with uniformizer value `+(ζ − ζ^{−1})`. In cases 2–6, `ρ̄_{E,3}` has the shape and très ramification of 1.16, as a `G₃`-representation in case 6; case 1 imposes no condition on its local 3-torsion.

*Proof sketch.* `E[5]|_{G₃} ≅ ρ̄|_{G₃}` and `E[3]|_{G₃} ≅ E₁[3]`. In the wild cases `E` has potentially good reduction at 3 with `e(E) ∈ {3, 12}`, and 1.13 transfers the inertial type of `V₅(E)`, read off from `ρ̄_{E,5}|_{I₃}`, to `V₃(E)`. In case 6 the full Weil–Deligne representation is needed: its uniformizer value is fixed by 1.13 together with the sign computation 1.14. In case 1 use the local classification of reduction types with tame `ρ̄_{E,5}|_{I₃}` (Néron–Ogg–Shafarevich and the conductor formula). (BCDT, proof of Theorem 2.2.1, p. 865; CDT, Proposition B.4.2 and the remark after it, pp. 563–565.) *Needs:* 0.3, 0.4, 0.5, 1.9, 1.10, 1.13, 1.14, 1.16, 6.3, TauCetiRoadmap EllipticCurves Layer 4, ArithmeticGaloisRepresentations §6.1–§6.3.

**Checks.**

- In case 3 the unit character is trivial on `μ₈` and has image of order three on `1 + 3ℤ₃[j]`, giving exactly `τ₋₁`. The `−3` twist of the case-3 curve in 1.16 has inertia image of order six and type `τ₋₁ ⊗ η`, so it cannot be used with the unchanged normalized tag.
- A residual mod-5 character alone is not a 3-adic Weil–Deligne representation: the comparison 1.13 is used.
- In case 6 the type is extended (it fixes Frobenius); the inertial type alone would be `τ′_i|_{I₃}`, which is not enough for 5.11.

### 6.5 The BCDT lifting theorems

Apply GL2ModularityLifting §§5.14–5.15, respectively for an `ℓ`-type and an extended `ℓ`-type. Their hypotheses are: `ℓ` odd, `K/ℚ_ℓ` finite with residue field `k`, `ρ : G_ℚ → GL₂(K)` continuous, odd and finitely ramified, `ρ̄` modular and absolutely irreducible on `G_{ℚ(√((−1)^{(ℓ−1)/2}ℓ))}`, local residual centralizer `k`, and a potentially Barsotti–Tate local lift of a type that admits `ρ̄|_{G_ℓ}` and is weakly acceptable for it; in the extended case its inertial restriction is irreducible. The types and their local admission and weak acceptability are supplied here by Layers W3.0–W3.5. (BCDT, Theorems 1.4.1–1.4.2, pp. 857–858.) *Needs:* GL2ModularityLifting §§5.14–5.15, LocalGaloisDeformationRings §3.12.

**Checks.**

- The theorem is stated for `ℚ` and odd `ℓ`; for `ℓ = 3` the irreducibility hypothesis is over `ℚ(√−3)`, for `ℓ = 5` over `ℚ(√5)`.
- "Weakly acceptable" allows `R^τ = 0`, but under the hypotheses `ρ` gives a point of `R^τ`, so it is nonzero.
- The centralizer hypothesis is on the local residual representation; a split `ρ̄|_{G_ℓ} ≅ χ₁ ⊕ χ₂` with `χ₁ ≠ χ₂` also has centralizer bigger than `k` (diagonal matrices), and is excluded.

### 6.6 Residual modularity of odd mod-3 representations

**Theorem.** Every continuous, odd, irreducible `ρ̄ : G_ℚ → GL₂(𝔽₃)` is modular: it arises from a weight-two newform.

*Proof sketch.* Odd and irreducible over `𝔽₃` imply absolutely irreducible (ArithmeticGaloisRepresentations Layer 4, *complex conjugation and oddness*). `GL₂(𝔽₃)` lifts to `GL₂(ℤ[√−2])`, giving an odd irreducible Artin representation with solvable image, which by Langlands–Tunnell comes from a weight-one newform `g` whose reduction is `ρ̄` (GL2AutomorphicRepresentationsAndTransfer Layer R17.5, *the octahedral mod-3 application*). Multiplying `g` by the weight-one Eisenstein series attached to the quadratic character of `ℚ(√−3)`, whose `q`-expansion is congruent to `1` modulo 3, gives a weight-two form with the same eigenvalues modulo 3 at good primes, and the Deligne–Serre lifting lemma produces a weight-two eigenform reducing to `ρ̄`; the newform it comes from has the same eigenvalues at good primes, so it also reduces to `ρ̄`. (The Hasse invariant has weight two in characteristic 3, so multiplying by it would give weight three.) (Darmon–Diamond–Taylor, Theorem 3.14(a), p. 90, with Theorem 3.9 and Remark 3.6, pp. 88–89, and Definition 3.12, p. 89; Shepherd-Barron–Taylor, Introduction, p. 283.) *Needs:* GL2AutomorphicRepresentationsAndTransfer Layer R17.5, AlgebraicModularFormsAndSerreWeights Layers R15.3 (*ordinary weight congruences and weight one*), R15.5 (Deligne–Serre lifting) and R15.6, TauCetiRoadmap ModularForms Layer 0 (Eisenstein series with character), ArithmeticGaloisRepresentations Layer 4.

**Checks.**

- `ρ̄_{E,3}` for `E` a companion of 6.3 is surjective onto `GL₂(𝔽₃)`, odd (determinant of complex conjugation is `−1`) and irreducible, so the theorem applies.
- A reducible `ρ̄` (for instance `1 ⊕ ω`) is outside the statement.
- The conclusion is weight two; the Langlands–Tunnell step alone gives weight one.

### 6.7 Modularity of a curve, of its Tate modules, of its torsion, and of twists

**Theorem.** Let `E/ℚ` be an elliptic curve. (1) If `V_ℓ(E)` is modular for one prime `ℓ`, then `E` is modular. (2) If `E` is modular, then `V_ℓ(E)` is modular for every `ℓ`, and `E[ℓ]` is modular whenever it is irreducible. (3) If a residual `ρ̄ : G_ℚ → GL₂(k)` is modular and `χ` is a continuous character of `G_ℚ` of finite order with values in `k^×`, then `ρ̄ ⊗ χ` is modular; likewise for a continuous `ρ : G_ℚ → GL₂(K)` and a continuous finite-order `χ` with values in `K^×`. (4) A quadratic twist `E^χ` of a modular `E` is modular.

*Proof sketch.* (1) If `V_ℓ(E) ≅ ρ_{f,λ}`, then `a_p(f) = a_p(E)` for every prime `p ∤ ℓN_E N_f` (traces of Frobenius), so the coefficients of `f` are rational at those primes and `f` is attached to `E` (EllipticCurveModularity Layer R29.3, *attachment and uniqueness across levels*); then `E` is modular by the conditional comparisons of R29.4–R29.6. (2) By EllipticCurveModularity Layer R29.4 (*the rational Tate-module comparison*) `V_ℓ(E) ≅ V_ℓ(F)` for the attached newform `F`; reducing a lattice gives `E[ℓ]` up to semisimplification (ArithmeticGaloisRepresentations §1.8 and §6.1), which is all of it when `E[ℓ]` is irreducible. (3) Twist the newform: `f ⊗ χ` is an eigenform at good primes with `a_p(f ⊗ χ) = χ(p)a_p(f)`, and its primitive associate is a newform whose representation is `ρ_f ⊗ χ` (TauCetiRoadmap ModularForms Layer 9, *inner twists*, and Layer 4, primitive associates). (4) `V_ℓ(E^χ) ≅ V_ℓ(E) ⊗ χ`, then (3) and (1). (Darmon–Diamond–Taylor, Definition 3.12, p. 89, for modular residual representations; EllipticCurveModularity Layers R29.3–R29.6.) *Needs:* EllipticCurveModularity Layers R29.3, R29.4, R29.6, AutomorphicGaloisRepresentations §§1.5, 7.3, ArithmeticGaloisRepresentations §1.8, §6.1, §6.2, AlgebraicModularFormsAndSerreWeights Layer R15.6, TauCetiRoadmap ModularForms Layers 4 and 9, TauCetiRoadmap Chebotarev (density of Frobenius elements).

**Checks.**

- For `E = 11a1`, `E[5]` is reducible (`11a1` has a rational point of order 5), so (2) only gives that its semisimplification `1 ⊕ ω₅` is the reduction of the representation of the level-11 newform.
- (3) with `χ` the quadratic character of `ℚ(i)` and `E = 11a1`: `a_p(E^χ) = χ(p)a_p(E)` for `p ∤ 22` (the twist example of EllipticCurveModularity Layer R29.3).
- (1) needs equality of traces at almost all primes; an isomorphism of semisimplified residual representations alone does not make `E` modular.

### 6.8 Wild modularity lifting for the companion curve

**Theorem.** Let `E/ℚ` be a companion of 6.3 in one of the cases 2–6. Then `V₃(E)` is modular.

*Proof sketch.* `ρ = V₃(E)` (on a lattice) is continuous, odd, ramified at finitely many primes, with determinant `ε` (ArithmeticGaloisRepresentations §6.2). `ρ̄ = ρ̄_{E,3}` is surjective onto `GL₂(𝔽₃)`, so its restriction to `G_{ℚ(√−3)}` contains `SL₂(𝔽₃)` and is absolutely irreducible; it is modular by 6.6. Locally `ρ̄|_{G₃}` is a nonsplit très ramifié extension of two distinct characters, so its centralizer is `𝔽₃`. By 6.4, `ρ|_{G₃}` is potentially Barsotti–Tate of type `τ₁, τ₋₁, τ₃, τ₋₃` or extended type `τ′_i`; this type simply admits `ρ̄|_{G₃}` (0.6, 0.7, 0.8) and is weakly acceptable for it (3.9, 4.7, 5.12; in case 6 with the full `G₃`-shape). Apply GL2ModularityLifting §5.14 in cases 2–5 and §5.15 in case 6, with the hypotheses recorded in 6.5. (BCDT, proof of Theorem 2.2.1, p. 865; Theorems 1.4.1–1.4.2, pp. 857–858.) *Needs:* 0.6, 0.7, 0.8, 3.9, 4.7, 5.12, 6.3, 6.4, 6.5, 6.6, ArithmeticGaloisRepresentations §4.6 (bad dihedral images) and §6.1–§6.2.

**Checks.**

- The wild local inputs are the theorems of Layers W3.3–W3.5; no global modularity statement is used to obtain them.
- A bad dihedral `ρ̄_{E,3}` (projective image of order four) would fail absolute irreducibility over `ℚ(√−3)`; surjectivity excludes it.

### 6.9 Conrad–Diamond–Taylor in the tame case

**Theorem.** Let `E/ℚ` be an elliptic curve such that `ρ̄_{E,3}|_{G_{ℚ(√−3)}}` is absolutely irreducible and the conductor of `E` is not divisible by 27. Then `E` is modular.

*Proof sketch.* `ρ̄_{E,3}` is odd and irreducible, hence modular by 6.6. If `E` has potentially multiplicative reduction at 3, choose a global quadratic twist `E′` with split multiplicative reduction at 3. The local Tate-module sequence is `0 → ℚ₃(ε₃) → V₃(E′) → ℚ₃ → 0`, with selected unramified quotient; its residual inertia characters are `ω₃` and `1`, hence distinct. By 6.7(3), `E′[3]` is modular and retains absolute irreducibility on `G_{ℚ(√−3)}`. OrdinaryAutomorphicFormsAndModularityLifting §§5.7, 5.10 therefore supplies an ordinary cuspidal modular seed with that selected residual quotient. Apply ClassicalSerreModularity §I.1 with this seed and determinant `ε₃`, and then 6.7(1),(4) to recover modularity of `E`. This is the compatible ordinary-witness requirement of GL2ModularityLifting §5.9, including any imaginary-quadratic induced residual case through §I.1. Otherwise `E` has potentially good reduction at 3 and `V₃(E)` is potentially Barsotti–Tate, so Kisin's theorem over `ℚ` (GL2ModularityLifting §5.11) applies. In either case 6.7(1) gives `E` modular. (CDT's own proof treats a twist with semistable reduction at 3 by Diamond's theorem and the remaining potentially supersingular case, with tame type `ω̃₂² ⊕ ω̃₂⁶`, by CDT Theorem 7.1.1: CDT, Theorem 7.2.1 and proof, pp. 553–554.) *Needs:* 6.5, 6.6, 6.7, 1.13, GL2ModularityLifting §§5.9, 5.11, ClassicalSerreModularity §I.1, OrdinaryAutomorphicFormsAndModularityLifting §§5.7, 5.10, TauCetiRoadmap EllipticCurves Layer 4.

**Checks.**

- For the split Tate curve at `p = 3`, choose inertia `g` with `ω₃(g) = −1 = 2 ∈ 𝔽₃`. The ordered residual characters have values `(2,1)` and are distinct; the quotient is the character with value 1. Twisting both characters by a ramified quadratic character before selecting the split representative would interchange these values.
- `y² = x³ − x` (conductor 32, good reduction at 3): the theorem applies once `ρ̄_{E,3}|_{G_{ℚ(√−3)}}` is absolutely irreducible.
- `y² = x³ − 3x + 8` has conductor exponent 4 at 3 (it acquires good reduction only over a wildly ramified cubic field), so it is outside the statement; such curves are reached through 6.8 when they arise as companions.

### 6.10 Cyclotomic mod-five representations are modular

**Theorem.** Every continuous absolutely irreducible `ρ̄ : G_ℚ → GL₂(𝔽₅)` with cyclotomic determinant is modular. The statement is for `𝔽₅` itself; a representation defined only over a larger finite field is outside it.

*Proof sketch.* By 1.10, after a quadratic twist `ρ̄` is in one of the six cases; by 6.7(3) it suffices to treat the twist. Take a companion `E` from 6.3. In case 1, `E` has conductor not divisible by 27 (6.4) and `ρ̄_{E,3}` is surjective, so `E` is modular by 6.9. In cases 2–6, `V₃(E)` is modular by 6.8, so `E` is modular by 6.7(1). In all cases `ρ̄ ≅ E[5]` is irreducible, hence modular by 6.7(2). (BCDT, Theorem 2.2.1 and proof, pp. 862–865; CDT, Theorem 7.2.1, pp. 553–554.) *Needs:* 1.10, 6.3, 6.4, 6.7, 6.8, 6.9.

**Checks.**

- `ρ̄ = E₀[5]` for any `E₀/ℚ` with surjective mod-5 representation is absolutely irreducible with cyclotomic determinant, so the theorem applies to it.
- A reducible `ρ̄` (such as the 5-torsion of `11a1`) is outside the statement.
- Determinant not cyclotomic (e.g. an even `ρ̄`) is outside it; the twisted curve of 1.15 needs `det ρ̄ = χ₅`.

### 6.11 The exceptional isogeny classes

**Theorem.** Let `E/ℚ` be an elliptic curve such that neither `ρ̄_{E,5}|_{G_{ℚ(√5)}}` nor `ρ̄_{E,3}|_{G_{ℚ(√−3)}}` is absolutely irreducible. Then `E` is isogenous over `ℚ` to an elliptic curve with `j`-invariant `0`, `(11/2)³` or `−5·29³/2⁵`, and `E` is modular.

*Proof sketch.* If both residual representations are reducible, the rational point on `X₀(15)` yields, up to quadratic twisting and rational isogeny, the conductor-50 class with `j = −5·29³/2⁵`. If only the mod-3 representation is irreducible, its projective image is Klein four and its image has order eight; the curve `X₀(45)/W₉` accounts for the mixed case and gives, up to quadratic twisting, `j = (11/2)³`. If only the mod-5 representation is irreducible, its image has order sixteen; this mixed case is governed by `X₀(75)/W₂₅` and has the single noncuspidal rational point with `j = 0`, rather than being impossible. If both are irreducible, the local action at 5 contradicts the two image orders. Rational twisting preserves all the residual irreducibility hypotheses, so those hypotheses cannot impose a fixed conductor on `E`.

For the level-75 calculation use Elkies's explicit double cover of `E₀ : y² + xy + y = x³ + x² − 5x + 2`, given by `v² = (x² − 3y − x − 14)/(x − 1)`. The rank-zero curve `E₀` has eight rational points. At `(2,−4)` the function has a simple zero, giving the unique noncuspidal rational point upstairs and `j = 0`. At `(1,−1)` it has a double pole with normalized leading value `−44`; the other five finite points give the nonsquares `17, 8, −15, 5/4, 185/4`. The points over infinity are cusps. Thus both zeros and poles must be treated on the smooth cover, not by substituting into an affine equation.

**Finite modularity targets.** Fix `E₅₀ = [1,1,1,−3,1]` and `E₃₃₈ = [1,1,1,3,−5]` in Weierstrass coefficient notation (Cremona's `50b1` and `338e1`). Construct nonconstant morphisms `π₅₀ : X₀(50) → E₅₀` and `π₃₃₈ : X₀(338) → E₃₃₈` over `ℚ`, with `π_N(∞) = 0`. These are explicit subtargets of the exceptional-isogeny theorem. Use the modular-curve models of ModularCurvesPartII §§5.1–5.5 and their weight-two differentials to construct the quotient maps; verify the rational functions by polynomial identities, their extension at poles and their nonconstancy. The morphisms include their rational-function formulas and proofs of extension and nonconstancy; identifying matching Euler factors alone does not supply a morphism. The conditional converse of EllipticCurveModularity R29.6 then proves the two curves modular; 6.7 propagates this to their quadratic twists and rational isogeny classes. For `j = 0`, including all sextic twists, use CM induction and the compatible theta-series comparison.

- the two nonconstant rational morphisms, including extension over the compactification and the cusp normalization.
- modularity propagates through rational isogeny and quadratic twisting; it does not preserve conductor.

(CDT, Lemma 7.2.3 and proof, pp. 554–556; BCDT §10, pp. 937–938, for the isogeny conclusion and negative sign; Elkies, Appendix, level 75, equations (150)–(153), author-hosted pp. 54–55, for the double cover and its rational fibres; Cremona's `ecdata`, `allcurves.00000-09999`, rows `50 b 1` and `338 e 1`, for the fixed equations.) *Needs:* 6.7, ArithmeticGaloisRepresentations Layer 4, ComplexMultiplicationAndExplicitReciprocity (*CM induction and compatible-system comparison*), EllipticCurveModularity Layer R29.6, ModularCurvesPartII §5.14.

**Checks.**

- `y² = x³ + 1` (`j = 0`, conductor 36) has CM by `ℤ[ζ₃]` and lies in the first class.
- The conclusion is "isogenous to a curve with `j` in the set": curves in the same isogeny class can have other `j`-invariants.
- The last `j`-invariant is `−5·29³/2⁵`; the source prints it without the sign and BCDT §10 restores it. Directly, `E₅₀` has `Δ = −800`, `c₄ = 145`, and `j = −121945/32`; `E₃₃₈` has `Δ = −17576`, `c₄ = −143`, and `j = 1331/8`.
- A constant map from `X₀(N)` satisfies the curve equation but gives no Jacobian quotient, so it fails each finite modularity target. A rational formula verified only away from its poles also fails the target until extension over the smooth compactification is proved.
- A quadratic twist by a prime away from `2·3·5·13` keeps the residual irreducibility hypotheses and the same `j`, while introducing new bad reduction. Thus the conclusion is not that `E` itself has conductor 50 or 338.
- The `j = 0` point in the `(p,q) = (5,3)` mixed case is allowed; replacing that branch by an impossibility argument would lose it.

### 6.12 Switching at five

**Theorem.** Let `E/ℚ` be an elliptic curve. If `ρ̄_{E,5}` is modular, or if `ρ̄_{E,5}|_{G_{ℚ(√5)}}` is not absolutely irreducible, then `E` is modular.

*Proof sketch.* Suppose first `ρ̄_{E,5}|_{G_{ℚ(√5)}}` is absolutely irreducible and `ρ̄_{E,5}` is modular. If `E` has potentially multiplicative reduction at 5, choose a global quadratic twist `E′` with split multiplicative reduction at 5. Then `0 → ℚ₅(ε₅) → V₅(E′) → ℚ₅ → 0` selects the unramified quotient, and the residual inertia characters `ω₅` and `1` are distinct. Its residual representation is modular by 6.7(3) and absolutely irreducible. Since `p = 5 ≠ 3`, OrdinaryAutomorphicFormsAndModularityLifting §§5.7, 5.10 supplies an ordinary cuspidal modular seed with the selected residual quotient. Apply the full ordinary lifting theorem of ClassicalSerreModularity §I.1 with determinant `ε₅`, and untwist by 6.7; otherwise `V₅(E)` is potentially Barsotti–Tate and Kisin's theorem over `ℚ` applies (GL2ModularityLifting §5.11). Either way `V₅(E)` is modular, so `E` is by 6.7(1). Suppose next `ρ̄_{E,5}|_{G_{ℚ(√5)}}` is not absolutely irreducible. Then the image of `ρ̄_{E,5}` has order prime to 3: it lies in a Borel subgroup (order 80) or has order 16 (proof of 6.11). So inertia at 3 acts on `E[5]` through a group of order prime to 3; by 1.13 (and the Néron–Ogg–Shafarevich criterion when the reduction is potentially good, or directly when it is potentially multiplicative) `E` has tame reduction at 3 and its conductor is not divisible by 27. If `ρ̄_{E,3}|_{G_{ℚ(√−3)}}` is absolutely irreducible, `E` is modular by 6.9; otherwise by 6.11. (CDT, Theorems 7.2.2 and 7.2.4 with proofs and Lemma 7.2.3, pp. 553–556; BCDT, Theorem 2.2.2, p. 865.) *Needs:* 1.13, 6.5, 6.7, 6.9, 6.11, GL2ModularityLifting §§5.9, 5.11, ClassicalSerreModularity §I.1, OrdinaryAutomorphicFormsAndModularityLifting §§5.7, 5.10, TauCetiRoadmap EllipticCurves Layer 4.

**Checks.**

- For a split Tate curve at `p = 5`, inertia with `ω₅(g) = 2` gives the ordered residual character values `(2,1)`; its ordinary seed must retain the second, unramified quotient. At `p = 2`, the mod-2 cyclotomic character has order one and gives `(1,1)`, so this distinguished-character argument would fail.
- "`ρ̄_{E,5}` modular" is a residual hypothesis; it does not presuppose that `E` is modular.
- If `ρ̄_{E,5}|_{G_{ℚ(√5)}}` is not absolutely irreducible, no element of order 3 lies in the image, so a wild cubic or degree-twelve type at 3 (Layers W3.3–W3.5) cannot occur for such `E`.
- `11a1` (rational 5-torsion point, so `ρ̄_{E,5}` reducible): the second branch applies.

### 6.13 Every elliptic curve over ℚ is modular

**Theorem.** Every elliptic curve `E` over `ℚ` (Mathlib `WeierstrassCurve` with `IsElliptic`) is modular: there is a rational normalized cuspidal weight-two newform of level exactly the conductor `N_E` with `a_p` equal to `p + 1 − #E(𝔽_p)` at good primes, and a nonconstant `ℚ`-morphism `X₀(N_E) → E` sending the cusp `∞` to the origin. This is a proof of the end theorem of EllipticCurveModularity by the wild 3-adic route; that roadmap owns the predicate, the conductor normalization and the parametrisation.

*Proof sketch.* If `ρ̄_{E,5}|_{G_{ℚ(√5)}}` is not absolutely irreducible, apply 6.12. Otherwise `ρ̄_{E,5}` is absolutely irreducible with cyclotomic determinant (ArithmeticGaloisRepresentations §6.2), hence modular by 6.10, and 6.12 applies again. The exact level and the parametrisation come from the conditional comparisons of EllipticCurveModularity Layer R29.6. (BCDT, Theorem 2.2.2, p. 865, with CDT Theorem 7.2.4, p. 556.) *Needs:* 6.10, 6.12, EllipticCurveModularity Layers R29.4–R29.6, ArithmeticGaloisRepresentations §6.2, Mathlib `WeierstrassCurve.IsElliptic`.

The headline `ellipticCurve_modular` states the newform formulation for every integral Weierstrass model whose rational fibre is elliptic: some weight-two newform of positive level with trivial nebentypus has eigenvalue `p + 1 − #Ẽ(𝔽_p)` at each prime coprime to its level and to the model discriminant. The full theorem above supplies the conductor and parametrisation as well.

**Checks.**

- Curves with additive reduction at 3 and 5, with complex multiplication, and with `j`-invariant in the exceptional set of 6.11 are all covered; no semistability or non-CM hypothesis is assumed.
- `11a1`: `ρ̄_{E,5}` is reducible, so the first branch applies.
- For `E : y² = x³ − x` over `ℤ`, `Δ = 64` and at `p = 3` the reduction has four points including infinity, giving `a₃ = 3 + 1 − 4 = 0`. At `p = 5` it has eight points, giving `a₅ = 5 + 1 − 8 = −2`. The model is excluded at `p = 2`; a singular rational model with `Δ = 0` is excluded by `IsElliptic`.

### Examples

- Case-by-case, the local data of a companion: case 2 with `E₁ = y² = x³ − 3x + 8`, case 3 with `y² = x³ − 3x + 4`, case 4 with `y² = x³ + 3x + 2`, case 5 with `y² = x³ + 3x + 6`, case 6 with `y² = x³ + 9x − 3`.
- `|GL₂(𝔽₃)| = 48`, fibres of `Y′_ρ̄` have 24 points, `|SL₂(𝔽₃)| = 24`.

### Dependencies

Layers W3.0–W3.5; TauCetiRoadmap ModularCurves §5C, EllipticCurves Layers 2 and 4, ModularForms Layers 4 and 9, Chebotarev; ModularCurvesPartII §§4.10, 5.14, 6.5; InverseGaloisAndArithmeticFundamentalGroups §IG.2.7; GL2AutomorphicRepresentationsAndTransfer Layer R17.5; AlgebraicModularFormsAndSerreWeights Layers R15.3, R15.5, R15.6; GL2ModularityLifting §§5.9, 5.11, 5.14–5.15; ClassicalSerreModularity §I.1; OrdinaryAutomorphicFormsAndModularityLifting §§5.7, 5.10; EllipticCurveModularity Layers R29.3–R29.6; ArithmeticGaloisRepresentations Layers 4, 5 and 6; ComplexMultiplicationAndExplicitReciprocity; Mathlib `IsKrasner`.

## Downstream consumers

The end theorem 6.13 supplies a second proof of elliptic modularity through wild local types. The reusable outputs are the wild descent calculus for Breuil modules (2.1–2.4), the explicit BCDT compact-type models (0.1), Kummer theory of `ℚ₃` (1.1) and the rationality of `X_ρ̄(5)` with the degree-24 cover (1.15, 6.2). EllipticCurveModularityPartII, EllipticCurveModularityImaginaryQuadratic and EllipticCurveModularityPartIIGL2TypeAbelianVarieties are the neighbouring Part II directions; they do not use these results.

## References

- **BCDT.** C. Breuil, B. Conrad, F. Diamond, R. Taylor, *On the modularity of elliptic curves over Q: wild 3-adic exercises*, J. Amer. Math. Soc. 14 (2001), no. 4, 843–939. [Published version](https://www.ams.org/journals/jams/2001-14-04/S0894-0347-01-00370-8/S0894-0347-01-00370-8.pdf); [author copy](https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf). Locators use the published page numbers (printed page = PDF page + 842).
- **CDT.** B. Conrad, F. Diamond, R. Taylor, *Modularity of certain potentially Barsotti–Tate Galois representations*, J. Amer. Math. Soc. 12 (1999), 521–567. [Author copy](https://virtualmath1.stanford.edu/~conrad/papers/cdtmaster.pdf). Locators use the published page numbers; corrections in BCDT §10.
- **Manoharmayum.** J. Manoharmayum, *Pairs of mod 3 and mod 5 representations arising from elliptic curves*, Math. Res. Lett. 6 (1999), 735–754. [Published version](https://archive.intlpress.com/site/pub/files/_fulltext/journals/mrl/1999/0006/0006/MRL-1999-0006-0006-a012.pdf).
- **Shepherd-Barron–Taylor.** N. I. Shepherd-Barron, R. Taylor, *Mod 2 and mod 5 icosahedral representations*, J. Amer. Math. Soc. 10 (1997), 283–298. [Author copy](https://math.stanford.edu/~rltaylor/klein.pdf) (§1 is on pp. 2–4 of the author copy).
- **Darmon–Diamond–Taylor.** H. Darmon, F. Diamond, R. Taylor, *Fermat's Last Theorem*, in *Current Developments in Mathematics, 1995*, International Press. [Author copy](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) (printed page = PDF page).
- **Breuil.** C. Breuil, *Groupes p-divisibles, groupes finis et modules filtrés*, Ann. of Math. 152 (2000), 489–549 (the classification behind 2.1).
- **Berthelot–Breen–Messing.** P. Berthelot, L. Breen, W. Messing, *Théorie de Dieudonné cristalline II*, Lecture Notes in Mathematics 930 (1982), §4.2.14, for the comparison in 2.1. Cited by locator; publisher access is restricted.
- **Serre, Corps locaux.** J.-P. Serre, *Corps locaux*, Hermann, 1962, Ch. XIV §1 (local symbols and Kummer theory, used in 1.1).

- Noam D. Elkies, *Elliptic and modular curves over finite fields and related computational issues*, Appendix, level 75, equations (150)–(153), author-hosted pp. 54–55: [author PDF](https://people.math.harvard.edu/~elkies/modular.pdf).
- John E. Cremona, *ecdata*, `allcurves.00000-09999`, rows `50 b 1` and `338 e 1`: [author-maintained data](https://github.com/JohnCremona/ecdata/blob/master/allcurves/allcurves.00000-09999).
